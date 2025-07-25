g_UnitDieEventFunc = {}

CELESTIAL_BATTERY_DIE_MONEY = 1100
function CelestialBatteryDie(dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
    if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", GetObjectById(dyingObjId), "UNPACKING") then
        local x, y, z = ObjectGetPosition(GetObjectById(dyingObjId))
        SchedulerModule.delay_call(function(playerName, nx,ny,nz)
            local previous = SetWorldBuilderThisPlayer(1);
            ExecuteAction("PLAYER_GIVE_MONEY", playerName, CELESTIAL_BATTERY_DIE_MONEY)
            exShowTextAtPos("获得$" .. CELESTIAL_BATTERY_DIE_MONEY, nx, ny, nz, 189465)
            SetWorldBuilderThisPlayer(previous)
        end, 5, {ownerPlayerName, x,y,z})
    end

end

g_UnitDieEventFunc[FastHash("CelestialBattery")] = CelestialBatteryDie

exObjectRegisterDieEvent("CelestialBattery")

function onUnitDieEvent(dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
    g_UnitDieEventFunc[dyingObjInstanceId](dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
end