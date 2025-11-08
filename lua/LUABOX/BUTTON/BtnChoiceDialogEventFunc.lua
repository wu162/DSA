devil_max = 200
angel_max = 200

g_GameMode = 1;
g_EnableDeathModeEffect = 0;
g_DisableSeaArmy = 0;

g_GameModeName = {
    [1] = "正常模式",
    [2] = "死亡模式",
    [3] = "缩小模式",
}

g_GameModeOptions = {
    { Name = '正常模式' },
    { Name = '死亡模式' },
    { Name = '缩小模式' },
    { Name = '升本模式' },
    { Name = '禁止海军' },
}

MARKET_DIALOG_ID_OFFSET = 100

GAMEMODE_DIALOG_ID = 201

SKILL_DIALOG_ID_OFFSET = 1000
SKILL_DIALOG_ID_OFFSET2 = 2000
PURCHASE_TECH_DIALOG_ID = 701
g_SkillNames = {
    '炸弹+达摩克利斯之剑',
    '铁幕+时停',
    '龙船+空军元帅',
    '补充军队+纳米维修',
    '复制己方技能+复制敌方技能'
}
g_PreselectedSkillIndices = {}

g_BuyTowerId = {
    ["JapanPointShieldControlTower"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    },
    ["SovietHeavyAntiAirMissileTurret"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    }
}


function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
    local round = exCounterGetByName("lvc")
    local previous = SetWorldBuilderThisPlayer(1)

    ButtonChoiceDialogManager:OnUserButtonChoiceDialogEvent(playerName, dialogId, btnIndex)
    
    if dialogId == 301 then
        if btnIndex == 1 then
            MsgCommand_BanSea()
        elseif btnIndex == 2 then
            MsgCommand_BanInfantry()
        end
    end

    SetWorldBuilderThisPlayer(previous)
end

function BtnChoiceDialogEventFunc_ShowMarketDialog(playerIndex)
    local dialogData = {
        DialogId = MARKET_DIALOG_ID_OFFSET + playerIndex,
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        Title = '欢迎进入交易市场',
    }
    dialogData.RefreshData = function(self)
        local playerIndex = self.PlayerIndex
        local investedMax, investedMoney = devil_max, devil_money
        if playerIndex >= 4 then
            investedMax, investedMoney = angel_max, angel_money
        end
        self.Title = format('欢迎进入交易市场\n投资金额(上限%d):%d', investedMax, investedMoney)

        local transferToA_Index, transferToB_Index = BtnChoiceDialogEventFunc_GetTransferMoneyIndices(playerIndex)
        local roles = { '恶魔1号', '恶魔2号', '恶魔3号', '天使1号', '天使2号', '天使3号' }
        function getColorText(index)
            local color = BtnChoiceDialogEventFunc_CalculateColor(index)
            if color == nil then
                return ""
            else
                return format("(%s)", color)
            end
        end
        local playerA_Color = getColorText(transferToA_Index)
        local playerB_Color = getColorText(transferToB_Index)
        
        local nextInvestmentText = '购买100恶魔投资'
        if playerIndex >= 4 then
            nextInvestmentText = '购买100天使投资'
        end
        nextInvestmentText = nextInvestmentText .. '\n若回合胜利可获收益'

        self.Choices = {
            format('向%s%s转移1000资金', roles[transferToA_Index], playerA_Color), -- 1
            format('向%s%s转移1000资金', roles[transferToB_Index], playerB_Color), -- 2
            '回到战场', -- 3
            nextInvestmentText, -- 4
            "购买护盾塔(10000)", -- 5
            "购买胡杨塔(12000)", -- 6
        }
        --if g_PlayerDebtCount[self.PlayerName] == 0 then
        --    local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        --    tinsert(self.Choices, format("向银行贷款 %d\n(将会3分钟无收入)", debtMoney)) -- 5
        --else
            -- 您已贷款，无法再次贷款
        --end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 or buttonIndex == 2 then
            self:TransferMoney(buttonIndex)
        elseif buttonIndex == 3 then
            -- 回到战场（因此不再显示交易市场对话框）
            return
        elseif buttonIndex == 4 then
            self:InvestMoney()
        elseif buttonIndex == 5 then
            self:BuyJapanPointShieldControlTower()
            return
        elseif buttonIndex == 6 then
            self:BuySovietHeavyAntiAirMissileTurret()
            return
        end
        -- 重新刷新数据并显示对话框
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData.TransferMoney = function(self, buttonIndex)
        local transferToA_Index, transferToB_Index = BtnChoiceDialogEventFunc_GetTransferMoneyIndices(self.PlayerIndex)
        local transferTargetIndex = transferToA_Index
        if buttonIndex == 2 then
            transferTargetIndex = transferToB_Index
        end
        local transferTargetName = "Player_" .. transferTargetIndex
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', transferTargetName, '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, '-1000')
            exAddTextToPublicBoardForPlayer(self.PlayerName, format('成功转账1000给$p%dName', transferTargetIndex), 5)
        else
            exAddTextToPublicBoardForPlayer(self.PlayerName, '您的余额不足', 5)
        end
    end
    -- 处理购买投资
    dialogData.InvestMoney = function(self)
        local playerIndex = self.PlayerIndex
        local start = exCounterGetByName("start")
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        local isInvestementMax, totalInvestedMoney = false, 0
        if playerIndex <= 3 and devil_money >= devil_max then
            isInvestementMax = true
        elseif playerIndex >= 4 and angel_money >= angel_max then
            isInvestementMax = true
        end
        if isInvestementMax then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '投资失败：投资已达到上限', 5)
        elseif start <= 600 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '投资失败：只能在每个回合刚开始时投资', 5)
        elseif money < 100 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '投资失败：余额不足', 5)
        else
            if playerIndex <= 3 then
                devil_money = devil_money + 100
                totalInvestedMoney = devil_money
            else
                angel_money = angel_money + 100
                totalInvestedMoney = angel_money
            end
            exAddTextToPublicBoardForPlayer(self.PlayerName, format('投资成功，当前投资金额：%d', totalInvestedMoney), 5)
            ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, '-100')
        end
    end
    -- 处理贷款
    dialogData.TakeLoan = function(self)
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, debtMoney)
        exMessageAppendToMessageArea(format('$p%dName向银行贷款', self.PlayerIndex))
        exAddTextToPublicBoardForPlayer(self.PlayerName, '贷款成功', 10)

        g_PlayerInDebt[self.PlayerName] = 1;
        g_PlayerDebtCount[self.PlayerName] = g_PlayerDebtCount[self.PlayerName] + 1;

        SchedulerModule.delay_call(function(pName)
            g_PlayerInDebt[pName] = 0;
        end, 15 * 60 * 3, {self.PlayerName})
    end
    dialogData.BuyJapanPointShieldControlTower = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local pos = {X = 2900, Y = 3187};
        if self.PlayerIndex >= 4 then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            pos = {X = 4150, Y = 3187};
        end
        local objectId = g_BuyTowerId["JapanPointShieldControlTower"][sideName];
        if ObjectIsAlive(objectId) then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '护盾塔还在，不能购买', 10);
            return;
        end
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < 10000 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '资金不足', 10);
            return;
        end
        local id = exCreateObject({
            ObjectType = FastHash("JapanPointShieldControlTower"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = 210},
            Angle = 0,
            Health = 5500
        });
        g_BuyTowerId["JapanPointShieldControlTower"][sideName] = id;
        local tower = GetObjectById(id);
        ObjectLoadAttributeModifier(tower,'AttributeModifier_BoxRateOfFireUp', 999999)
        ObjectLoadAttributeModifier(tower,'AttributeModifier_BoxRangeUp', 999999)
        ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower,"IN_SHIELD_SPHERE", 1)
        ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower,"UNPACKING", 0)

        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -10000);

    end
    dialogData.BuySovietHeavyAntiAirMissileTurret = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local pos = {X = 2900, Y = 3018};
        if self.PlayerIndex >= 4 then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            pos = {X = 4150, Y = 3018};
        end
        local objectId = g_BuyTowerId["SovietHeavyAntiAirMissileTurret"][sideName];
        if ObjectIsAlive(objectId) then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '护盾塔还在，不能购买', 10);
            return;
        end
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < 12000 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, '资金不足', 10);
            return;
        end
        local id = exCreateObject({
            ObjectType = FastHash("SovietHeavyAntiAirMissileTurret"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = 210},
            Angle = 0,
            Health = 9000
        });
        g_BuyTowerId["SovietHeavyAntiAirMissileTurret"][sideName] = id;
        local tower = GetObjectById(id);
        ObjectLoadAttributeModifier(tower,'AttributeModifier_MAP_Area_FireSpeed_Up', 999999)
        ObjectLoadAttributeModifier(tower,'AttributeModifier_JapanNanoEnhanceDroneReinforcement', 999999)
        ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower,"IN_SHIELD_SPHERE", 1)
        ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower,"UNPACKING", 0)

        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -12000);

    end

    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

-- 假如是 Player_1，他应该转账给 Player_2 和 3；假如是 2，则应该转账给 1 和 3
-- 假如是 4，应该转账给 5 和 6；假如是 6，则应该转账给 4 和 5
function BtnChoiceDialogEventFunc_GetTransferMoneyIndices(playerIndex)
    local transferToA_Index, transferToB_Index
    if playerIndex == 1 or playerIndex == 4 then
        transferToA_Index = playerIndex + 1
        transferToB_Index = playerIndex + 2
    elseif playerIndex == 2 or playerIndex == 5 then
        transferToA_Index = playerIndex - 1
        transferToB_Index = playerIndex + 1
    elseif playerIndex == 3 or playerIndex == 6 then
        transferToA_Index = playerIndex - 2
        transferToB_Index = playerIndex - 1
    end
    return transferToA_Index, transferToB_Index
end

function BtnChoiceDialogEventFunc_CalculateColor(playerIndex)
    local playerName = "Player_" .. playerIndex
    local color = exPlayerGetColor(playerName)
    if color == nil or color[1] == nil or color[1] <= 0 then
        return nil
    end
    -- from 0~255 RGB values, determine human readable color
    -- maybe we can convert RGB to HSL and determine color based on hue?
    local red = color[1] / 255
    local green = color[2] / 255
    local blue = color[3] / 255
    local maxValue = max(red, green, blue)
    local minValue = min(red, green, blue)
    local lightness = (maxValue + minValue) / 2
    if lightness < 0.1 then
        return "黑色"
    elseif lightness > 0.95 then
        return "白色"
    elseif maxValue == minValue then
        return "灰色"
    end
    local d = maxValue - minValue
    local saturation = 0
    if lightness > 0.5 then
        saturation = d / (2 - maxValue - minValue)
    else
        saturation = d / (maxValue + minValue)
    end
    if saturation < 0.1 then
        return "灰色"
    end
    local hue = 0
    if maxValue == red then
        hue = (green - blue) / d
    elseif maxValue == green then
        hue = (blue - red) / d + 2
    elseif maxValue == blue then
        hue = (red - green) / d + 4
    end
    if hue < 0 then
        hue = hue + 6
    end
    hue = hue * 60
    if hue < 20 or hue >= 330 then
        return "红色"
    elseif hue < 45 then
        return "橙色"
    elseif hue < 75 then
        return "黄色"
    elseif hue < 160 then
        return "绿色"
    elseif hue < 200 then
        return "青色"
    elseif hue < 270 then
        return "蓝色"
    elseif hue < 300 then
        return "紫色"
    elseif hue < 330 then
        return "粉色"
    end
    return nil
end

function BtnChoiceDialogEventFunc_ShowGameModeDialog(playerName)
    local dialogData = {
        DialogId = GAMEMODE_DIALOG_ID,
        PlayerName = playerName,
        Title = '请选择游戏模式',
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        local hasSelected = false
        for i = 1, getn(g_GameModeOptions) do
            local option = g_GameModeOptions[i]
            if option.IsSelected then
                tinsert(self.Choices, option.Name .. '(已选择)')
                hasSelected = true
            else
                tinsert(self.Choices, option.Name)
            end
        end
        if hasSelected then
            tinsert(self.Choices, ">>确认<<")
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        local normalGameOption = g_GameModeOptions[1]
        local deathGameOption = g_GameModeOptions[2]
        local shrinkGameOption = g_GameModeOptions[3]
        local purchaseTechMode = g_GameModeOptions[4]
        local banSeaGameOption = g_GameModeOptions[5]
        -- 是否选择了确认按钮
        if buttonIndex == getn(g_GameModeOptions) + 1 then
            -- 假如选择了确认按钮，设置游戏模式
            g_EnableDeathModeEffect = self:BooleanToNumber(deathGameOption.IsSelected)
            g_DisableSeaArmy = self:BooleanToNumber(banSeaGameOption.IsSelected)
            if shrinkGameOption.IsSelected then
                g_GameMode = 3
            elseif purchaseTechMode.IsSelected then
                g_GameMode = 4
            elseif g_EnableDeathModeEffect == 1 then
                g_GameMode = 2
            else
                g_GameMode = 1 -- 默认正常模式
            end
            BtnChoiceDialogEventFunc_ShowHostChoosePlayerSkillModeDialog(self.PlayerName)
            return
        end
        local option = g_GameModeOptions[buttonIndex]
        if not option then
            exMessageAppendToMessageArea(format("错误：玩家 %s 点击了非法按钮 %d", self.PlayerName, buttonIndex))
            return
        end
        if not option.IsSelected then
            option.IsSelected = true
            exMessageAppendToMessageArea(format("房主已选择%s", option.Name))
        elseif option ~= normalGameOption then
            option.IsSelected = nil
            exMessageAppendToMessageArea(format("房主已取消选择%s", option.Name))
        end
        if option == normalGameOption then
            -- 假如选择了正常模式，取消选择死亡模式和缩小模式
            deathGameOption.IsSelected = nil
            shrinkGameOption.IsSelected = nil
        elseif option == deathGameOption or option == shrinkGameOption then
            -- 假如选择了死亡模式或缩小模式，取消选择正常模式
            normalGameOption.IsSelected = nil
        end
        -- 重新刷新数据并显示对话框
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData.BooleanToNumber = function(self, value)
        if value then
            return 1
        else
            return 0
        end
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowHostChoosePlayerSkillModeDialog(playerName)
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET + 0, -- 0 是特殊的、房主预选技能组的对话框
        PlayerName = playerName,
        Title = '请选择技能组模式',
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        if preselectedSkillCount == 0 then
            tinsert(self.Choices, '让每个玩家自行选择')
        end
        tinsert(self.Choices, '房主规定技能组(对称)')
        -- 假如房主还未选择技能，额外提供随机技能选项
        if preselectedSkillCount == 0 then
            -- 关于为什么是可重复的，
            -- 看下面 RandomSymmetricSkill 与 RandomAsymmetricSkill 里面的注释
            tinsert(self.Choices, '随机（可重复，对称）')
            tinsert(self.Choices, '随机（可重复，不对称）')
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 then
            if getn(g_PreselectedSkillIndices) == 0 then
                -- 让玩家自行选择技能组
                -- 可以开始游戏了
                BtnChoiceDialogEventFunc_InvokeStartGame()
                return
            end
            return
        end
        if buttonIndex == 2 then
            BtnChoiceDialogEventFunc_ShowHostChooseSkillForAllDialog(self.PlayerName)
            return
        elseif buttonIndex == 3 then
            self:RandomSkill(true)
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        elseif buttonIndex == 4 then
            self:RandomSkill(false)
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        end

    end
    dialogData.RandomSkill = function(self, isSymmetric)
        -- 生成一个对称的随机技能组
        g_PreselectedSkillIndices = {}
        g_PreselectedSkillIndices.IsRandom = true
        local skillNamesCount = getn(g_SkillNames)
        tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
        tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
        tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
        if isSymmetric then
            g_PreselectedSkillIndices.IsSymmetric = true
            -- 对称的随机技能组，复制前 3 个技能组
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[1])
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[2])
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[3])
        else
            g_PreselectedSkillIndices.IsSymmetric = false
            -- 不对称的随机技能组
            tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
            tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
            tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
        end
    end
    dialogData.RandomInteger = function(self, min, max)
        -- 每次调用之前先“洗”一下随机数
        for i = 1, mod(GetFrame(), 7) do
            GetRandomNumber()
        end

        local range = max - min + 1
        local value = GetRandomNumber() * range + min
        value = floor(value)
        if value < min then
            value = min
        elseif value > max then
            value = max
        end
        return value
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end


function BtnChoiceDialogEventFunc_ShowHostChooseSkillForAllDialog(playerName)
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET2 + 0, -- 0 是特殊的、房主预选技能组的对话框
        PlayerName = playerName,
        Title = '请选择各个玩家的技能组',
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        if preselectedSkillCount > 0 then
            tinsert(self.Choices, '取消选择')
            if preselectedSkillCount < 3 then
                -- 假如预选技能组少于 3 个，继续选择
                self.Title = format('请继续选择（还剩%d个）', 3 - preselectedSkillCount)
            end
        else
            self.Title = "请选择各个玩家的技能组"
        end
        for i = 1, getn(g_SkillNames) do
            local name = g_SkillNames[i]
            for j = 1, getn(g_PreselectedSkillIndices) do
                if g_PreselectedSkillIndices[j] == i then
                    name = name .. '(已选)'
                    break
                end
            end
            tinsert(self.Choices, name)
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 and getn(g_PreselectedSkillIndices) > 0 then
            -- 假如房主点击的是“取消”，清空预选技能组
            g_PreselectedSkillIndices = {}
            -- 重新显示对话框
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        end

        -- 假如房主选择了某个技能组
        -- 因为第一个按钮是“让玩家自行选择”，所以技能索引从 2 开始，要减去 1
        local skillIndex = buttonIndex - 1
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        -- 但如果此时还一个技能都没选，没有第一个 取消选择 这个按钮
        if preselectedSkillCount == 0 then
            skillIndex = buttonIndex
        end
        if skillIndex < 1 or skillIndex > getn(g_SkillNames) then
            exMessageAppendToMessageArea(format("错误：玩家 %s 点击了非法技能组按钮 %d", self.PlayerName, buttonIndex))
            return
        end
        local alreadySelected = false
        for i = 1, getn(g_PreselectedSkillIndices) do
            if g_PreselectedSkillIndices[i] == skillIndex then
                alreadySelected = true
                break
            end
        end
        if not alreadySelected then
            tinsert(g_PreselectedSkillIndices, skillIndex)
        end

        if getn(g_PreselectedSkillIndices) == 3 then
            -- 已经选择了 3 个技能组，可以开始游戏了
            -- 复制、补全到 6 个技能组
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[1])
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[2])
            tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[3])
            -- 开始游戏
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        end

        -- 继续选择下一个技能组
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_InvokeStartGame()
    -- 这里可以添加一些额外的逻辑，比如检查玩家是否准备好等
    local gameModeText = ''
    local skillText = ''
    if g_GameMode == 1 then
        gameModeText = '正常模式'
    elseif g_GameMode == 2 then
        gameModeText = '死亡模式'
    elseif g_GameMode == 3 then
        if g_EnableDeathModeEffect == 1 then
            gameModeText = '缩小模式(启用死亡模式效果)'
        else
            gameModeText = '缩小模式'
        end
    elseif g_GameMode == 4 then
        gameModeText = '升本模式'
    end
    if g_DisableSeaArmy == 1 then
        gameModeText = gameModeText .. ' (禁止海军)'
    end
    local preselectedSkillCount = getn(g_PreselectedSkillIndices)
    if preselectedSkillCount == 6 then
        if g_PreselectedSkillIndices.IsRandom then
            if g_PreselectedSkillIndices.IsSymmetric then
                skillText = '技能组：随机（可重复，对称）'
            else
                skillText = '技能组：随机（可重复，不对称）'
            end
            -- 调试版本：显示随机选择的技能组
            -- 正式发布的版本里，注释掉下面的代码，给玩家一个“惊喜”
            -- for i = 1, preselectedSkillCount do
            --     skillText = skillText .. g_SkillNames[g_PreselectedSkillIndices[i]]
            --     if i < preselectedSkillCount then
            --         skillText = skillText .. ','
            --     end
            -- end
        else
            skillText = '技能组：'
            for i = 1, 3 do
                skillText = skillText .. g_SkillNames[g_PreselectedSkillIndices[i]]
                if i < preselectedSkillCount then
                    skillText = skillText .. ','
                end
            end
        end
    elseif preselectedSkillCount == 0 then
        skillText = '技能组：由玩家自由选择'
    else
        exMessageAppendToMessageArea(format("错误：预选技能组数量不正确，应该是 0 或 6，但实际是 %d", preselectedSkillCount))
        return
    end
    exMessageAppendToMessageArea(format("游戏开始！已选择游戏模式：%s", gameModeText))
    exMessageAppendToMessageArea(skillText)
    exAddTextToPublicBoard(format("游戏开始！已选择游戏模式：%s\n%s\n经济倍率: %d", gameModeText, skillText, exModeGetCheatMultiplier()), 15)
    exEnableWBScript("readyForStartCam")
end

function BtnChoiceDialogEventFunc_ShowPlayerChooseSkillDialog(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 6 then
        exMessageAppendToMessageArea("错误：BtnChoiceDialogEventFunc_ShowPlayerChooseSkillDialog 的参数 playerName 无效")
        return
    end
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET + g_PlayerNameToIndex[playerName],
        PlayerName = playerName,
        Title = '请选择您的技能组',
        Choices = {},
    }
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == getn(g_SkillNames) + 1 then
            -- 假如玩家选择了退出，则不做任何操作
            return
        end
        CenterTopBtnFunc_CreatePlayerSkillButtons(g_PlayerNameToIndex[self.PlayerName], buttonIndex)
    end
    for i = 1, getn(g_SkillNames) do
        tinsert(dialogData.Choices, g_SkillNames[i])
    end
    tinsert(dialogData.Choices, '退出(待会再选)')
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowPurchaseTechDialog(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 6 then
        exMessageAppendToMessageArea("错误：BtnChoiceDialogEventFunc_ShowPurchaseTechDialog 的参数 playerName 无效")
        return
    end
    local techLevel = g_evilTechLevel
    if playerIndex >= 4 then
        techLevel = g_angelTechLevel
    end

    local neededMoney = g_techLevelNeededMoney[techLevel]

    local dialogData = {
        DialogId = PURCHASE_TECH_DIALOG_ID + g_PlayerNameToIndex[playerName],
        PlayerName = playerName,
        Title = "购买下一级科技权限($"..tostring(neededMoney)..")",
        Choices = {},
    }

    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 then
            local previous = SetWorldBuilderThisPlayer(1)

            local playerIndex2 = g_PlayerNameToIndex[self.PlayerName]
            local techLevel2 = g_evilTechLevel
            if playerIndex2 >= 4 then
                techLevel2 = g_angelTechLevel
            end

            local neededMoney2 = g_techLevelNeededMoney[techLevel2]

            local money = exPlayerGetCurrentMoney(self.PlayerName)
            if money >= neededMoney2 then
                ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -neededMoney2)

                self:onPurchaseSuccess(playerIndex2)

            else
                exAddTextToPublicBoardForPlayer(self.PlayerName, "购买失败，资金不足", 10)
            end

            SetWorldBuilderThisPlayer(previous)
        end
    end

    dialogData.onPurchaseSuccess = function(self, pIndex)
        if pIndex >= 4 then
            g_angelTechLevel = g_angelTechLevel + 1
            if g_angelTechLevel < 4 then
                for i = 4, 6 do
                    exAddTextToPublicBoardForPlayer("Player_" .. tostring(i), "购买成功，解锁下一级科技等级和更多电厂", 20)
                    exCreateCustomButtonForPlayer("Player_" .. tostring(i), {
                        Index = 7,
                        TextureName = "AUA_Bribe",
                        Desc = "购买下一级科技(当前等级："..tostring(g_angelTechLevel)..")\n解锁下一级科技等级和更多电厂权限",
                        X = 250,
                        Y = 20,
                        GroupIndex = 1,
                        AlignX = "right",
                        AlignY = "top",
                    })
                end

            else
                for i = 4, 6 do
                    exCustomBtnSetVisibilityForPlayer("Player_" .. tostring(i), 7, 0)
                end
            end

            -- TODO 自定义文本更新   解锁科技，解锁电厂数量

            local powerNum = 5;
            local celestialPowerNum = 4;
            if g_angelTechLevel == 2 then
                exEnableWBScript('Player_4/UNLOCK1__4')
                exEnableWBScript('Player_5/UNLOCK1__5')
                exEnableWBScript('Player_6/UNLOCK1__6')
                LIMITPOWERC = 6
                powerNum = 7;
                celestialPowerNum = 6;
            elseif g_angelTechLevel == 3 then
                exEnableWBScript('Player_4/UNLOCK2__4')
                exEnableWBScript('Player_5/UNLOCK2__5')
                exEnableWBScript('Player_6/UNLOCK2__6')
                LIMITPOWERC = 8
                powerNum = 9;
                celestialPowerNum = 8;
            elseif g_angelTechLevel == 4 then
                exEnableWBScript('Player_4/UNLOCK3__4')
                exEnableWBScript('Player_5/UNLOCK3__5')
                exEnableWBScript('Player_6/UNLOCK3__6')
                LIMITPOWERC = 10
                powerNum = 11;
                celestialPowerNum = 10;
            end

            ExecuteAction("PLAY_SOUND_EFFECT", "MAP_Rescue");

            for i = 4, 6 do
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 1, "己方科技等级: " .. tostring(g_angelTechLevel))
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 2, "己方电厂最大数量: " .. tostring(powerNum))
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 3, "己方神州电厂最大数量: " .. tostring(celestialPowerNum))
            end


        else
            g_evilTechLevel = g_evilTechLevel + 1
            if g_evilTechLevel < 4 then
                for i = 1, 3 do
                    exAddTextToPublicBoardForPlayer("Player_" .. tostring(i), "购买成功，解锁下一级科技等级和更多电厂", 20)
                    exCreateCustomButtonForPlayer("Player_" .. tostring(i), {
                        Index = 7,
                        TextureName = "AUA_Bribe",
                        Desc = "购买下一级科技(当前等级："..tostring(g_evilTechLevel)..")\n解锁下一级科技等级和更多电厂权限",
                        X = 250,
                        Y = 20,
                        GroupIndex = 1,
                        AlignX = "right",
                        AlignY = "top",
                    })
                end

            else
                for i = 1, 3 do
                    exCustomBtnSetVisibilityForPlayer("Player_" .. tostring(i), 7, 0)
                end
            end

            LIMITPOWERC = LIMITPOWERC  + 2
            local powerNum = 5;
            local celestialPowerNum = 4;
            if g_evilTechLevel == 2 then
                exEnableWBScript('Player_1/UNLOCK1__1')
                exEnableWBScript('Player_2/UNLOCK1__2')
                exEnableWBScript('Player_3/UNLOCK1__3')
                LIMITPOWERC = 6
                powerNum = 7;
                celestialPowerNum = 6;
            elseif g_evilTechLevel == 3 then
                exEnableWBScript('Player_1/UNLOCK2__1')
                exEnableWBScript('Player_2/UNLOCK2__2')
                exEnableWBScript('Player_3/UNLOCK2__3')
                LIMITPOWERC = 8
                powerNum = 9;
                celestialPowerNum = 8;
            elseif g_evilTechLevel == 4 then
                exEnableWBScript('Player_1/UNLOCK3__1')
                exEnableWBScript('Player_2/UNLOCK3__2')
                exEnableWBScript('Player_3/UNLOCK3__3')
                LIMITPOWERC = 10
                powerNum = 11;
                celestialPowerNum = 10;
            end

            ExecuteAction("PLAY_SOUND_EFFECT", "MAP_Rescue");

            for i = 1, 3 do
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 1, "己方科技等级: " .. tostring(g_evilTechLevel))
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 2, "己方电厂最大数量: " .. tostring(powerNum))
                exCustomTextUpdateTextForPlayer("Player_" .. tostring(i), 3, "己方神州电厂最大数量: " .. tostring(celestialPowerNum))
            end

        end
    end

    tinsert(dialogData.Choices, '购买')
    tinsert(dialogData.Choices, '不购买')
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end
