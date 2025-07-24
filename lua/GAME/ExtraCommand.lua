g_BanSeaFilter = CreateObjectFilter({
    Rule = "ANY",

    IncludeThing = {
        "AlliedNavalYard", "SovietNavalYard", "JapanNavalYard", "CelestialNavalYard"
    }
})

function MsgCommand_BanSea()
    exMessageAppendToMessageArea("房主已禁止海军！")
    for i = 1, 6 do
        local playerName = "Player_" .. i
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "AlliedNavalYard", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "SovietNavalYard", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "JapanNavalYard", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "CelestialNavalYard", 0)
    end

    local matchedObjects, count = ObjectFindObjects(nil, nil, g_BanSeaFilter)
    for i = 1, count, 1 do
        ExecuteAction("NAMED_DELETE", matchedObjects[i]);
    end

end

function MsgCommand_BanInfantry()
    exMessageAppendToMessageArea("房主已禁止兵营！")
    for i = 1, 6 do
        local playerName = "Player_" .. i
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "AlliedBarracks", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "SovietBarracks", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "JapanBarracks", 0)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "CelestialBarracks", 0)
    end
end

exRegisterHotKey(76, 0, 1)

function onUserHotKeyEvent(playerName, commandCode, mouseWorldPos)
    -- todo 必须要在第一回合开始前20秒内输入
    if commandCode == 1 and playerName == g_RoomOwnerPlayer then
        local round = exCounterGetByName("lvc")
        local start = exCounterGetByName("start")
        if round == 0 and start >= 30 then
            exShowCustomBtnChoiceDialogForPlayer(g_RoomOwnerPlayer, 301, "额外设定", '禁海军', '禁兵营', '', '', '', '', '')
        end
    end


end