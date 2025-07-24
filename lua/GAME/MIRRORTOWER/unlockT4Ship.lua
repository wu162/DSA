
local enableT4Ship = {
    [1] = 'AlliedAntiStructureShip',
    [2] = 'AlliedAntiStructureShip_Enhanced',
    [3] = 'CelestialAntiStructureShip',
    [4] = 'CelestialAntiStructureShip_Enhanced',
    [5] = 'SovietAntiStructureShip',
    [6] = 'SovietAntiStructureShip_Enhanced',
    [7] = 'JapanAntiStructureShip',
    [8] = 'JapanAntiStructureShip_Enhanced',
    [9] = 'JapanGigaFortressShipEgg',
}

for i = 1 , 3 , 1 do
    for j = 1, 9, 1 do
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING","Player_"..i , enableT4Ship[j], 1)
    end
end

exAddTextToPublicBoard('恶魔方摧毁敌方海3塔，立即释放一次达摩克利斯之剑(不消耗释放次数)!',10)

SchedulerModule.delay_call(function()
    ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT", "Sea3ProtectShip8", "JapanFortressShip", "PlyrCreeps/teamPlyrCreeps", "seaTower8");
    local Sea3ProtectShip8 = GetObjectByScriptName("Sea3ProtectShip8");
    ExecuteAction("UNIT_SET_HEALTH", "Sea3ProtectShip8", 10000);
end, 15 * 16)