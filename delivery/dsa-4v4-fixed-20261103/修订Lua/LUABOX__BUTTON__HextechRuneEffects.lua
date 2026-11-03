



HextechRune = HextechRune or {}

HextechRune.UnitTypeFilters = {
    infantry = CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER", Include = "INFANTRY",
        Exclude = "STRUCTURE AIRCRAFT SHIP DEBRIS"
    }),
    vehicle = CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER", Include = "VEHICLE HUGE_VEHICLE",
        Exclude = "STRUCTURE AIRCRAFT SHIP DEBRIS"
    }),
    aircraft = CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER", Include = "AIRCRAFT",
        Exclude = "STRUCTURE DEBRIS"
    }),
    navy = CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER", Include = "SHIP",
        Exclude = "STRUCTURE DEBRIS"
    }),
}



HextechRune.DualUnitTypeFilters = nil

function HextechRune:GetDualUnitTypeFilters()
    if self.DualUnitTypeFilters == nil then
        self.DualUnitTypeFilters = {
            {
                Types = { "vehicle", "aircraft" },
                Filter = CreateObjectFilter({
                    Rule = "ANY", Relationship = "SAME_PLAYER",
                    IncludeThing = g_TargetGroupNames.DualFormVehicleAir,
                    Exclude = "STRUCTURE DEBRIS"
                }),
            },
            {
                Types = { "aircraft", "navy" },
                Filter = CreateObjectFilter({
                    Rule = "ANY", Relationship = "SAME_PLAYER",
                    IncludeThing = g_TargetGroupNames.DualFormAirNavy,
                    Exclude = "STRUCTURE DEBRIS"
                }),
            },
            {
                Types = { "infantry", "aircraft" },
                Filter = CreateObjectFilter({
                    Rule = "ANY", Relationship = "SAME_PLAYER",
                    IncludeThing = g_TargetGroupNames.DualFormInfantryAir,
                    Exclude = "STRUCTURE DEBRIS"
                }),
            },
        }
    end
    return self.DualUnitTypeFilters
end


HextechRune.InfiniteAmmoAircraftFilter = nil

function HextechRune:GetInfiniteAmmoAircraftFilter()
    if self.InfiniteAmmoAircraftFilter == nil then
        self.InfiniteAmmoAircraftFilter = CreateObjectFilter({
            Rule = "ANY", Relationship = "SAME_PLAYER",
            IncludeThing = g_TargetGroupNames.InfiniteAmmoAircraft,
        })
    end
    return self.InfiniteAmmoAircraftFilter
end
HextechRune.UnitTypeOrder = { "infantry", "vehicle", "aircraft", "navy" }

HextechRune.PersistentBuffDuration = 9999


HextechRune.BattleUnitAssignments = HextechRune.BattleUnitAssignments or {}


HextechRune.RagnarokUnits = HextechRune.RagnarokUnits or {}

if not g_HextechDamageX150Modifier then
    g_HextechDamageX150Modifier = exAttributeModifierCreate({ DAMAGE_MULT = 1.5 }, 1)
end
if not g_HextechSpeedX140Modifier then
    g_HextechSpeedX140Modifier = exAttributeModifierCreate({ SPEED = 1.4 }, 1)
end
if not g_HextechRateOfFireX150Modifier then
    g_HextechRateOfFireX150Modifier = exAttributeModifierCreate({ RATE_OF_FIRE = 1.5 }, 1)
end

if not g_HextechRangeX115Modifier then
    g_HextechRangeX115Modifier = exAttributeModifierCreate({ RANGE = 1.15, VISION = 1.15 }, 1)
end
if not g_HextechRangeX125Modifier then
    g_HextechRangeX125Modifier = exAttributeModifierCreate({ RANGE = 1.25, VISION = 1.25 }, 1)
end
if not g_HextechRangeX150Modifier then
    g_HextechRangeX150Modifier = exAttributeModifierCreate({ RANGE = 1.5, VISION = 1.5 }, 1)
end
if not g_HextechAstralBodyModifier then
    
    g_HextechAstralBodyModifier = exAttributeModifierCreate({
        HEALTH_MULT = 1.75,
        DAMAGE_MULT = 0.75,
    }, 1)
end
if not g_HextechRagnarokModifier then
    g_HextechRagnarokModifier = exAttributeModifierCreate({ DAMAGE_MULT = 1.9 }, 1)
end
if not g_HextechGoliathModifier then
    
    g_HextechGoliathModifier = exAttributeModifierCreate({
        HEALTH_MULT = 1.9,
        DAMAGE_MULT = 1.25,
    }, 1)
end
if not g_HextechEnemyRangeX075Modifier then
    g_HextechEnemyRangeX075Modifier = exAttributeModifierCreate({ RANGE = 0.75 }, 1)
end


HextechRune.AllSideUnitsFilter = HextechRune.AllSideUnitsFilter or CreateObjectFilter({
    Rule = "ANY", Relationship = "SAME_PLAYER",
    Include = "INFANTRY VEHICLE HUGE_VEHICLE AIRCRAFT SHIP",
    Exclude = "STRUCTURE DEBRIS"
})
HextechRune.AllSideUnitsAndStructuresFilter = HextechRune.AllSideUnitsAndStructuresFilter
    or CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER",
        Include = "INFANTRY VEHICLE HUGE_VEHICLE AIRCRAFT SHIP STRUCTURE",
        Exclude = "DEBRIS"
    })
HextechRune.BroadbandJammingApplied = HextechRune.BroadbandJammingApplied or {}
HextechRune.DivineInterventionInterval = 450

HextechRune.DivineInterventionBaseDuration = 45
HextechRune.DivineInterventionExtraDurationPerCopy = 23


HextechRune.DivineInterventionSchedulerId = HextechRune.DivineInterventionSchedulerId or nil
HextechRune.FiveThunderFirstPower = "SpecialPower_CelestialPantaOrbitalStrike"
HextechRune.FiveThunderRepeatPower = "SpecialPower_CelestialOrbitalStrike0cd"
HextechRune.FiveThunderState = HextechRune.FiveThunderState or {}
HextechRune.FiveThunderMonitorSchedulerId = HextechRune.FiveThunderMonitorSchedulerId or nil
HextechRune.FiveThunderCooldownRounds = 3
HextechRune.TeslaAirAssaultPower = "SpecialPower_SovietTeslaAirAssault"


HextechRune.BattleDeathObserverReady =
    HextechRune.BattleDeathObserverReady or false
HextechRune.BattleDeathPhaseActive =
    HextechRune.BattleDeathPhaseActive or false


HextechRune.CashRewardSpecialPower = "SpecialPower_ProductionKickbacks"
HextechRune.CashRewardPlayerTech = "PlayerTech_Soviet_ProductionKickbacks"
HextechRune.FortifiedTowerState = HextechRune.FortifiedTowerState or {}
HextechRune.TranscendentEvilModifiers = HextechRune.TranscendentEvilModifiers or {}
HextechRune.FiveTigerGeneralsPower = "SpecialPower_CelestialCenturionUpgrade"
HextechRune.FiveTigerGeneralsCommand = "Command_Celestial_CenturionUpgrade"
HextechRune.BattleUnitEffectDelay = 45


HextechRune.AirBatchEffectDelay = 200
HextechRune.FiveTigerPowerGranted = HextechRune.FiveTigerPowerGranted or {}

HextechRune.CenturionGranted = HextechRune.CenturionGranted or {}
HextechRune.CenturionSpellbookFilter = HextechRune.CenturionSpellbookFilter
    or CreateObjectFilter({
        Rule = "ANY", Relationship = "SAME_PLAYER",
        IncludeThing = { "playerspellbook" },
    })
g_HextechFiveTigerPendingTargets = g_HextechFiveTigerPendingTargets or {}

g_HextechRecycleBonus = g_HextechRecycleBonus or { 0, 0, 0, 0, 0, 0 }
g_HextechBuyTwoGetOne = g_HextechBuyTwoGetOne or {}
g_HextechOilDerrickSerial = g_HextechOilDerrickSerial or { 0, 0, 0, 0, 0, 0 }
g_HextechTowerDefenseExpert = g_HextechTowerDefenseExpert or { false, false, false, false, false, false }
g_HextechUltimateRefreshCount = g_HextechUltimateRefreshCount or { 0, 0, 0, 0, 0, 0 }
g_HextechOblivionBombCharges = g_HextechOblivionBombCharges or { 0, 0, 0, 0, 0, 0 }

g_HextechGrantAegisSlots = g_HextechGrantAegisSlots or { ["angel"] = { 0, 0 }, ["evil"] = { 0, 0 } }


g_HextechDF41ExtraQuota = g_HextechDF41ExtraQuota or {}


if HextechRune_BaseGetRecycleRate == nil and GetRecycleRate ~= nil then
    HextechRune_BaseGetRecycleRate = GetRecycleRate
    function GetRecycleRate(playerIndex)
        local baseRate = HextechRune_BaseGetRecycleRate(playerIndex)
        return baseRate * (1 + (g_HextechRecycleBonus[playerIndex] or 0))
    end
end

function HextechRune:PickBonusRune(playerIndex, rarity, sourceEffect)
    local pool = self:BuildFilteredPool(playerIndex, rarity)
    local candidates = {}
    for i = 1, getn(pool), 1 do
        local rune = pool[i]
        if not (sourceEffect == "gambling_addict"
            and rune.Effect == "gambling_addict") then
            tinsert(candidates, rune)
        end
    end
    if getn(candidates) == 0 then
        return nil
    end
    return candidates[self:RandomIndex(getn(candidates))]
end

function HextechRune:GrantBonusRune(playerIndex, rarity, sourceName, sourceEffect,
    silentBroadcast)
    local rune = self:PickBonusRune(playerIndex, rarity, sourceEffect)
    if rune == nil or not self:AddOwnedRune(playerIndex, rune) then
        return nil
    end
    self:OnRuneChosen(playerIndex, rune)
    if silentBroadcast ~= true then
        exAddTextToPublicBoard(Localization.get("hextech.bonus.broadcast",
            playerIndex, sourceName, self:GetRuneDisplayName(rune)), 10)
    end
    return rune
end

function HextechRune:ApplyQualityTransformation(playerIndex, rune)
    self:GrantBonusRune(playerIndex, rune.UpgradeRarity,
        Localization.get("hextech.rune.quality_transformation.name"), rune.Effect)
end

function HextechRune:RollGamblingAddictRarity()
    local roll = GetRandomNumber() * 100
    if roll < 10 then
        return 1
    elseif roll < 50 then
        return 2
    end
    return 3
end

function HextechRune:ApplyGamblingAddict(playerIndex)
    local sourceName = Localization.get("hextech.rune.gambling_addict.name")
    local granted = {}
    for rewardIndex = 1, 2, 1 do
        local rarity = self:RollGamblingAddictRarity()
        local rune = self:GrantBonusRune(playerIndex, rarity, sourceName,
            "gambling_addict", true)
        if rune ~= nil then
            tinsert(granted, rune)
        end
    end
    
    if getn(granted) == 2 then
        exAddTextToPublicBoard(Localization.get("hextech.gambling_addict.broadcast",
            playerIndex, sourceName, self:GetRuneDisplayName(granted[1]),
            self:GetRuneDisplayName(granted[2])), 10)
    elseif getn(granted) == 1 then
        exAddTextToPublicBoard(Localization.get("hextech.bonus.broadcast",
            playerIndex, sourceName, self:GetRuneDisplayName(granted[1])), 10)
    end
end

function HextechRune:GetPlayerSideIndex(playerIndex)
    if g_IsDevilSeat(playerIndex) then
        return 7
    end
    return 8
end

function HextechRune:GetEnemySideIndex(playerIndex)
    if g_IsDevilSeat(playerIndex) then
        return 8
    end
    return 7
end

function HextechRune:GetSidePlayerSeats(sideIndex)
    return g_SideSeatsOf(sideIndex) or {}
end



function HextechRune:GetSideRuneCopyCount(sideIndex, ownershipId)
    local sideSeats = self:GetSidePlayerSeats(sideIndex)
    local count = 0
    for k = 1, getn(sideSeats), 1 do
        local slotIndex = sideSeats[k]
        self:EnsureRuneSlotState(slotIndex)
        if self.PlayerSlotOwnedRuneIds[slotIndex][ownershipId] then
            count = count + 1
        end
    end
    return count
end

function HextechRune:GetSideOwnedRuneCount(sideIndex, runeId)
    return self:GetSideRuneCopyCount(sideIndex, runeId)
end


function HextechRune:ApplyBroadbandJamming(playerIndex, rune, sourceName)
    local enemySideIndex = self:GetEnemySideIndex(playerIndex)
    if P == nil or g_GetSideScanAnchor(enemySideIndex) == nil then
        return
    end
    local effectInstanceId = "P" .. tostring(playerIndex) .. ":"
        .. self:GetRuneEffectInstanceId(rune)
    if self.BroadbandJammingApplied[effectInstanceId] == nil then
        self.BroadbandJammingApplied[effectInstanceId] = {}
    end
    local applied = self.BroadbandJammingApplied[effectInstanceId]
    local units, count = ObjectFindObjects(g_GetSideScanAnchor(enemySideIndex), nil, self.AllSideUnitsFilter)
    for i = 1, count, 1 do
        local unit = units[i]
        local objectId = ObjectGetId(unit)
        local previous = applied[objectId]
        if not self:IsPresetMapUnit(unit)
            and (previous == nil or previous ~= unit) then
            ObjectLoadAttributeModifier(unit, g_HextechEnemyRangeX075Modifier,
                self.PersistentBuffDuration)
            applied[objectId] = unit
        end
    end
end

function HextechRune:ApplyAllBroadbandJamming(sourceName)
    for playerIndex = 1, 8, 1 do
        self:EnsurePlayerRuneState(playerIndex)
        local owned = self.PlayerOwnedRunes[playerIndex]
        for runeIndex = 1, getn(owned), 1 do
            local rune = owned[runeIndex]
            if rune.Effect == "broadband_jamming" then
                self:ApplyBroadbandJamming(playerIndex, rune, sourceName)
            end
        end
    end
end

function HextechRune:ApplyDivineInterventionToSide(sideIndex, sourceName)
    local ownedCount = self:GetSideOwnedRuneCount(sideIndex,
        "prismatic_divine_intervention")
    if ownedCount <= 0 or P == nil or g_GetSideScanAnchor(sideIndex) == nil then
        return
    end
    local duration = self.DivineInterventionBaseDuration
        + self.DivineInterventionExtraDurationPerCopy * (ownedCount - 1)
    local objects, count = g_SideFindObjects(sideIndex, nil,
        self.AllSideUnitsAndStructuresFilter)
    for i = 1, count, 1 do
        
        
        if not g_IsIronCurtainActive(objects[i])
            and not self:IsPresetMapUnit(objects[i]) then
            g_ApplyIronCurtain(objects[i], duration)
        end
    end
end

function HextechRune:ApplyDivineInterventionPulse(sourceName)
    self:ApplyDivineInterventionToSide(7, sourceName)
    self:ApplyDivineInterventionToSide(8, sourceName)
end


function HextechRune:GetDivineInterventionDisplaySeconds(playerIndex)
    return self:GetRuneBuffDurationText(self:GetRuneDisplayCopyCount(playerIndex,
        "prismatic_divine_intervention"))
end

function HextechRune:EnsureDivineInterventionScheduler()
    if self.DivineInterventionSchedulerId ~= nil then
        return
    end
    self.DivineInterventionSchedulerId = SchedulerModule.call_every_x_frame(function()
        HextechRune:ApplyDivineInterventionPulse("周期触发")
    end, self.DivineInterventionInterval, nil, {})
end

function HextechRune:SetFiveThunderAvailability(playerIndex, availability)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    
    
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", playerName,
        self.FiveThunderFirstPower, availability)
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", playerName,
        self.FiveThunderRepeatPower, availability)
    SetWorldBuilderThisPlayer(previous)
end

function HextechRune:SetFiveThunderFirstAvailability(playerIndex, availability)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", playerName,
        self.FiveThunderFirstPower, availability)
    SetWorldBuilderThisPlayer(previous)
end

function HextechRune:GrantFiveThunderPowers(playerIndex)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", self.FiveThunderFirstPower, playerName)
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", self.FiveThunderRepeatPower, playerName)
    SetWorldBuilderThisPlayer(previous)
end

function HextechRune:SetFiveThunderCountdown(playerIndex, seconds)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_SET_SPECIAL_POWER_COUNTDOWN", playerName,
        self.FiveThunderFirstPower, seconds)
    ExecuteAction("PLAYER_SET_SPECIAL_POWER_COUNTDOWN", playerName,
        self.FiveThunderRepeatPower, seconds)
    SetWorldBuilderThisPlayer(previous)
end


function HextechRune:GrantFiveThunder(playerIndex)
    if self.FiveThunderState[playerIndex] == nil then
        self.FiveThunderState[playerIndex] = {}
    end
    local state = self.FiveThunderState[playerIndex]
    state.Owned = true
    state.Ready = true
    state.ReadyRound = nil
    state.WaitingForTriggerClear = false

    
    self:GrantFiveThunderPowers(playerIndex)
    self:SetFiveThunderCountdown(playerIndex, 0)
    self:SetFiveThunderAvailability(playerIndex, "Available")
    self:EnsureFiveThunderMonitor()
end

function HextechRune:CheckFiveThunderTriggered()
    for playerIndex = 1, 8, 1 do
        local state = self.FiveThunderState[playerIndex]
        if state ~= nil and state.Owned then
            local playerName = "Player_" .. playerIndex
            local firstTriggered = EvaluateCondition("PLAYER_TRIGGERED_SPECIAL_POWER",
                playerName, self.FiveThunderFirstPower)
            local repeatTriggered = EvaluateCondition("PLAYER_TRIGGERED_SPECIAL_POWER",
                playerName, self.FiveThunderRepeatPower)
            if state.WaitingForTriggerClear then
                if not firstTriggered and not repeatTriggered then
                    self:SetFiveThunderCountdown(playerIndex, 0)
                    self:SetFiveThunderAvailability(playerIndex, "Available")
                    state.WaitingForTriggerClear = false
                    state.Ready = true
                    state.ReadyRound = nil
                end
            elseif state.Ready and (firstTriggered or repeatTriggered) then
                state.Ready = false
                state.ReadyRound = exCounterGetByName("lvc")
                    + self.FiveThunderCooldownRounds
                
                
                self:SetFiveThunderFirstAvailability(playerIndex, "Disabled")
            end
        end
    end
end


function HextechRune:EnsureFiveThunderMonitor()
    if self.FiveThunderMonitorSchedulerId ~= nil then
        return
    end
    self.FiveThunderMonitorSchedulerId = SchedulerModule.call_every_x_frame(function()
        HextechRune:CheckFiveThunderTriggered()
    end, 1, nil, {})
end

function HextechRune:OnFiveThunderRoundBegin(round)
    for playerIndex = 1, 8, 1 do
        local state = self.FiveThunderState[playerIndex]
        if state ~= nil and state.Owned and not state.Ready
            and not state.WaitingForTriggerClear and state.ReadyRound ~= nil
            and round >= state.ReadyRound then
            state.WaitingForTriggerClear = true
        end
    end
end

function HextechRune:GrantCashRewardProtocol(playerIndex)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_LOCK_PLAYER_TECH", playerName,
        self.CashRewardPlayerTech, 0)
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", self.CashRewardSpecialPower, playerName)
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", playerName,
        self.CashRewardSpecialPower, "Available")
    ExecuteAction("PLAYER_SET_SPECIAL_POWER_COUNTDOWN", playerName,
        self.CashRewardSpecialPower, 0)
    SetWorldBuilderThisPlayer(previous)
    
    
    SchedulerModule.delay_call(function(index)
        local delayedPlayerName = "Player_" .. index
        local delayedPrevious = SetWorldBuilderThisPlayer(1)
        ExecuteAction("PLAYER_LOCK_PLAYER_TECH", delayedPlayerName,
            HextechRune.CashRewardPlayerTech, 0)
        ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", delayedPlayerName,
            HextechRune.CashRewardSpecialPower, "Available")
        ExecuteAction("PLAYER_SET_SPECIAL_POWER_COUNTDOWN", delayedPlayerName,
            HextechRune.CashRewardSpecialPower, 0)
        SetWorldBuilderThisPlayer(delayedPrevious)
    end, 1, {playerIndex})
end



function HextechRune:GrantTeslaAirAssault(playerIndex)
    local playerName = "Player_" .. playerIndex
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", self.TeslaAirAssaultPower, playerName)
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", playerName,
        self.TeslaAirAssaultPower, "Available")
    SetWorldBuilderThisPlayer(previous)
end




function HextechRune:GetPlayerHomeSpawnPosition(playerIndex, forwardOffset, sideOffset)
    local p = exWaypointGetPos(format("Player_%d_Start", playerIndex))
    local direction = 1
    if PureDrawGetQuotaDisplayDirection ~= nil then
        direction = PureDrawGetQuotaDisplayDirection(playerIndex)
    end
    return {
        X = p[1] + direction * forwardOffset,
        Y = p[2] + sideOffset,
        Z = p[3],
    }
end

function HextechRune:MarkNextSpawnAsKnownPureDrawUnit()
    local nextObjectId = GetNextObjectId()
    if g_PureDrawScriptCreatedUnitIds ~= nil then
        g_PureDrawScriptCreatedUnitIds[nextObjectId] = true
    end
    return nextObjectId
end

function HextechRune:GrantYaoguang(playerIndex)
    self:MarkNextSpawnAsKnownPureDrawUnit()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "CelestialAdvanceAircraftTech4",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        self:GetPlayerHomeSpawnPosition(playerIndex, 120, 80), 0)
end

function HextechRune:GrantOlympusCarrier(playerIndex)
    self:MarkNextSpawnAsKnownPureDrawUnit()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "AlliedGaintAirCraftCarrier_B",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        self:GetPlayerHomeSpawnPosition(playerIndex, 120, -80), 0)
    self:MarkNextSpawnAsKnownPureDrawUnit()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "JapanYumiAircraftCarrier",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        self:GetPlayerHomeSpawnPosition(playerIndex, 120, 80), 0)
end


function HextechRune:GrantOblivionBomb(playerIndex)
    local forwardDirection = 1
    local enemyTowerPos = { X = 4030, Y = 3102.5, Z = 210 }
    if g_IsAngelSeat(playerIndex) then
        forwardDirection = -1
        enemyTowerPos = { X = 3000, Y = 3102.5, Z = 210 }
    end
    local enemyIndex = g_OpponentSeat(playerIndex)
    local enemyFrontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(enemyIndex)
    if ObjectIsAlive(enemyFrontTower) then
        local towerX, towerY, towerZ = ObjectGetPosition(enemyFrontTower)
        enemyTowerPos = { X = towerX, Y = towerY, Z = towerZ }
    end
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "japanomegaoblivionbomb",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        {
            X = enemyTowerPos.X - forwardDirection * 200,
            Y = enemyTowerPos.Y,
            Z = enemyTowerPos.Z,
        }, 0)
end

function HextechRune:AddOblivionBombCharge(playerIndex)
    g_HextechOblivionBombCharges[playerIndex] =
        (g_HextechOblivionBombCharges[playerIndex] or 0) + 1
    if self.RefreshOblivionBombHint ~= nil then
        self:RefreshOblivionBombHint(playerIndex)
    end
end

function HextechRune:DeployOblivionBomb(playerIndex)
    local charges = g_HextechOblivionBombCharges[playerIndex] or 0
    if charges <= 0 then
        return false
    end
    g_HextechOblivionBombCharges[playerIndex] = charges - 1
    self:GrantOblivionBomb(playerIndex)
    if self.RefreshOblivionBombHint ~= nil then
        self:RefreshOblivionBombHint(playerIndex)
    end
    return true
end

function HextechRune:HandleOblivionBombHotKey(playerName)
    for playerIndex = 1, 8, 1 do
        if playerName == "Player_" .. playerIndex then
            return self:DeployOblivionBomb(playerIndex)
        end
    end
    return false
end

function HextechRune:GrantGigaFortress(playerIndex)
    if BanModeIsTypeEnabled ~= nil and BanModeIsTypeEnabled("aircraft") == 0 then
        return
    end
    self:MarkNextSpawnAsKnownPureDrawUnit()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "JapanGigaFortressShipEgg",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        self:GetPlayerHomeSpawnPosition(playerIndex, 120, 0), 0)
    
end


function HextechRune:GrantDongfengExpress(playerIndex)
    local currentQuota = g_HextechDF41ExtraQuota[playerIndex]
    if currentQuota == true then
        currentQuota = 1
    end
    g_HextechDF41ExtraQuota[playerIndex] = (tonumber(currentQuota) or 0) + 1
    self:MarkNextSpawnAsKnownPureDrawUnit()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        "CelestialDF41",
        format("Player_%d/teamPlayer_%d", playerIndex, playerIndex),
        self:GetPlayerHomeSpawnPosition(playerIndex, 120, 0), 0)
end

function HextechRune:GrantSafetyAegisTowers(playerIndex)
    local sideName = "evil"
    local playerOwn = "PlyrCivilian"
    local behindDirection = -1
    local towerPos = { X = 2900, Y = 3102.5, Z = 210 }
    if g_IsAngelSeat(playerIndex) then
        sideName = "angel"
        playerOwn = "PlyrCreeps"
        behindDirection = 1
        towerPos = { X = 4150, Y = 3102.5, Z = 210 }
    end
    local frontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(playerIndex)
    if ObjectIsAlive(frontTower) then
        local towerX, towerY, towerZ = ObjectGetPosition(frontTower)
        towerPos = {
            X = towerX + behindDirection * 126.75,
            Y = towerY,
            Z = towerZ,
        }
    end
    
    
    local slots = g_HextechGrantAegisSlots[sideName]
    for i = 1, 2, 1 do
        local slotIndex = BtnChoiceDialogEventFunc_AllocateAegisSlot(slots, getn(slots))
        if slotIndex == nil then
            slotIndex = getn(slots) + 1
            slots[slotIndex] = 0
        end
        local id = exCreateObject({
            ObjectType = FastHash("AlliedAegisLargeDefenseBase"),
            TeamName = playerOwn .. "/team" .. playerOwn,
            Position = {
                X = towerPos.X,
                Y = towerPos.Y + BtnChoiceDialogEventFunc_GetAegisLateralOffset(slotIndex),
                Z = towerPos.Z,
            },
            Angle = 0,
            Health = 9000,
        })
        slots[slotIndex] = id
    end
end

function HextechRune:GrantBrilliantLights(playerIndex)
    local forwardDirection = 1
    local towerPos = { X = 3000, Y = 3102.5, Z = 210 }
    if g_IsAngelSeat(playerIndex) then
        forwardDirection = -1
        towerPos = { X = 4030, Y = 3102.5, Z = 210 }
    end
    local frontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(playerIndex)
    if ObjectIsAlive(frontTower) then
        local towerX, towerY, towerZ = ObjectGetPosition(frontTower)
        towerPos = {
            X = towerX + forwardDirection * 200,
            Y = towerY,
            Z = towerZ,
        }
    end
    local teamName = format("Player_%d/teamPlayer_%d", playerIndex, playerIndex)
    for i = 1, 2, 1 do
        local sideOffset = -100
        if i == 2 then
            sideOffset = 100
        end
        ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
            "CelestialEngineerRepairDroneLv2", teamName,
            { X = towerPos.X, Y = towerPos.Y + sideOffset, Z = towerPos.Z }, 0)
    end
end

function HextechRune:ApplyUltimateRefreshToButtons(playerIndex, buttons)
    local copyCount = g_HextechUltimateRefreshCount[playerIndex] or 0
    if copyCount <= 0 or buttons == nil then
        return 0
    end
    local applied = 0
    for buttonIndex = 1, 2, 1 do
        local button = buttons[buttonIndex]
        if button ~= nil and button.MaxUseCount ~= nil then
            local previousApplied = button._hextechUltimateRefreshAppliedCount or 0
            local addCount = copyCount - previousApplied
            if addCount > 0 then
                local wasExhausted = (button._usedCount or 0) >= button.MaxUseCount
                button.MaxUseCount = button.MaxUseCount + addCount
                button._hextechUltimateRefreshAppliedCount = copyCount
                if wasExhausted and (button._cooldownCount or 0) > 0 then
                    button._cooldownCount = 0
                    
                    button._cooldownGeneration = (button._cooldownGeneration or 0) + 1
                end
                if not button.IsLocked and (button._cooldownCount or 0) <= 0
                    and (button._usedCount or 0) < button.MaxUseCount then
                    button.IsEnabled = true
                end
                button:FormatText()
                applied = applied + 1
            end
        end
    end
    return applied
end

function HextechRune:GrantUltimateRefresh(playerIndex)
    g_HextechUltimateRefreshCount[playerIndex]
        = (g_HextechUltimateRefreshCount[playerIndex] or 0) + 1
    local playerName = "Player_" .. playerIndex
    local buttons = {
        ButtonManager:GetButton(playerName, 1),
        ButtonManager:GetButton(playerName, 2),
    }
    self:ApplyUltimateRefreshToButtons(playerIndex, buttons)
    for i = 1, 2, 1 do
        if buttons[i] ~= nil then
            ButtonManager:SetButton(buttons[i])
        end
    end
end

function HextechRune:EnableTowerDefenseExpert(playerIndex)
    g_HextechTowerDefenseExpert[playerIndex] = true
end

function HextechRune:GrantOilDerricks(playerIndex)
    local teamName = format("Player_%d/teamPlayer_%d", playerIndex, playerIndex)
    g_HextechOilDerrickSerial[playerIndex] = g_HextechOilDerrickSerial[playerIndex] + 1
    local serial = g_HextechOilDerrickSerial[playerIndex]
    for i = 1, 2, 1 do
        local sideOffset = -170
        if i == 2 then
            sideOffset = 170
        end
        ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",
            format("HextechOilDerrick_%d_%d_%d", playerIndex, serial, i),
            "oilderrick", teamName,
            self:GetPlayerHomeSpawnPosition(playerIndex, 180, sideOffset), 0)
    end
end

function HextechRune:GrantStartingFunds(playerIndex)
    local playerName = "Player_" .. playerIndex
    
    
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_GIVE_MONEY", playerName, GetStartingFundsMoney())
    SetWorldBuilderThisPlayer(previous)
end

function HextechRune:GrantForeignMCV(playerIndex)
    local ownFaction = 1
    if g_PlayerSide ~= nil and g_PlayerSide[playerIndex] ~= nil then
        ownFaction = g_PlayerSide[playerIndex]
    end
    local mcvTypes = {
        [1] = "AlliedMCV",
        [2] = "SovietMCV",
        [3] = "JapanMCV",
        [4] = "CelestialMCV",
    }
    local candidates = {}
    for faction = 1, 4, 1 do
        if faction ~= ownFaction then
            tinsert(candidates, faction)
        end
    end
    local targetFaction = candidates[self:RandomIndex(getn(candidates))]
    local playerName = "Player_" .. playerIndex
    
    local sideName = "PlyrCivilian"
    if self:GetPlayerSideIndex(playerIndex) == 8 then
        sideName = "PlyrCreeps"
    end
    local position = nil
    if PureDrawGetOutpostDropPosition ~= nil then
        position = PureDrawGetOutpostDropPosition(sideName, playerIndex)
    end
    if position == nil then
        position = self:GetPlayerHomeSpawnPosition(playerIndex, 140, 0)
    end
    local mcvObjectId = GetNextObjectId()
    ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "",
        mcvTypes[targetFaction], playerName .. "/teamPlayer_" .. playerIndex,
        position, 0)
    local mcv = GetObjectById(mcvObjectId)
    
    TextDoActionLocalizedOnce("NAMED_SHOW_INFOBOX", mcv, "SCRIPT:ally", 15, "")
    
    ExecuteAction("OBJECT_CREATE_RADAR_EVENT", mcv, "Information")
end

function HextechRune:EnableBuyTwoGetOne(playerIndex, rune)
    if g_HextechBuyTwoGetOne[playerIndex] == nil then
        g_HextechBuyTwoGetOne[playerIndex] = {}
    end
    tinsert(g_HextechBuyTwoGetOne[playerIndex], {
        UnitIndex = rune.TargetUnitIndex,
        UnitType = rune.TargetUnitType,
        UnitName = rune.TargetUnitName,
        Progress = 0,
        RuneInstanceId = self:GetRuneEffectInstanceId(rune),
    })
end



function HextechRune:OnPlayerUnitCollected(playerIndex, unitIndex)
    local states = g_HextechBuyTwoGetOne[playerIndex]
    if states == nil then
        return
    end
    for i = 1, getn(states), 1 do
        local state = states[i]
        if state.UnitIndex == unitIndex then
            state.Progress = state.Progress + 1
            if state.Progress >= 2 then
                state.Progress = 0
                
                local absorbed = self.AbsorbBuyTwoGetOneBonus ~= nil
                    and self:AbsorbBuyTwoGetOneBonus(playerIndex, unitIndex)
                if not absorbed then
                    ANYUNITCOUNT[playerIndex] = ANYUNITCOUNT[playerIndex] + 1
                    UNITCOUNT[playerIndex][unitIndex] = UNITCOUNT[playerIndex][unitIndex] + 1
                end
            end
        end
    end
end

function HextechRune:GetAvailableUnitTypes(playerIndex)
    
    
    return BanModeEnabledUnitTypes()
end


function HextechRune:BuildSideUnitTypeLookup(sideIndex)
    local result = {}
    if P == nil or g_GetSideScanAnchor(sideIndex) == nil then
        return result
    end
    for typeIndex = 1, getn(self.UnitTypeOrder), 1 do
        local unitType = self.UnitTypeOrder[typeIndex]
        local units, count = g_SideFindObjects(sideIndex, nil, self.UnitTypeFilters[unitType])
        local lookup = {}
        for i = 1, count, 1 do
            lookup[ObjectGetId(units[i])] = true
        end
        result[unitType] = lookup
    end
    
    
    local dualFilters = self:GetDualUnitTypeFilters()
    for dualIndex = 1, getn(dualFilters), 1 do
        local dual = dualFilters[dualIndex]
        local units, count = g_SideFindObjects(sideIndex, nil, dual.Filter)
        for i = 1, count, 1 do
            local objectId = ObjectGetId(units[i])
            for typeIndex = 1, getn(dual.Types), 1 do
                result[dual.Types[typeIndex]][objectId] = true
            end
        end
    end
    return result
end




function HextechRune:IsUnitInRuneType(unit, rune, typeLookup)
    if rune.UnitType == nil or typeLookup[rune.UnitType] == nil then
        return false
    end
    return typeLookup[rune.UnitType][ObjectGetId(unit)] == true
end

function HextechRune:ApplyInfiniteAmmoToUnit(unit)
    
    for weaponIndex = 1, 5, 1 do
        ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(unit, 1, 1, weaponIndex, 100000)
    end
end



function HextechRune:ApplyPersistentRuneToUnit(playerIndex, rune, unit, typeLookup, unitIndex)
    if not self:IsRuneMatchingUnit(rune, unit, typeLookup, playerIndex) then
        return false
    end
    
    local statMod = self:GetPerTypeStatModifier(rune, unit, typeLookup, playerIndex)
    if rune.Effect == "damage" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechDamageX150Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "rate_of_fire" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechRateOfFireX150Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "speed" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechSpeedX140Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "range_silver" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechRangeX115Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "range_gold" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechRangeX125Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "range_prismatic" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechRangeX150Modifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "astral_body" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechAstralBodyModifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "goliath" then
        ObjectLoadAttributeModifier(unit, statMod or g_HextechGoliathModifier,
            self.PersistentBuffDuration)
    elseif rune.Effect == "ragnarok" then
        local objectId = ObjectGetId(unit)
        ObjectLoadAttributeModifier(unit, statMod or g_HextechRagnarokModifier,
            self.PersistentBuffDuration)
        self.RagnarokUnits[objectId] = true
        
        self:ClampRagnarokUnitHealth(objectId)
        
        SchedulerModule.delay_call(function(id)
            HextechRune:ClampRagnarokUnitHealth(id)
        end, 60, { objectId })
    elseif rune.Effect == "transcendent_evil" then
        
        if not self:IsPrimaryTranscendentEvilRune(playerIndex, rune) then
            return false
        end
        ObjectLoadAttributeModifier(unit,
            self:GetTranscendentEvilModifier(playerIndex, rune),
            self.PersistentBuffDuration)
    elseif rune.Effect == "infinite_ammo" then
        local eligible = typeLookup.infiniteAmmoAircraft
        if eligible == nil or not eligible[ObjectGetId(unit)] then
            return false
        end
        self:ApplyInfiniteAmmoToUnit(unit)
    elseif rune.Effect == "back_to_basics" or rune.Effect == "equivalent_exchange" then
        
        return self:ApplyBasicsOrExchangeToUnit(rune, unit, typeLookup, unitIndex,
            playerIndex)
    elseif rune.Effect == "at_field" then
        
        
        
        return true
    else
        return false
    end
    return true
end

function HextechRune:ClampRagnarokUnitHealth(objectId)
    if not ObjectIsAlive(objectId) then
        return
    end
    local maxHealth = exObjectGetMaxHealth(objectId)
    if maxHealth == nil or maxHealth <= 0 then
        return
    end
    local halfHealth = floor(maxHealth * 0.5)
    if halfHealth < 1 then
        halfHealth = 1
    end
    local currentHealth = exObjectGetCurrentHealth(objectId)
    if currentHealth == nil or currentHealth <= halfHealth then
        return
    end
    local unit = GetObjectById(objectId)
    if unit == nil or not ObjectIsAlive(unit) then
        return
    end
    local reference = "hextech_ragnarok_" .. objectId
    ExecuteAction("SET_UNIT_REFERENCE", reference, unit)
    
    ExecuteAction("UNIT_SET_HEALTH", reference, halfHealth / maxHealth * 100)
    local afterHealth = exObjectGetCurrentHealth(objectId)
    if afterHealth ~= nil and afterHealth <= halfHealth
        and exObjectGetMaxHealth(objectId) == maxHealth then
        return
    end
    ExecuteAction("NAMED_SET_MAX_HEALTH", reference, halfHealth, "TRUE")
    ExecuteAction("NAMED_SET_MAX_HEALTH", reference, maxHealth, "FALSE")
    local afterMax = exObjectGetMaxHealth(objectId)
    afterHealth = exObjectGetCurrentHealth(objectId)
    if afterMax ~= maxHealth then
        
        ExecuteAction("NAMED_SET_MAX_HEALTH", reference, maxHealth, "TRUE")
        afterHealth = exObjectGetCurrentHealth(objectId)
    end
    if afterHealth ~= nil and afterHealth > halfHealth then
        ExecuteAction("NAMED_DAMAGE", unit, afterHealth - halfHealth)
    end
end



function HextechRune:ApplyAllRagnarokHealthClamps()
    for objectId, value in self.RagnarokUnits do
        if ObjectIsAlive(objectId) then
            self:ClampRagnarokUnitHealth(objectId)
        else
            self.RagnarokUnits[objectId] = nil
        end
    end
end

function HextechRune:IsCurrentAssignment(unit, assignment)
    if assignment == nil or not ObjectIsAlive(unit)
        or assignment.Unit == nil or not ObjectIsAlive(assignment.Unit) then
        return false
    end
    local objectId = ObjectGetId(unit)
    local assignedObjectId = assignment.ObjectId
        or ObjectGetId(assignment.Unit)
    return assignedObjectId == objectId
end

function HextechRune:IsPersistentBattleRune(rune)
    return rune.Effect == "damage" or rune.Effect == "rate_of_fire"
        or rune.Effect == "speed" or rune.Effect == "range_silver"
        or rune.Effect == "range_gold" or rune.Effect == "range_prismatic"
        or rune.Effect == "astral_body" or rune.Effect == "transcendent_evil"
        or rune.Effect == "infinite_ammo" or rune.Effect == "goliath"
        or rune.Effect == "ragnarok" or rune.Effect == "war_efficiency"
        
        or rune.Effect == "back_to_basics" or rune.Effect == "equivalent_exchange"
        
        
        or rune.Effect == "five_tiger_generals" or rune.Effect == "lethal_tempo"
        
        or rune.Effect == "at_field"
end



function HextechRune:GetPlayerBattleEffectQuota(playerIndex, unit, unitIndex,
    typeLookup)
    local poolCount = UNITCOUNT[playerIndex][unitIndex] or 0
    if poolCount <= 0 then
        return 0
    end
    self:EnsurePlayerRuneState(playerIndex)
    local owned = self.PlayerOwnedRunes[playerIndex]
    for runeIndex = 1, getn(owned), 1 do
        local rune = owned[runeIndex]
        if self:IsPersistentBattleRune(rune)
            and self:IsRuneMatchingUnit(rune, unit, typeLookup, playerIndex) then
            if rune.Effect ~= "infinite_ammo"
                or (typeLookup.infiniteAmmoAircraft ~= nil
                    and typeLookup.infiniteAmmoAircraft[ObjectGetId(unit)]) then
                return poolCount
            end
        end
    end

    local creature = self.UltimateCreatureStates
    if creature ~= nil and creature[playerIndex] ~= nil
        and unitIndex == creature[playerIndex].UnitIndex then
        
        if self:IsRoundSlotTaken(playerIndex, "ultimate_creature") then
            return 0
        end
        return 1
    end

    
    
    
    local ascensionRune = self:GetAscensionRune(playerIndex)
    if ascensionRune ~= nil and unitIndex == ascensionRune.TargetUnitIndex
        and self:GetAscensionStacks(playerIndex) > 0 then
        if self:IsRoundSlotTaken(playerIndex, "ascension") then
            return 0
        end
        return 1
    end

    
    return 0
end

function HextechRune:AssignNewSideBattleUnits(sideIndex,
    typeLookup, skipObjects, seenObjects)
    local newlyAssigned = {}
    if P == nil or g_GetSideScanAnchor(sideIndex) == nil then
        return newlyAssigned
    end
    for unitIndex = 1, unitcountmax, 1 do
        local units, count = g_SideFindObjects(sideIndex, nil, FilterLIST[unitIndex])
        local newUnits = {}
        for i = 1, count, 1 do
            local unit = units[i]
            local objectId = ObjectGetId(unit)
            if seenObjects ~= nil then
                seenObjects[objectId] = true
            end
            local assignment = self.BattleUnitAssignments[objectId]
            if not self:IsCurrentAssignment(unit, assignment)
                and not self:IsPresetMapUnit(unit)
                
                and not IsSkillSummonedUnitId(objectId)
                and (skipObjects == nil or skipObjects[objectId] == nil) then
                tinsert(newUnits, unit)
            end
        end

        local claimed = {}
        for k = 1, getn(g_SideSeatsOf(sideIndex)), 1 do
            local playerIndex = g_SideSeatsOf(sideIndex)[k]
            local grantedCount = 0
            for unitPosition = 1, getn(newUnits), 1 do
                if not claimed[unitPosition] then
                    local unit = newUnits[unitPosition]
                    local quota = self:GetPlayerBattleEffectQuota(playerIndex,
                        unit, unitIndex, typeLookup)
                    if quota > grantedCount then
                        local assignment = {
                            Unit = unit,
                            ObjectId = ObjectGetId(unit),
                            UnitIndex = unitIndex,
                            PlayerIndex = playerIndex,
                            AppliedRunes = {},
                        }
                        self.BattleUnitAssignments[ObjectGetId(unit)] = assignment
                        claimed[unitPosition] = true
                        grantedCount = grantedCount + 1
                        tinsert(newlyAssigned, assignment)
                    end
                end
            end
        end
    end
    return newlyAssigned
end

function HextechRune:AssignNewBattleUnits(typeLookup, skipObjects, seenObjects)
    local result = {}
    if UNITCOUNT == nil or FilterLIST == nil or unitcountmax == nil then
        return result
    end
    typeLookup = typeLookup or self:BuildAllBattleUnitTypeLookup()
    local left = self:AssignNewSideBattleUnits(7, typeLookup, skipObjects,
        seenObjects)
    local right = self:AssignNewSideBattleUnits(8, typeLookup, skipObjects,
        seenObjects)
    for i = 1, getn(left), 1 do
        tinsert(result, left[i])
    end
    for i = 1, getn(right), 1 do
        tinsert(result, right[i])
    end
    return result
end

function HextechRune:BuildAllBattleUnitTypeLookup()
    local left = self:BuildSideUnitTypeLookup(7)
    local right = self:BuildSideUnitTypeLookup(8)
    local result = {}
    for typeIndex = 1, getn(self.UnitTypeOrder), 1 do
        local unitType = self.UnitTypeOrder[typeIndex]
        local lookup = {}
        if left[unitType] ~= nil then
            for objectId, value in left[unitType] do
                lookup[objectId] = value
            end
        end
        if right[unitType] ~= nil then
            for objectId, value in right[unitType] do
                lookup[objectId] = value
            end
        end
        result[unitType] = lookup
    end
    local infiniteAmmoAircraft = {}
    for sideIndex = 7, 8, 1 do
        if P ~= nil and g_GetSideScanAnchor(sideIndex) ~= nil then
            local units, count = g_SideFindObjects(sideIndex, nil,
                self:GetInfiniteAmmoAircraftFilter())
            for i = 1, count, 1 do
                infiniteAmmoAircraft[ObjectGetId(units[i])] = true
            end
        end
    end
    result.infiniteAmmoAircraft = infiniteAmmoAircraft
    return result
end


function HextechRune:ApplyRuneToAssignment(rune, assignment, typeLookup)
    local effectInstanceId = self:GetRuneEffectInstanceId(rune)
    if assignment.AppliedRunes[effectInstanceId] then
        return false
    end
    if self:ApplyPersistentRuneToUnit(assignment.PlayerIndex, rune,
        assignment.Unit, typeLookup, assignment.UnitIndex) then
        assignment.AppliedRunes[effectInstanceId] = true
        return true
    end
    return false
end



HextechRune.SkipPerUnitAssignmentEffects = {
    starting_funds = true, fortified = true, recycler = true,
    broadband_jamming = true, divine_intervention = true, grant_foreign_mcv = true,
    grant_yaoguang = true, oil_king = true, buy_two_get_one = true,
    five_thunder = true, combustion_interest = true, tesla_air_assault = true,
    grant_olympus_carrier = true, grant_oblivion_bomb = true,
    grant_giga_fortress = true, grant_dongfeng_express = true, safety = true,
    tower_defense_expert = true, cash_reward = true, brilliant_lights = true,
    grant_cryo_satellite = true, grant_chrono_rift = true,
    grant_irradiate = true, grant_desolator_bomb = true,
    grant_magnetic_singularity = true, grant_time_bomb = true,
    ultimate_refresh = true, quality_transformation = true, gambling_addict = true,
    upgrade_tachi_cruiser = true, upgrade_bullfrog = true,
    upgrade_waverider_dragon_breathe = true, upgrade_vanguard_gunship = true,
    upgrade_imperial_warrior = true, upgrade_v4_tulip = true,
    upgrade_sakura_rocket = true,
    upgrade_rhino_tank = true,
    prepare_backpack = true,
    easy_does_it = true,
    
    burn_furry = true, spawn_alien = true, angler = true, sit_tight = true,
    
    soul_interlock = true,
    ultimate_creature = true,
    war_efficiency = true, time_rift = true,
    hunt_rhythm = true,
    
    five_tiger_generals = true, lethal_tempo = true,
}


function HextechRune:ApplyOwnedRunesToNewAssignments(assignments, sourceName,
    excludedPlayerIndex, excludedOwnershipId, typeLookup)
    typeLookup = typeLookup or self:BuildAllBattleUnitTypeLookup()
    for playerIndex = 1, 8, 1 do
        self:EnsurePlayerRuneState(playerIndex)
        local owned = self.PlayerOwnedRunes[playerIndex]
        for runeIndex = 1, getn(owned), 1 do
            local rune = owned[runeIndex]
            local isExcluded = playerIndex == excludedPlayerIndex
                and self:GetRuneEffectInstanceId(rune) == excludedOwnershipId
            if not isExcluded
                and not self.SkipPerUnitAssignmentEffects[rune.Effect] then
                for i = 1, getn(assignments), 1 do
                    local assignment = assignments[i]
                    if assignment.PlayerIndex == playerIndex then
                        self:ApplyRuneToAssignment(rune, assignment, typeLookup)
                    end
                end
            end
        end
    end
end

function HextechRune:ApplyFortifiedToTowerLine(playerIndex, towerNames, lineName)
    for i = 1, getn(towerNames), 1 do
        local tower = GetObjectByScriptName(towerNames[i])
        if ObjectIsAlive(tower) then
            local maxHealth = exObjectGetMaxHealth(ObjectGetId(tower))
            local towerState = self.FortifiedTowerState[towerNames[i]]
            if towerState == nil then
                towerState = {
                    BaseMaxHealth = maxHealth,
                    CopyCount = 0,
                }
                self.FortifiedTowerState[towerNames[i]] = towerState
            end
            towerState.CopyCount = towerState.CopyCount + 1
            
            
            local newMaxHealth = towerState.BaseMaxHealth
                * (1 + 0.25 * towerState.CopyCount)
            ExecuteAction("NAMED_SET_MAX_HEALTH", towerNames[i], newMaxHealth, 1)
            return true
        end
    end
    return false
end

function HextechRune:ApplyFortified(playerIndex)
    local landTowerNames = { "T71", "T72", "T73", "T74" }
    local seaTowerNames = { "T71F", "T72F", "T73F" }
    if g_IsAngelSeat(playerIndex) then
        landTowerNames = { "T81", "T82", "T83", "T84" }
        seaTowerNames = { "T81F", "T82F", "T83F" }
    end
    
    self:ApplyFortifiedToTowerLine(playerIndex, landTowerNames, "陆地")
    self:ApplyFortifiedToTowerLine(playerIndex, seaTowerNames, "海上")
end

function HextechRune:ApplyPersistentRune(playerIndex, rune)
    
    
end

function HextechRune:GetFiveTigerGeneralsCopyCount(playerIndex)
    self:EnsurePlayerRuneState(playerIndex)
    local count = 0
    local owned = self.PlayerOwnedRunes[playerIndex]
    for i = 1, getn(owned), 1 do
        if owned[i].Effect == "five_tiger_generals" then
            count = count + 1
        end
    end
    return count
end

function HextechRune:EnsureFiveTigerGeneralsPower(playerIndex)
    local sideIndex = self:GetPlayerSideIndex(playerIndex)
    if self.FiveTigerPowerGranted[sideIndex] then
        return
    end
    local sidePlayerName = "PlyrCivilian"
    if sideIndex == 8 then
        sidePlayerName = "PlyrCreeps"
    end
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", self.FiveTigerGeneralsPower,
        sidePlayerName)
    ExecuteAction("PLAYER_SPECIAL_POWER_AVAILABILITY", sidePlayerName,
        self.FiveTigerGeneralsPower, "Available")
    ExecuteAction("PLAYER_SET_SPECIAL_POWER_COUNTDOWN", sidePlayerName,
        self.FiveTigerGeneralsPower, 0)
    SetWorldBuilderThisPlayer(previous)
    self.FiveTigerPowerGranted[sideIndex] = true
end

function HextechRune:HasCenturionUpgradeObject(unit)
    local attachers, count = ObjectGetAttachers(unit)
    for i = 1, count, 1 do
        if ObjectIsAlive(attachers[i])
            and ObjectTemplateName(attachers[i]) == "CelestialCenturionUpgradeObject" then
            return true
        end
    end
    return false
end

function HextechRune:GrantCenturionLayer(playerIndex)
    if P == nil then
        return
    end
    local sideIndex = self:GetPlayerSideIndex(playerIndex)
    if g_GetSideScanAnchor(sideIndex) == nil then
        return
    end
    local units, count = g_SideFindObjects(sideIndex, nil,
        self.UnitTypeFilters.infantry)
    local round = tonumber(exCounterGetByName("lvc")) or 0
    local targets = {}
    for i = 1, count, 1 do
        local unit = units[i]
        local objectId = ObjectGetId(unit)
        local assignment = self.BattleUnitAssignments[objectId]
        
        
        if assignment ~= nil and assignment.PlayerIndex == playerIndex
            and ObjectIsAlive(unit) and not self:HasCenturionUpgradeObject(unit)
            and not self:IsPresetMapUnit(unit)
            and self.CenturionGranted[objectId] ~= round then
            self.CenturionGranted[objectId] = round
            tinsert(targets, unit)
        end
    end
    local total = getn(targets)
    if total == 0 then
        return
    end
    self:EnsureFiveTigerGeneralsPower(playerIndex)
    local spellbooks, spellbookCount = ObjectFindObjects(targets[1], nil,
        self.CenturionSpellbookFilter)
    if spellbookCount == 0 or not ObjectIsAlive(spellbooks[1]) then
        return
    end
    local spellbookReference = "HextechFiveTigerSpellbook_" .. playerIndex
    ExecuteAction("SET_UNIT_REFERENCE", spellbookReference, spellbooks[1])
    for i = 1, total, 1 do
        local objectId = ObjectGetId(targets[i])
        local targetReference = "HextechFiveTigerTarget_" .. tostring(objectId)
        
        g_HextechFiveTigerPendingTargets[objectId] = true
        ExecuteAction("SET_UNIT_REFERENCE", targetReference, targets[i])
        ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED", spellbookReference,
            self.FiveTigerGeneralsCommand, targetReference)
    end
end

function HextechRune:ApplyFiveTigerGenerals()
    for playerIndex = 1, 8, 1 do
        if self:GetFiveTigerGeneralsCopyCount(playerIndex) > 0 then
            self:GrantCenturionLayer(playerIndex)
        end
    end
end

function HextechRune:GetTranscendentEvilCopyCount(playerIndex, unitType)
    self:EnsurePlayerRuneState(playerIndex)
    local count = 0
    local owned = self.PlayerOwnedRunes[playerIndex]
    for i = 1, getn(owned), 1 do
        local current = owned[i]
        if current.Effect == "transcendent_evil" and current.UnitType == unitType then
            count = count + 1
        end
    end
    return count
end

function HextechRune:IsPrimaryTranscendentEvilRune(playerIndex, rune)
    local owned = self.PlayerOwnedRunes[playerIndex]
    for i = 1, getn(owned), 1 do
        local current = owned[i]
        if current.Effect == "transcendent_evil" and current.UnitType == rune.UnitType then
            return current == rune
        end
    end
    return false
end

function HextechRune:GetTranscendentEvilModifier(playerIndex, rune)
    local round = tonumber(exCounterGetByName("lvc")) or 0
    local copyCount = self:GetTranscendentEvilCopyCount(playerIndex, rune.UnitType)
    local bonus = round * 0.03 * copyCount
    local cacheKey = tostring(round) .. ":" .. tostring(copyCount)
    if self.TranscendentEvilModifiers[cacheKey] == nil then
        self.TranscendentEvilModifiers[cacheKey] = exAttributeModifierCreate({
            HEALTH_MULT = 1 + bonus,
            DAMAGE_MULT = 1 + bonus,
        }, 1)
    end
    return self.TranscendentEvilModifiers[cacheKey]
end

function HextechRune:OnRuneChosen(playerIndex, rune)
    if rune.Effect == "grant_yaoguang" then
        self:GrantYaoguang(playerIndex)
    elseif rune.Effect == "grant_olympus_carrier" then
        self:GrantOlympusCarrier(playerIndex)
    elseif rune.Effect == "grant_oblivion_bomb" then
        self:AddOblivionBombCharge(playerIndex)
    elseif rune.Effect == "grant_giga_fortress" then
        self:GrantGigaFortress(playerIndex)
    elseif rune.Effect == "grant_dongfeng_express" then
        self:GrantDongfengExpress(playerIndex)
    elseif rune.Effect == "safety" then
        self:GrantSafetyAegisTowers(playerIndex)
    elseif rune.Effect == "grant_railgun" then
        
        BtnChoiceDialogEventFunc_CreateCelestialRailgun(playerIndex)
    elseif rune.Effect == "tower_defense_expert" then
        self:EnableTowerDefenseExpert(playerIndex)
    elseif rune.Effect == "brilliant_lights" then
        self:GrantBrilliantLights(playerIndex)
    elseif rune.Effect == "ultimate_refresh" then
        self:GrantUltimateRefresh(playerIndex)
    elseif rune.Effect == "quality_transformation" then
        self:ApplyQualityTransformation(playerIndex, rune)
    elseif rune.Effect == "gambling_addict" then
        self:ApplyGamblingAddict(playerIndex)
    elseif rune.Effect == "ultimate_creature" then
        self:CreateUltimateCreature(playerIndex, rune)
    elseif rune.Effect == "ascension" then
        self:GrantAscension(playerIndex, rune)
    elseif rune.Effect == "grant_foreign_mcv" then
        self:GrantForeignMCV(playerIndex)
    elseif rune.Effect == "oil_king" then
        self:GrantOilDerricks(playerIndex)
    elseif rune.Effect == "buy_two_get_one" then
        self:EnableBuyTwoGetOne(playerIndex, rune)
    elseif rune.Effect == "starting_funds" then
        self:GrantStartingFunds(playerIndex)
    elseif rune.Effect == "fortified" then
        self:ApplyFortified(playerIndex)
    elseif rune.Effect == "recycler" then
        g_HextechRecycleBonus[playerIndex] = (g_HextechRecycleBonus[playerIndex] or 0)
            + GetHextechRecycleBonusRate()
    elseif rune.Effect == "broadband_jamming" then
        self:ApplyBroadbandJamming(playerIndex, rune, "选择符文")
    elseif rune.Effect == "divine_intervention" then
        self:EnsureDivineInterventionScheduler()
        self:ApplyDivineInterventionToSide(self:GetPlayerSideIndex(playerIndex), "选择符文")
    elseif rune.Effect == "five_thunder" then
        self:GrantFiveThunder(playerIndex)
    elseif rune.Effect == "combustion_interest" or rune.Effect == "hunt_rhythm" then
        
        self:EnsureBattleDeathObserver()
    elseif rune.Effect == "war_efficiency" then
        self:EnsureBattleDeathObserver()
        self:ApplyAllWarEfficiencyBuffs()
    elseif rune.Effect == "time_rift" then
        self:EnsureTimeRiftScheduler()
        self:ApplyTimeRiftPulse("选择符文")
    elseif rune.Effect == "shrink_ray" then
        self:OnShrinkRayChosen(self:GetPlayerSideIndex(playerIndex))
    elseif rune.Effect == "tesla_air_assault" then
        self:GrantTeslaAirAssault(playerIndex)
    elseif rune.Effect == "five_tiger_generals" then
        self:EnsureFiveTigerGeneralsPower(playerIndex)
    elseif rune.Effect == "recombobulator_same" then
        self:ApplyRecombobulator(playerIndex, false)
    elseif rune.Effect == "recombobulator_upgrade" then
        self:ApplyRecombobulator(playerIndex, true)
    elseif rune.Effect == "poach" then
        self:EnsurePoachScheduler()
    elseif rune.Effect == "investment" then
        self:ApplyInvestment(playerIndex)
    elseif rune.Effect == "ten_pull" then
        self:GrantTenPull(playerIndex)
    elseif rune.Effect == "lethal_tempo" then
        self:ApplyAllLethalTempoBuffs()
    elseif rune.Effect == "drain" then
        self:ApplyDrainToPlayer(playerIndex)
    elseif rune.Effect == "grant_mass_production" then
        
        self:GrantMassProduction(playerIndex)
    elseif rune.Effect == "grant_free_trade" then
        
        self:GrantFreeTrade(playerIndex)
    elseif self.ProtocolGrants[rune.Effect] ~= nil then
        
        self:GrantProtocol(playerIndex, rune.Effect)
    elseif rune.Effect == "prepare_backpack" then
        
        self.PendingRuneAscend[playerIndex] =
            (self.PendingRuneAscend[playerIndex] or 0) + 1
    elseif rune.Effect == "easy_does_it" then
        
        self.PendingExtraRunePick[playerIndex] =
            (self.PendingExtraRunePick[playerIndex] or 0) + 1
    elseif rune.Effect == "upgrade_tachi_cruiser"
        or rune.Effect == "upgrade_bullfrog"
        or rune.Effect == "upgrade_waverider_dragon_breathe"
        or rune.Effect == "upgrade_vanguard_gunship"
        or rune.Effect == "upgrade_imperial_warrior"
        or rune.Effect == "upgrade_v4_tulip"
        or rune.Effect == "upgrade_sakura_rocket"
        or rune.Effect == "upgrade_rhino_tank" then
        
        
        self:RemapReplacedRuneTargets(playerIndex)
    else
        self:ApplyPersistentRune(playerIndex, rune)
    end
end


function HextechRune:ApplyNewBattleUnitEffects(sourceName, skipObjects, seenObjects)
    local typeLookup = self:BuildAllBattleUnitTypeLookup()
    local assignments = self:AssignNewBattleUnits(typeLookup, skipObjects, seenObjects)
    self:ApplyOwnedRunesToNewAssignments(assignments, sourceName or "出兵",
        nil, nil, typeLookup)
    
    self:ApplyAllBroadbandJamming(sourceName or "出兵")
    
    self:ApplyAllWarEfficiencyBuffs()
    
    self:ApplyAllLethalTempoBuffs()
    
    self:RescanShrinkRay()
    return assignments
end

function HextechRune:FinalizeBattleUnitAssignments(assignments)
    for i = 1, getn(assignments), 1 do
        local assignment = assignments[i]
        local hasEffect = assignment.UltimateCreatureGranted
            or assignment.AscensionGranted
            or assignment.WarEfficiencyGranted
        if not hasEffect then
            for effectInstanceId, applied in assignment.AppliedRunes do
                if applied then
                    hasEffect = true
                    break
                end
            end
        end
        if not hasEffect
            and self.BattleUnitAssignments[assignment.ObjectId] == assignment then
            self.BattleUnitAssignments[assignment.ObjectId] = nil
        end
    end
end



function HextechRune:ApplyBattleUnitEffectPass(sourceName, skipObjects, seenObjects)
    local assignments = self:ApplyNewBattleUnitEffects(sourceName, skipObjects,
        seenObjects)
    self:ApplyUltimateCreatures(assignments)
    self:ApplyAscensionUnits(assignments)
    self:ApplyFiveTigerGenerals()
    
    self:FinalizeBattleUnitAssignments(assignments)
end

function HextechRune:ApplyRoundEffects(round)
    
    
    self:RollWarEfficiencyCounters()
    
    for ascensionPlayerIndex = 1, 8, 1 do
        self:BroadcastAscension(ascensionPlayerIndex)
    end
    
    self:ApplyAllRagnarokHealthClamps()
    
    self:ApplyShrinkRayPulse(round)
    
    
    SchedulerModule.delay_call(function(effectRound)
        
        local seenObjects = {}
        HextechRune:ApplyBattleUnitEffectPass(
            "第" .. tostring(effectRound) .. "回合固定出兵", nil, seenObjects)
        
        HextechRune:ApplyAtFieldShields()
        
        
        SchedulerModule.delay_call(function(airRound, seen)
            HextechRune:ApplyBattleUnitEffectPass(
                "第" .. tostring(airRound) .. "回合空军批次", seen, nil)
            
            
            HextechRune:ApplyAtFieldShields()
        end, HextechRune.AirBatchEffectDelay, { effectRound, seenObjects })
    end, self.BattleUnitEffectDelay, { round })
end