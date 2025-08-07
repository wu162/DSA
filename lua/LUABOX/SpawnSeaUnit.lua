-- 大概以后会扩充成生成所有海军  目前先只管acv

function SpawnSeaUnit()
    SpawnSeaUnit_left()
    SpawnSeaUnit_right()
end

function SpawnSeaUnit_left()
    local countSlot = g_UnitCount[FastHash("AlliedAntiInfantryVehicle")];
    for i = 1, 3 do

        local angle = 0;
        if i >= 4 then
            angle = 180
        end
        local teamIndex = 7;
        if i >= 4 then
            teamIndex = 8;
        end
        for j = 1, countSlot[i] do
            local suffix = mod(j, 6);
            if suffix == 0 then
                suffix = 6;
            end

            local x, y, z = ObjectGetPosition(AIRSP[teamIndex][suffix]) ;
            ExecuteAction("CREATE_OBJECT", "AlliedAntiInfantryVehicle", SHIPTEAM[teamIndex], {X=x,Y=y,Z=z}, 0)

        end
    end

    for spindex = 1 , 6 , 1 do
        if  EvaluateCondition("TEAM_HAS_UNITS", SHIPTEAM[7]) then
            for levelindex = 1 , LEVELUP[7] , 1 do
                ExecuteAction("TEAM_GAIN_LEVEL",SHIPTEAM[7],1)
            end
            ExecuteAction("TEAM_MERGE_INTO_TEAM",SHIPTEAM[7], SHIPTEAMATTACK[7])
        end
    end

end

function SpawnSeaUnit_right()
    local countSlot = g_UnitCount[FastHash("AlliedAntiInfantryVehicle")];
    for i = 4, 6 do
        local angle = 0;
        if i >= 4 then
            angle = 180
        end
        local teamIndex = 7;
        if i >= 4 then
            teamIndex = 8;
        end
        for j = 1, countSlot[i] do
            local suffix = mod(j, 6);
            if suffix == 0 then
                suffix = 6;
            end

            local x, y, z = ObjectGetPosition(AIRSP[teamIndex][suffix]) ;
            ExecuteAction("CREATE_OBJECT", "AlliedAntiInfantryVehicle", SHIPTEAM[teamIndex], {X=x,Y=y,Z=z}, 180)


        end
    end

    for spindex = 1 , 6 , 1 do
        if  EvaluateCondition("TEAM_HAS_UNITS", SHIPTEAM[8]) then
            for levelindex = 1 , LEVELUP[8] , 1 do
                ExecuteAction("TEAM_GAIN_LEVEL",SHIPTEAM[8],1)
            end
            ExecuteAction("TEAM_MERGE_INTO_TEAM", SHIPTEAM[8], SHIPTEAMATTACK[8])
        end
    end

end