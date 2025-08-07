ARGCOUNT_exShowCustomBtnChoiceDialogForPlayer = 10

ButtonChoiceDialogManager = {
    _activeDialogs = {},
}

function ButtonChoiceDialogManager.OnUserButtonChoiceDialogEvent(self, playerName, dialogId, buttonIndex)
    -- 处理用户在按钮选择对话框中的选择
    local dialog = self._activeDialogs[dialogId]
    if not dialog then
        exMessageAppendToMessageArea(format("玩家 %s 点击了按钮 %d，但没有找到对应的对话框 ID: %d", playerName, buttonIndex, dialogId))
        return
    end
    if dialog.PlayerName ~= playerName then
        local dialogPlayerName = dialog.PlayerName or "<invalid dialog.PlayerName>"
        local argumentPlayerName = playerName or "<invalid playerName>"
        exMessageAppendToMessageArea(format("对话框 %d 的按钮 %d 被点击，但玩家名称不匹配: %s != %s", dialogId, buttonIndex, dialogPlayerName, argumentPlayerName))
        return
    end
    if type(dialog.OnChoice) == "function" then
        dialog:OnChoice(buttonIndex)
    else
        exMessageAppendToMessageArea(format("玩家 %s 点击了按钮 %d，但该对话框没有定义按钮事件处理函数", playerName, buttonIndex))
    end
end

function ButtonChoiceDialogManager.ShowDialog(self, dialogData)
    -- 显示一个按钮选择对话框
    if not dialogData then
        exMessageAppendToMessageArea("错误：尝试添加一个无效的按钮选择对话框")
        return
    end
    if type(dialogData.DialogId) ~= "number" then
        exMessageAppendToMessageArea("错误：尝试创建一个无效的按钮选择对话框，DialogId 必须是数字")
        return
    end
    if type(dialogData.PlayerName) ~= 'string' then
        exMessageAppendToMessageArea("错误：尝试创建一个无效的按钮选择对话框，PlayerName 必须是字符串")
        return
    end
    self._activeDialogs[dialogData.DialogId] = dialogData

    local arguments = {
        dialogData.PlayerName,
        dialogData.DialogId,
        dialogData.Title or '',
    }
    local choices = dialogData.Choices or {}
    if getn(choices) < 1 then
        exMessageAppendToMessageArea(format("错误：尝试显示对话框 %d 时，选项数量不足。至少需要一个选项！", dialogData.DialogId))
        return
    end
    if (getn(arguments) + getn(choices)) > ARGCOUNT_exShowCustomBtnChoiceDialogForPlayer then
        exMessageAppendToMessageArea(format("错误：尝试显示对话框 %d 时，选项数量超过了预设的最大值。在加入更多选项之前应该先实现分页功能！", dialogId))
        return
    end
    for i = 1, getn(choices) do
        tinsert(arguments, choices[i])
    end
    while getn(arguments) < ARGCOUNT_exShowCustomBtnChoiceDialogForPlayer do
        tinsert(arguments, '')
    end
    call(exShowCustomBtnChoiceDialogForPlayer, arguments)
end

function CreateDialog(dialogData)
    
    return dialogData
end
