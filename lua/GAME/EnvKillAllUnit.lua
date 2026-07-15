unitallEnv = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing={},
    ExcludeThing={
        "JapanFortressShip",
        "Overlordtank",
        "JapanLightTransportVehicle",
        "AlliedNightinaleHelicopter",
        "AlliedMCV",
    },
    Include="SELECTABLE",
    Exclude="STRUCTURE",
})

RoundLuaManager.CallOnEveryRoundBegin(function(list)
    local level = exCounterGetByName("lvc")
    if level ~= nil and g_GameMode == 1 then
        if level == 8 then
            exAddTextToPublicBoard(Localization.get("env_kill_all_unit.warning_next_round"), 15)
        end
        if level == 9 then
            exAddTextToPublicBoard(Localization.get("env_kill_all_unit.execute"), 10)
            local units, count = ObjectFindObjects(T74, nil,unitallEnv);
            for i = 1 , count , 1 do
                ExecuteAction("NAMED_KILL", units[i]);
            end

            local units2, count2 = ObjectFindObjects(T84, nil,unitallEnv);
            for i = 1 , count2 , 1 do
                ExecuteAction("NAMED_KILL", units2[i]);
            end
        end

    end
end, {  })