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
PlayerTech_ProductionBonus_SovietId = FastHash('PlayerTech_ProductionBonus_Soviet')
PlayerTech_ProductionBonus_JapanId = FastHash('PlayerTech_ProductionBonus_Japan')
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
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name获得盟军自由贸易协议，取得经济提升!")
    elseif techInstanceId == PlayerTech_ProductionBonus_JapanId then
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name获得帝国机械化组装协议，解锁全体坦克护盾技能");
        g_ProductionBonus_JapanGet[g_PlayerNameToIndex[playerName]] = 1
        CenterTopBtnFunc_UpdatePlayer3rdButton(i)
    elseif techInstanceId == PlayerTech_ProductionBonus_SovietId then
        -- 通知一下大家 苏联大生产好了
        exMessageAppendToMessageArea(sideName .. "$p" .. i .. "Name获得苏联大生产协议，全体单位降价");
        g_ProductionBonus_SovietGet[g_PlayerNameToIndex[playerName]] = 1
    end
    SetWorldBuilderThisPlayer(previous)

end

-- Ordered upgrade list
local upgrades = {
    { "Upgrade_AlliedMissileIntercept", "取得先进反导系统!" },
    { "Upgrade_AlliedPrismTankReduceSpeed", "取得激光协调矩阵!" },
    { "Upgrade_AlliedAircraftAutoDivideBombs", "取得智能航电系统!" },
    { "Upgrade_AlliedAdvancedPrismEquipment", "取得先进稳相光学设备!" },
    { "Upgrade_AlliedCommandControlSystem", "取得战场全面信息化!" },
    { "Upgrade_AlliedAircraftCarrierDrone", "取得先进航空指挥系统!" },

    { "Upgrade_SovietMissileIntercept", "获得防空火控雷达!" },
    { "Upgrade_SovietCompositeArmor", "获得外附装甲!" },
    { "Upgrade_SovietImprovedTeslaCoil", "获得预充能线圈!" },
    { "Upgrade_SovietMultiModeGuidance", "获得目标识别导引头!" },

    { "Upgrade_JapanSubmarineAttack", "获得潜航发射!" },
    { "Upgrade_JapanMechaRush", "获得机甲冲击!" },
    { "Upgrade_JapanNanoTransmissionStructure", "获得高强度机械变形框架!" },
    { "Upgrade_JapanNanoSustainingForceField", "获得纳米维持力场!" },

    { "Upgrade_CelestialSpeedUpdate", "获得电掣之势!" },
    { "Upgrade_CelestialSupplyElectricitySystem", "获得超导电枢!" },
    { "Upgrade_CelestialAuxiliaryAimingSystem", "获得穿云定海!" },

    { "Upgrade_CelestialLodestarDevice", "获得移星换位!" },
    { "Upgrade_JapanIntelligentAmmunition", "获得白田火控AI!" },
    { "Upgrade_SovietGloriousArmedForce", "获得光荣武装!" },

    { "Upgrade_AlliedCryoWeaponArray", "获得冰冻武器阵列!" },
}
local RANK3_NAME = "Upgrade_CelestialTech_RANK3"
local RANK3_ID = FastHash(RANK3_NAME)

-- lookup: id -> {name, msg}
local upgradeLookup = {}
-- build lookup + register events
for i = 1, getn(upgrades) do
    local name = upgrades[i][1]
    local msg  = upgrades[i][2]

    local id = FastHash(name)
    upgradeLookup[id] = { name, msg }

    exRegisterUpgradeCompleteEvent(name)
end
exRegisterUpgradeCompleteEvent(RANK3_NAME)

function onPlayerUpgradeCompleteEvent(playerName, upgradeInstanceId, objectId)
    local playerIndex = PlayerIndex[playerName];

    local isFirstTeam = playerIndex <= 3

    local factionName = PlayerSideName[playerName]
    local targetPlayer = PlayerToComputer[playerName]

    -- "$pXName"
    local playerToken = "$p" .. playerIndex .. "Name"

    -- Special case
    if upgradeInstanceId == RANK3_ID then
        local previous = SetWorldBuilderThisPlayer(1)

        ExecuteAction("ALLOW_DISALLOW_ONE_UPGRADE", playerName, RANK3_NAME, 'false')
        if isFirstTeam then
            exEnableWBScript("LEVELUP7")
        else
            exEnableWBScript("LEVELUP8")
        end

        SetWorldBuilderThisPlayer(previous)
        return
    end

    -- O(1) lookup
    local entry = upgradeLookup[upgradeInstanceId]
    if not entry then
        _ALERT("Unknown upgrade completed: " .. upgradeInstanceId)
        return
    end

    local previous = SetWorldBuilderThisPlayer(1)

    ExecuteAction("GIVE_PLAYER_UPGRADE", targetPlayer, entry[1])

    exMessageAppendToMessageArea(
        factionName .. playerToken .. entry[2]
    )

    SetWorldBuilderThisPlayer(previous)
end