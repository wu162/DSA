ARGCOUNT_exShowCustomBtnChoiceDialogForPlayer = 10

ButtonChoiceDialogManager = {
    _activeDialogs = {},
}

function ButtonChoiceDialogManager.OnUserButtonChoiceDialogEvent(self, playerName, dialogId, buttonIndex)
    -- 处理用户在按钮选择对话框中的选择
    local dialog = self._activeDialogs[dialogId]
    if not dialog then
        exMessageAppendToMessageArea(Localization.get("button_dialog.player_not_found", playerName, buttonIndex, dialogId))
        return
    end
    if dialog.PlayerName ~= playerName then
        local dialogPlayerName = dialog.PlayerName or "<invalid dialog.PlayerName>"
        local argumentPlayerName = playerName or "<invalid playerName>"
        exMessageAppendToMessageArea(Localization.get("button_dialog.player_mismatch", dialogId, buttonIndex, dialogPlayerName, argumentPlayerName))
        return
    end
    if type(dialog.OnChoice) == "function" then
        dialog:OnChoice(buttonIndex)
    else
        exMessageAppendToMessageArea(Localization.get("button_dialog.no_choice_handler", playerName, buttonIndex))
    end
end

function ButtonChoiceDialogManager.ShowDialog(self, dialogData)
    -- 显示一个按钮选择对话框
    if not dialogData then
        exMessageAppendToMessageArea(Localization.get("button_dialog.invalid_dialog"))
        return
    end
    if type(dialogData.DialogId) ~= "number" then
        exMessageAppendToMessageArea(Localization.get("button_dialog.invalid_dialog_id"))
        return
    end
    if type(dialogData.PlayerName) ~= 'string' then
        exMessageAppendToMessageArea(Localization.get("button_dialog.invalid_player_name"))
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
        exMessageAppendToMessageArea(Localization.get("button_dialog.not_enough_choices", dialogData.DialogId))
        return
    end
    if (getn(arguments) + getn(choices)) > ARGCOUNT_exShowCustomBtnChoiceDialogForPlayer then
        exMessageAppendToMessageArea(Localization.get("button_dialog.too_many_choices", dialogData.DialogId))
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
