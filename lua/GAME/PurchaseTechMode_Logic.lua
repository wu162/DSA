g_evilTechLevel = 1;
g_angelTechLevel = 1;

g_evilTechBuyRound = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
}

g_angelTechBuyRound = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
}

g_techLevelNeededMoney = {
    [1] = 10500,
    [2] = 23000,
    [3] = 35000,
}


g_maxTechLevelDecreaseMoney = {
    [1] = 9000,
    [2] = 14400,
    [3] = 23100,
}

g_maxTechLevelDecreaseRate = {
    [1] = 1500,
    [2] = 1800,
    [3] = 2100,
}

function PurchaseTechMode_Setting()

    ExecuteAction("NAMED_SET_MAX_HEALTH", "T73", 30000, 1)
    ExecuteAction("NAMED_SET_MAX_HEALTH", "T74", 140000, 1)
    ExecuteAction("NAMED_SET_MAX_HEALTH", "T83", 30000, 1)
    ExecuteAction("NAMED_SET_MAX_HEALTH", "T84", 140000, 1)

    local object = GetObjectByScriptName("overlord7")
    ExecuteAction("NAMED_DELETE", object);
    object = GetObjectByScriptName("overlord8")
    ExecuteAction("NAMED_DELETE", object);

    exDisableWBScript("NATURALUNLOCK__1")
    exDisableWBScript("NATURALUNLOCK__2")
    exDisableWBScript("NATURALUNLOCK__3")

    exCreateCustomButton({
        Index = 7,
        TextureName = "AUA_Bribe",
        Desc = "购买下一级科技(当前等级：1)\n解锁下一级科技等级和更多电厂权限",
        X = 250,
        Y = 20,
        GroupIndex = 1,
        AlignX = "right",
        AlignY = "top",
    })

    exEnableWBScript("HidePowerCounter")

    exCreateCustomText({
        Index = 1,
        Content = "己方科技等级: 1",
        X = 10,
        Y = 10,
        Color = 16711680,
        Size = 15,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomText({
        Index = 2,
        Content = "己方电厂最大数量: 5",
        X = 0,
        Y = 30,
        Color = 16711680,
        Size = 15,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomText({
        Index = 3,
        Content = "己方神州电厂最大数量: 4",
        X = 0,
        Y = 50,
        Color = 16711680,
        Size = 15,
        AlignX = "left",
        AlignY = "top",
    })

end



function onCustomBtnClickEvent(playerName, index)
    if index == 7 then

        BtnChoiceDialogEventFunc_ShowPurchaseTechDialog(playerName)

    end
end