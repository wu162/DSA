ButtonManager = {
    _data = {},
    _sharedCooldown = {}, -- 用于存储共享冷却时间
}

function ButtonManager.GetButton(self, playerName, buttonIndex)
    local playerData = self._data[playerName]
    if not playerData then
        return nil
    end
    return playerData[buttonIndex]
end

function ButtonManager.SetButton(self, buttonData)
    if not buttonData or not buttonData.PlayerName or not buttonData.ButtonIndex then
        exMessageAppendToMessageArea("错误：按钮数据不完整，无法设置按钮")
        return
    end

    local playerName = buttonData.PlayerName
    local buttonIndex = buttonData.ButtonIndex
    
    local playerData = self._data[playerName]
    if not playerData then
        playerData = {}
        self._data[playerName] = playerData
    end
    local previousButton = playerData[buttonIndex]
    if previousButton ~= nil and previousButton ~= buttonData then
        -- 假如新设置的按钮和之前的按钮不同，则需要处理之前的按钮
        if previousButton.SharedCooldownId then
            -- 如果之前的按钮有共享冷却时间，则移除它
            self:_removeSharedCooldown(previousButton)
        end
    end
    playerData[buttonIndex] = buttonData
    if buttonData.SharedCooldownId then
        -- 如果当前按钮有共享冷却时间，则添加它
        self:_addSharedCooldown(buttonData)
    end

    local isButtonEnabled = 1
    if not buttonData.IsEnabled or buttonData.IsEnabled == 0 then
        isButtonEnabled = 0
    end
    exCenterTopBtnShowForPlayer(playerName, buttonIndex, buttonData.IconId, buttonData.Text)
    exCenterTopBtnSetEnableForPlayer(playerName, buttonIndex, isButtonEnabled)
end

function ButtonManager.OnClick(self, playerName, buttonIndex)
    local buttonData = self:GetButton(playerName, buttonIndex)
    if not buttonData then
        return
    end
    if type(buttonData.OnClick) == "function" then
        buttonData:OnClick()
    else
        exMessageAppendToMessageArea(format("%s 点击了按钮 %d，但该按钮没有定义点击事件", playerName, buttonIndex))
    end
end

function ButtonManager.SharedCooldown(buttonData)
    local sharedCooldownId = buttonData.SharedCooldownId
    if not sharedCooldownId then
        exMessageAppendToMessageArea("错误：按钮没有定义共享冷却时间 ID")
        return
    end
    local list = self._sharedCooldown[sharedCooldownId]
    if not list then
        return
    end
    for i = 1, getn(list) do
        local currentButton = list[i]
        if currentButton ~= buttonData then -- 避免自己触发自己的冷却
            if type(currentButton.SharedCooldown) == "function" then
                currentButton:SharedCooldown()
            else
                exMessageAppendToMessageArea(format("玩家 %s 的按钮 %s 没有定义共享冷却事件", currentButton.PlayerName or "?", currentButton.Title or "未知按钮"))
            end
        end
    end
end

function ButtonManager._addSharedCooldown(self, buttonData)
    if not buttonData.SharedCooldownId then
        return
    end
    local previousList = self._sharedCooldown[buttonData.SharedCooldownId]
    if not previousList then
        self._sharedCooldown[buttonData.SharedCooldownId] = { buttonData }
        return
    end
    local newList = {}
    for i = 1, getn(previousList) do
        local currentButton = previousList[i]
        if currentButton ~= buttonData then
            tinsert(newList, currentButton)
        end
    end
    tinsert(newList, buttonData)
    self._sharedCooldown[buttonData.SharedCooldownId] = newList
end

function ButtonManager._removeSharedCooldown(self, buttonData)
    if not buttonData.SharedCooldownId then
        return
    end
    local previousList = self._sharedCooldown[buttonData.SharedCooldownId]
    if not previousList then
        return
    end
    local newList = {}
    for i = 1, getn(previousList) do
        local currentButton = previousList[i]
        if currentButton ~= buttonData then
            tinsert(newList, currentButton)
        end
    end
    self._sharedCooldown[buttonData.SharedCooldownId] = newList
end

function CreateButton(buttonData)
    buttonData.Title = buttonData.Title or "没有名字"
    buttonData.Description = buttonData.Description or "没有描述"
    buttonData.MaxUseCount = buttonData.MaxUseCount or nil -- 最大使用次数，如果为 nil 则表示没有限制
    buttonData.CooldownSeconds = buttonData.CooldownSeconds or 0
    buttonData.CooldownRounds = buttonData.CooldownRounds or 0
    buttonData.Text = format("<尚未初始化完毕>%s\n%s", buttonData.Title, buttonData.Description)
    if buttonData.SharedCooldownId then
        if not buttonData.PlayerIndex then
            exMessageAppendToMessageArea("错误：按钮 %s 没有定义 PlayerIndex", buttonData.Title or "未知按钮")
            return
        end
        local side = "devil"
        if buttonData.PlayerIndex >= 4 then
            side = "angel"
        end
        buttonData.SharedCooldownId = format("%s_%s", side, buttonData.SharedCooldownId)
        buttonData.SharedCooldownSeconds = buttonData.SharedCooldownSeconds or 1
    end

    buttonData._usedCount = 0
    buttonData._cooldownCount = 0
    buttonData._multipleUseOnClick = buttonData.OnClick

    buttonData.FormatText = function(self)
        local title = self.Title
        if self.MaxUseCount ~= nil and self._usedCount >= self.MaxUseCount then
            title = self.Title .. "(已使用)"
        elseif self._cooldownCount > 0 then
            title = self.Title .. "(冷却中)"
        elseif self.MaxUseCount ~= nil then
            if self.MaxUseCount == 1 then
                title = self.Title .. "(仅限一次)"
            else
                title = format("%s(可使用%d次)", self.Title, self.MaxUseCount - self._usedCount)
            end
        end
        self.Text = format("%s\n%s", title, self.Description)
    end
    buttonData.OnClick = function(self)
        if not self.IsEnabled then
            return
        end
        if not self:_multipleUseOnClick() then
            return
        end

        -- 触发其他玩家的共享冷却
        if self.SharedCooldownId then
            ButtonManager:SharedCooldown(self)
        end

        self._usedCount = self._usedCount + 1

        local canStillUse = self.MaxUseCount == nil or self._usedCount < self.MaxUseCount
        if not canStillUse then
            self.IsEnabled = false
            self:FormatText()
            ButtonManager:SetButton(self)
            return
        end

        if self.CooldownSeconds > 0 then
            self._cooldownCount = self._cooldownCount + 1
            self.IsEnabled = false
            self:FormatText()
            ButtonManager:SetButton(self)
            SchedulerModule.delay_call(function(self)
                self:_reActivate()
            end, self.CooldownSeconds * 15, { self })
            return
        end

        if self.CooldownRounds > 0 then
            self._cooldownCount = self._cooldownCount + 1
            self.IsEnabled = false
            self:FormatText()
            ButtonManager:SetButton(self)
            RoundLuaManager.DelayCallOnRoundBegin(function(self)
                self:_reActivate()
            end, { self }, self.CooldownRounds)
            return
        end

        self.IsEnabled = true
        self:FormatText()
        ButtonManager:SetButton(self)
    end
    buttonData.SharedCooldown = function(self)
        if self.SharedCooldownSeconds ~= nil then
            self._cooldownCount = self._cooldownCount + 1
            self.IsEnabled = false
            self:FormatText()
            ButtonManager:SetButton(self)
            SchedulerModule.delay_call(function(self)
                self:_reActivate()
            end, self.SharedCooldownSeconds * 15, { self })
            return
        end
    end
    buttonData._reActivate = function(self)
        if ButtonManager:GetButton(self.PlayerName, self.ButtonIndex) ~= self then
            exMessageAppendToMessageArea(format("玩家 %s 的按钮 %s 已经被其他按钮覆盖，无法恢复", self.PlayerName or "?", self.Title))
            return
        end
        if self.MaxUseCount ~= nil and self._usedCount >= self.MaxUseCount then
            -- exMessageAppendToMessageArea(format("玩家 %s 的按钮 %s 已经使用完毕，无法恢复", self.PlayerName or "?", self.Title))
            return
        end
        self._cooldownCount = self._cooldownCount - 1
        if self._cooldownCount > 0 then
            return
        end
        self.IsEnabled = true
        self:FormatText()
        ButtonManager:SetButton(self)
    end

    buttonData:FormatText()
    return buttonData
end

function _ALERT(msg)
    exAddTextToPublicBoard(msg)
end