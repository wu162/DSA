Airpower = FastHash("PlayerTech_Allied_AirPower")
HighTechnology = FastHash("PlayerTech_Allied_HighTechnology")
CrushPuppies = FastHash('PlayerTech_Soviet_CrushPuppies')
TerrorDroneEggs = FastHash('PlayerTech_Soviet_TerrorDroneEggs')
NavalPower = FastHash('PlayerTech_Japan_NavalPower')
EnhancedKamikaze = FastHash('PlayerTech_Japan_EnhancedKamikaze')
AdvancedMissilePacks = FastHash('PlayerTech_Japan_AdvancedMissilePacks')
ElectromagneticGun = FastHash('PlayerTech_Celestial_ElectromagneticGun')
ProductionBonus = FastHash('PlayerTech_ProductionBonus_Allies')
PlayerTech_Celestial_PowerSealOffId = FastHash('PlayerTech_Celestial_PowerSealOff')
exTogglePlayerGetTechEvent(1)

PlayerSideName = {
    ["Player_1"] = "恶魔",
    ["Player_2"] = "恶魔",
    ["Player_3"] = "恶魔",
    ["Player_4"] = "天使",
    ["Player_5"] = "天使",
    ["Player_6"] = "天使",
}

PlayerIndex = {
    ["Player_1"] = 1,
    ["Player_2"] = 2,
    ["Player_3"] = 3,
    ["Player_4"] = 4,
    ["Player_5"] = 5,
    ["Player_6"] = 6,
}

PlayerToComputer = {
    ["Player_1"] = "PlyrCivilian",
    ["Player_2"] = "PlyrCivilian",
    ["Player_3"] = "PlyrCivilian",
    ["Player_4"] = "PlyrCreeps",
    ["Player_5"] = "PlyrCreeps",
    ["Player_6"] = "PlyrCreeps",
}

function onPlayerGetTechEvent(playerName, techInstanceId)
    local sideName = PlayerSideName[playerName];
    local previous = SetWorldBuilderThisPlayer(1)
    local i = PlayerIndex[playerName];
    local computerPlayer = PlayerToComputer[playerName]
    if techInstanceId == Airpower then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_AlliedAirPower")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得空军升级!")
    elseif techInstanceId == HighTechnology then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_AlliedHighTechnology")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得高科技升级!")
    elseif techInstanceId == CrushPuppies then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_SovietCrushPuppiesPower")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得碾压升级!")
    elseif techInstanceId == TerrorDroneEggs then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_SovietTerrorDroneEggs")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得蜘蛛升级!")
    elseif techInstanceId == NavalPower then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_JapanNavalPower")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得海军协议!")
    elseif techInstanceId == EnhancedKamikaze then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_JapanEnhancedKamikaze")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得光荣自爆!")
    elseif techInstanceId == AdvancedMissilePacks then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_JapanAdvancedMissilePacks")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得先进弹药匣!")
    elseif techInstanceId == ElectromagneticGun then
        ExecuteAction("GIVE_PLAYER_UPGRADE", computerPlayer, "Upgrade_CelestialEMG")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得电磁炮!")
    elseif techInstanceId == PlayerTech_Celestial_PowerSealOffId then
        local round = exCounterGetByName("lvc")
        if round >= 3 then
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, "CelestialBattery", 1)
            exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name获得电能纳贡，解锁蓄元鼎建造权限!")
        else
            SchedulerModule.call_every_x_frame(function(pName)
                local round1 = exCounterGetByName("lvc")
                if round1 >= 3 then
                    ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", pName, "CelestialBattery", 1)
                end
            end, 30, nil, {playerName})
            exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name获得电能纳贡，第3回合后解锁蓄元鼎建造权限!")
        end
    elseif techInstanceId == ProductionBonus then
        ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", 'PlayerA_' .. i, 'AlliedWallPiece', computerPlayer .. '/team' .. computerPlayer, "jiaoyidian")
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name取得经济提升!")
    end
    SetWorldBuilderThisPlayer(previous)

end
AlliedMissileIntercept = FastHash("Upgrade_AlliedMissileIntercept")
AlliedPrismTankReduceSpeed = FastHash("Upgrade_AlliedPrismTankReduceSpeed")
AlliedAircraftAutoDivideBombs = FastHash("Upgrade_AlliedAircraftAutoDivideBombs")
AlliedAdvancedPrismEquipment = FastHash('Upgrade_AlliedAdvancedPrismEquipment')
AlliedCommandControlSystem = FastHash('Upgrade_AlliedCommandControlSystem')
AlliedAircraftCarrierDrone = FastHash('Upgrade_AlliedAircraftCarrierDrone')
SovietMissileIntercept = FastHash('Upgrade_SovietMissileIntercept')
SovietCompositeArmor = FastHash('Upgrade_SovietCompositeArmor')
SovietImprovedTeslaCoil = FastHash('Upgrade_SovietImprovedTeslaCoil')
SovietMultiModeGuidance = FastHash('Upgrade_SovietMultiModeGuidance')
JapanSubmarineAttack = FastHash('Upgrade_JapanSubmarineAttack')
JapanMechaRush = FastHash('Upgrade_JapanMechaRush')
JapanNanoTransmissionStructure = FastHash('Upgrade_JapanNanoTransmissionStructure')
JapanNanoSustainingForceField = FastHash('Upgrade_JapanNanoSustainingForceField')
CelestialSpeedUpdate = FastHash('Upgrade_CelestialSpeedUpdate')
CelestialSupplyElectricitySystem = FastHash('Upgrade_CelestialSupplyElectricitySystem')
CelestialAuxiliaryAimingSystem = FastHash('Upgrade_CelestialAuxiliaryAimingSystem')
RANK3 = FastHash('Upgrade_CelestialTech_RANK3')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedMissileIntercept')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedPrismTankReduceSpeed')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedAircraftAutoDivideBombs')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedAdvancedPrismEquipment')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedCommandControlSystem')
exRegisterUpgradeCompleteEvent('Upgrade_AlliedAircraftCarrierDrone')
exRegisterUpgradeCompleteEvent('Upgrade_SovietMissileIntercept')
exRegisterUpgradeCompleteEvent('Upgrade_SovietCompositeArmor')
exRegisterUpgradeCompleteEvent('Upgrade_SovietImprovedTeslaCoil')
exRegisterUpgradeCompleteEvent('Upgrade_SovietMultiModeGuidance')
exRegisterUpgradeCompleteEvent('Upgrade_JapanSubmarineAttack')
exRegisterUpgradeCompleteEvent('Upgrade_JapanMechaRush')
exRegisterUpgradeCompleteEvent('Upgrade_JapanNanoTransmissionStructure')
exRegisterUpgradeCompleteEvent('Upgrade_JapanNanoSustainingForceField')
exRegisterUpgradeCompleteEvent('Upgrade_CelestialSpeedUpdate')
exRegisterUpgradeCompleteEvent('Upgrade_CelestialSupplyElectricitySystem')
exRegisterUpgradeCompleteEvent('Upgrade_CelestialAuxiliaryAimingSystem')
exRegisterUpgradeCompleteEvent('Upgrade_CelestialTech_RANK3')
function onPlayerUpgradeCompleteEvent(playerName, upgradeInstanceId, objectId)
    for i = 1, 6, 1 do
        if i <= 3 then
            if playerName == 'Player_' .. i then
                local Ply = 'PlyrCivilian'
                if upgradeInstanceId == AlliedMissileIntercept then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedMissileIntercept")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得先进反导系统!")
                elseif upgradeInstanceId == RANK3 then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("ALLOW_DISALLOW_ONE_UPGRADE", playerName, "Upgrade_CelestialTech_RANK3", 'false')
                    exEnableWBScript("LEVELUP7");
                elseif upgradeInstanceId == AlliedPrismTankReduceSpeed then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedPrismTankReduceSpeed")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得激光协调矩阵!")
                elseif upgradeInstanceId == AlliedAircraftAutoDivideBombs then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedAircraftAutoDivideBombs")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得智能航电系统!")
                elseif upgradeInstanceId == AlliedAdvancedPrismEquipment then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedAdvancedPrismEquipment")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得先进稳相光学设备!")
                elseif upgradeInstanceId == AlliedCommandControlSystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedCommandControlSystem")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得战场全面信息化!")
                elseif upgradeInstanceId == AlliedAircraftCarrierDrone then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_AlliedAircraftCarrierDrone")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name取得先进航空指挥系统!")
                elseif upgradeInstanceId == SovietMissileIntercept then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_SovietMissileIntercept")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得防空火控雷达!")
                elseif upgradeInstanceId == SovietCompositeArmor then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_SovietCompositeArmor")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得外附装甲!")
                elseif upgradeInstanceId == SovietImprovedTeslaCoil then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_SovietImprovedTeslaCoil")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得预充能线圈!")
                elseif upgradeInstanceId == SovietMultiModeGuidance then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_SovietMultiModeGuidance")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得目标识别导引头!")
                elseif upgradeInstanceId == JapanSubmarineAttack then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_JapanSubmarineAttack")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得潜航发射!")
                elseif upgradeInstanceId == JapanMechaRush then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_JapanMechaRush")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得机甲冲击!")
                elseif upgradeInstanceId == JapanNanoTransmissionStructure then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_JapanNanoTransmissionStructure")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得高强度机械变形框架!")
                elseif upgradeInstanceId == JapanNanoSustainingForceField then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_JapanNanoSustainingForceField")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得纳米维持力场!")
                elseif upgradeInstanceId == CelestialSpeedUpdate then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_CelestialSpeedUpdate")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得电掣之势!")
                elseif upgradeInstanceId == CelestialSupplyElectricitySystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_CelestialSupplyElectricitySystem")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得超导电枢!")
                elseif upgradeInstanceId == CelestialAuxiliaryAimingSystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCivilian', "Upgrade_CelestialAuxiliaryAimingSystem")
                    exMessageAppendToMessageArea("恶魔$p" .. i .. "Name获得穿云定海!")
                end
                SetworldBuilderThisPlayer(previous)
            end
        elseif i > 3 then
            if playerName == 'Player_' .. i then
                local Ply = 'PlyrCreeps'
                if upgradeInstanceId == AlliedMissileIntercept then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedMissileIntercept")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得先进反导系统!")
                elseif upgradeInstanceId == RANK3 then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("ALLOW_DISALLOW_ONE_UPGRADE", playerName, "Upgrade_CelestialTech_RANK3", 'false')
                    exEnableWBScript("LEVELUP8");
                elseif upgradeInstanceId == AlliedPrismTankReduceSpeed then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedPrismTankReduceSpeed")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得激光协调矩阵!")
                elseif upgradeInstanceId == AlliedAircraftAutoDivideBombs then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedAircraftAutoDivideBombs")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得智能航电系统!")
                elseif upgradeInstanceId == AlliedAdvancedPrismEquipment then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedAdvancedPrismEquipment")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得先进稳相光学设备!")
                elseif upgradeInstanceId == AlliedCommandControlSystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedCommandControlSystem")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得战场全面信息化!")
                elseif upgradeInstanceId == AlliedAircraftCarrierDrone then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_AlliedAircraftCarrierDrone")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name取得先进航空指挥系统!")
                elseif upgradeInstanceId == SovietMissileIntercept then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_SovietMissileIntercept")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得防空火控雷达!")
                elseif upgradeInstanceId == SovietCompositeArmor then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_SovietCompositeArmor")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得外附装甲!")
                elseif upgradeInstanceId == SovietImprovedTeslaCoil then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_SovietImprovedTeslaCoil")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得预充能线圈!")
                elseif upgradeInstanceId == SovietMultiModeGuidance then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_SovietMultiModeGuidance")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得目标识别导引头!")
                elseif upgradeInstanceId == JapanSubmarineAttack then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_JapanSubmarineAttack")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得潜航发射!")
                elseif upgradeInstanceId == JapanMechaRush then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_JapanMechaRush")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得机甲冲击!")
                elseif upgradeInstanceId == JapanNanoTransmissionStructure then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_JapanNanoTransmissionStructure")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得高强度机械变形框架!")
                elseif upgradeInstanceId == JapanNanoSustainingForceField then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_JapanNanoSustainingForceField")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得纳米维持力场!")
                elseif upgradeInstanceId == CelestialSpeedUpdate then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_CelestialSpeedUpdate")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得电掣之势!")
                elseif upgradeInstanceId == CelestialSupplyElectricitySystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_CelestialSupplyElectricitySystem")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得超导电枢!")
                elseif upgradeInstanceId == CelestialAuxiliaryAimingSystem then
                    local previous = SetWorldBuilderThisPlayer(1)
                    ExecuteAction("GIVE_PLAYER_UPGRADE", 'PlyrCreeps', "Upgrade_CelestialAuxiliaryAimingSystem")
                    exMessageAppendToMessageArea("天使$p" .. i .. "Name获得穿云定海!")
                end
                SetworldBuilderThisPlayer(previous)
            end
        end
    end
end