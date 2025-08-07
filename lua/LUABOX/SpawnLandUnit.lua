-- 大概以后会扩充成生成所有陆军  目前先只管acv

function SpawnLandUnit()
    SpawnLandUnit_left()
    SpawnLandUnit_right()
end

function SpawnLandUnit_left()
    local countSlot = g_UnitCount[FastHash("AlliedAntiInfantryVehicle_Ground")];
    for i = 1, 3 do
        local spawnPosPrefix = "LIGHTVEH1"
        if i >= 4 then
            spawnPosPrefix = "LIGHTVEH2"
        end
        local landSpawnPosPrefix = "LIGHTVEH1"
        if i >= 4 then
            landSpawnPosPrefix = "LIGHTVEH2"
        end

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

            local x, y, z = ObjectGetPosition(LIGHTVEHSP[teamIndex][suffix]) ;
            ExecuteAction("CREATE_OBJECT", "AlliedAntiInfantryVehicle_Ground", LIGHTVEHTEAM[teamIndex][suffix], {X=x,Y=y,Z=z}, 0)

        end
    end

    for spindex = 1 , 6 , 1 do
        if  EvaluateCondition("TEAM_HAS_UNITS", LIGHTVEHTEAM[7][spindex]) then
            ExecuteAction("TEAM_GARRISON_SPECIFIC_BUILDING_INSTANTLY", LIGHTVEHTEAM[7][spindex] ,LIGHTVEHSPCH[7][spindex] )
            for levelindex = 1 , LEVELUP[7] , 1 do
                ExecuteAction("TEAM_GAIN_LEVEL",LIGHTVEHTEAM[7][spindex],1)
            end
            ExecuteAction("TEAM_MERGE_INTO_TEAM",LIGHTVEHTEAM[7][spindex],LIGHTVEHATTACK[7][spindex])
            ExecuteAction("EXIT_SPECIFIC_BUILDING", LIGHTVEHSPCH[7][spindex] )
        end
    end

end

function SpawnLandUnit_right()
    local countSlot = g_UnitCount[FastHash("AlliedAntiInfantryVehicle_Ground")];
    for i = 4, 6 do
        local spawnPosPrefix = "LIGHTVEH1"
        if i >= 4 then
            spawnPosPrefix = "LIGHTVEH2"
        end
        local landSpawnPosPrefix = "LIGHTVEH1"
        if i >= 4 then
            landSpawnPosPrefix = "LIGHTVEH2"
        end

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
            local x, y, z = ObjectGetPosition(LIGHTVEHSP[teamIndex][suffix]) ;
            ExecuteAction("CREATE_OBJECT", "AlliedAntiInfantryVehicle_Ground", LIGHTVEHTEAM[teamIndex][suffix], {X=x,Y=y,Z=z}, 180)

        end
    end

    for spindex = 1 , 6 , 1 do
        if  EvaluateCondition("TEAM_HAS_UNITS", LIGHTVEHTEAM[8][spindex]) then
            ExecuteAction("TEAM_GARRISON_SPECIFIC_BUILDING_INSTANTLY", LIGHTVEHTEAM[8][spindex] , LIGHTVEHSPCH[8][spindex] )
            for levelindex = 1 , LEVELUP[8] , 1 do
                ExecuteAction("TEAM_GAIN_LEVEL",LIGHTVEHTEAM[8][spindex],1)
            end
            ExecuteAction("TEAM_MERGE_INTO_TEAM",LIGHTVEHTEAM[8][spindex],LIGHTVEHATTACK[8][spindex])
            ExecuteAction("EXIT_SPECIFIC_BUILDING",LIGHTVEHSPCH[8][spindex] )
        end
    end

end