g_UnitCreateEventFunc = {}

function ShowTimedHelp(ownerPlayerName, name, localizedText, x, y, z)
    name = format("%s_%s", ownerPlayerName, name)
    ExecuteAction("NAMED_DELETE", name)
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", name, "MultiplayerBeacon", format("%s/team%s", ownerPlayerName, ownerPlayerName), {
        X = x,
        Y = y,
        Z = z,
    }, 0)
    ExecuteAction("NAMED_SHOW_INFOBOX", name, localizedText, 0, "")
    SchedulerModule.delay_call(function(id)
        -- 这里使用 id 而不是 name 是因为 name 有可能被重复利用
        -- 我们并不希望删除新的同名对象
        -- 我们只需要删除之前的这个 id 对应的对象就行了
        if ObjectIsAlive(id) then
            ExecuteAction("NAMED_DELETE", GetObjectById(id))
        end
    end, 100, {GetObjectById(GetObjectByScriptName(name))})
end

function limitCelestialBattery(createdObjId, createdObjInstanceId, ownerPlayerName)
    SchedulerModule.delay_call(function(id)
        if ObjectIsAlive(id) then
            ExecuteAction("NAMED_DELETE", GetObjectById(id));
        end
    end, 15, {createdObjId})
end

function CelestialBatteryBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    local x, y, z = ObjectGetPosition(createdObjId)
    ShowTimedHelp(ownerPlayerName, "CelestialBatteryHelp", "SCRIPT:CelestialBatteryHelp", x, y, z)
end

function CelestialLaserTowerBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    local x, y, z = ObjectGetPosition(createdObjId)
    ShowTimedHelp(ownerPlayerName, "CelestialLaserTowerHelp", "SCRIPT:CelestialLaserTowerHelp", x, y, z)
    SchedulerModule.delay_call(function(id)
        if ObjectIsAlive(id) then
            local teamName = ObjectTeamName(GetObjectById(id))
            local playerName = g_objectTeamNameToPlayerName[teamName]
            ExecuteAction("NAMED_DELETE", GetObjectById(id));
            ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", playerName, 'CelestialAntiInfantryInfantryAdvanced', playerName .. '/team' .. playerName, 'commonSpawn')
        end
    end, 5, {createdObjId})
end

function CelestialSpaceReinforceMarkerBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    local x, y, z = ObjectGetPosition(createdObjId)
    ShowTimedHelp(ownerPlayerName, "CelestialReinforcementHelp", "SCRIPT:CelestialReinforcementHelp", x, y, z)
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
    end, 20, {createdObjId})
end

function AlliedSuperWeaponBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
    g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[ownerPlayerName]] = 1
    CenterTopBtnFunc_UpdatePlayer3rdButton(g_PlayerNameToIndex[ownerPlayerName])

    SchedulerModule.delay_call(function(id, playerName)
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "AlliedSuperWeapon", 0)
        if ObjectIsAlive(id) then
            ExecuteAction("NAMED_DELETE", GetObjectById(id))
        end
    end, 10, {createdObjId, ownerPlayerName})

end

g_UnitCount = {
    [FastHash("JapanGigaFortressShipEgg")] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 0,
    }
}

function UnitCountFunc(createdObjId, createdObjInstanceId, ownerPlayerName)
    SchedulerModule.delay_call(function(id, instanceId, playerName)
        local count = g_UnitCount[instanceId][g_PlayerNameToIndex[playerName]];
        g_UnitCount[instanceId][g_PlayerNameToIndex[playerName]] = count + 1;
        if ObjectIsAlive(id) then
            ExecuteAction("NAMED_DELETE", GetObjectById(id))
        end
    end, 8, {createdObjId, createdObjInstanceId, ownerPlayerName})

end

g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForSovietAdvancedPower")] = limitCelestialBattery

g_UnitCreateEventFunc[FastHash("CelestialLaserTower")] = CelestialLaserTowerBorn
g_UnitCreateEventFunc[FastHash("CelestialBattery")] = CelestialBatteryBorn
g_UnitCreateEventFunc[FastHash("CelestialSpaceReinforceMarker")] = CelestialSpaceReinforceMarkerBorn

g_UnitCreateEventFunc[FastHash("CelestialCenturionUpgradeObject")] = CelestialCenturionUpgradeBorn
g_UnitCreateEventFunc[FastHash("AlliedSuperWeapon")] = AlliedSuperWeaponBorn

g_UnitCreateEventFunc[FastHash("JapanGigaFortressShipEgg")] = UnitCountFunc

--exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialPower")
--exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialAdvancedPower")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialPower")
--exObjectRegisterCreateEvent("CelestialElectricitySale_ForAlliedTurbine")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForAlliedTurbine")
--exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForSovietAdvancedPower")
exObjectRegisterCreateEvent("CelestialLaserTower")
exObjectRegisterCreateEvent("CelestialBattery")
exObjectRegisterCreateEvent("CelestialSpaceReinforceMarker")

exObjectRegisterCreateEvent("CelestialCenturionUpgradeObject")
exObjectRegisterCreateEvent("AlliedSuperWeapon")
exObjectRegisterCreateEvent("JapanGigaFortressShipEgg")

function onUnitCreateEvent(createdObjId, createdObjInstanceId, ownerPlayerName)
    g_UnitCreateEventFunc[createdObjInstanceId](createdObjId, createdObjInstanceId, ownerPlayerName)
end
