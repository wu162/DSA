g_UnitCreateEventFunc = {}

function limitCelestialBattery(createdObjId, createdObjInstanceId, ownerPlayerName)
    SchedulerModule.delay_call(function(id)
        if ObjectIsAlive(id) then
            ExecuteAction("NAMED_DELETE", GetObjectById(id));
        end
    end, 15, {createdObjId})
end

function CelestialLaserTowerBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    SchedulerModule.delay_call(function(id)
        if ObjectIsAlive(id) then
            local teamName = ObjectTeamName(GetObjectById(id))
            local playerName = g_objectTeamNameToPlayerName[teamName]
            ExecuteAction("NAMED_DELETE", GetObjectById(id));
            ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", playerName, 'CelestialAntiInfantryInfantryAdvanced', playerName .. '/team' .. playerName, 'commonSpawn')
        end
    end, 5, {createdObjId})
end

function CelestialCenturionUpgradeBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    -- 每当百夫长物体出生之后，先等一会（等百夫长机制初始化完毕），之后再看看是不是该给千夫长/万夫长了
    local round = exCounterGetByName("lvc")
    if round < 9 then
        -- 前面几个回合不给你用千夫长
        return
    end
    SchedulerModule.delay_call(function(id)
        if ObjectIsAlive(id) then
            -- 获取拥有百夫长的步兵
            local table, count = ObjectGetAttachees(id)
            if count > 0 and ObjectIsAlive(table[1]) then
                local centurion = table[1]
                -- 看看他是不是已经是千夫长
                local attachers, attachersCount = ObjectGetAttachers(centurion)
                for i = 1, attachersCount do
                    if ObjectTemplateName(attachers[i]) == ObjectTemplateName(GetObjectById(id)) then
                        if EvaluateCondition("UNIT_HAS_OBJECT_STATUS", attachers[i], "WEAPON_UPGRADED_02") then
                            -- 已经是千夫长了
                            return
                        end
                    end
                end
                -- 如果不是千夫长，就给他千夫长
                local x, y, z = ObjectGetPosition(centurion)
                ObjectUnloadAttributeModifier(centurion, "AttributeMod_CenturionUpgradeLeaderPrevent")
                ObjectUnloadAttributeModifier(centurion, "AttributeMod_CenturionUpgradeLeaderPreventPrevent")
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", centurion, "EXITING_COMBINED", 0);
                ObjectCreateAndFireTempWeaponToTarget(id, "CelestialCenturionUpgradeWeapon", {
                    X = x,
                    Y = y,
                    Z = z,
                }, centurion)
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", centurion, "EXITING_COMBINED", 0);
            end
        end
    end, 25, {createdObjId})
end

g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForSovietAdvancedPower")] = limitCelestialBattery

g_UnitCreateEventFunc[FastHash("CelestialLaserTower")] = CelestialLaserTowerBorn

g_UnitCreateEventFunc[FastHash("CelestialCenturionUpgradeObject")] = CelestialCenturionUpgradeBorn


--exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialPower")
--exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialAdvancedPower")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialPower")
--exObjectRegisterCreateEvent("CelestialElectricitySale_ForAlliedTurbine")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForAlliedTurbine")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForSovietAdvancedPower")
exObjectRegisterCreateEvent("CelestialLaserTower")

exObjectRegisterCreateEvent("CelestialCenturionUpgradeObject")

function onUnitCreateEvent(createdObjId, createdObjInstanceId, ownerPlayerName)
    g_UnitCreateEventFunc[createdObjInstanceId](createdObjId, createdObjInstanceId, ownerPlayerName)
end
