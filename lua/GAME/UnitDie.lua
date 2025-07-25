g_UnitDieEventFunc = {}

function CelestialBatteryDie(dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
    if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", GetObjectById(dyingObjId), "UNPACKING") then
        local x, y, z = ObjectGetPosition(GetObjectById(dyingObjId))
        SchedulerModule.delay_call(function(playerName, nx,ny,nz)
            local previous = SetWorldBuilderThisPlayer(1);
            ExecuteAction("PLAYER_GIVE_MONEY", playerName, 1200);
            exShowTextAtPos("获得$1200", nx, ny, nz, 189465)
            SetWorldBuilderThisPlayer(previous)
        end, 5, {ownerPlayerName, x,y,z})
    end

end

g_UnitDieEventFunc[FastHash("CelestialBattery")] = CelestialBatteryDie

exObjectRegisterDieEvent("CelestialBattery")

function onUnitDieEvent(dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
    g_UnitDieEventFunc[dyingObjInstanceId](dyingObjId, attackerId, dyingObjInstanceId, attackerInstanceId, ownerPlayerName)
end