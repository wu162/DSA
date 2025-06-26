condition=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        'JapanPowerPlantEgg',"AlliedPowerPlant","JapanPowerPlant","SovietPowerPlant"
    }
})
FilterPower=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "AlliedPowerPlant","JapanPowerPlant","SovietPowerPlant"
    }
})
function addmoney  (money)
    for playindex = 1 , 6 , 1 do
        local playerName = "Player_"..playindex;
        if g_PlayerInDebt[playerName] == 0 then
            local TAR, count = ObjectFindObjects(P[playindex], nil,FilterPower)
            for i = 1 , count , 1 do
                if not EvaluateCondition("UNIT_HAS_MODELCONDITION", TAR[i] , "STRUCTURE_UNPACKING") then
                    if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", TAR[i] ,"PLAYER_POWER_2") then
                        ExecuteAction("PLAYER_GIVE_MONEY","Player_"..playindex , money)
                        --  exMessageAppendToMessageArea("¼ÛÇ®")
                        local objectId = ObjectGetId(TAR[i])
                        exShowFloatingIntAtObject( objectId, money)
                    end
                end
            end
        end

    end
end