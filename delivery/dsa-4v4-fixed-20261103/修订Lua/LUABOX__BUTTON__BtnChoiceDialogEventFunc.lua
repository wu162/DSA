

devil_max = 200
angel_max = 200

g_GameMode = 1;
g_EnableDeathModeEffect = 0;
g_EnableShrinkMode = 0;
g_DisableSeaArmy = 0;
g_DrawMode = 0; 
g_LuckyCrateMode = 0; 
g_HextechCount = 0; 
g_HextechCountManuallySet = false; 
g_EnableHextechRune = 0; 

function BtnChoiceDialogEventFunc_ApplyHostHextechSetting()
    g_EnableHextechRune = 0
    if g_HextechCount ~= nil and g_HextechCount > 0 then
        g_EnableHextechRune = 1
    end
    if CenterTopBtnFunc_UpdateHextechPanelButton ~= nil then
        CenterTopBtnFunc_UpdateHextechPanelButton()
    end
end

g_GameModeName = {
    [1] = Localization.get("game_mode.name.1"),
    [2] = Localization.get("game_mode.name.2"),
    [4] = Localization.get("game_mode.name.4"),
}

g_GameModeOptions = {
    { Name = Localization.get("game_mode.option.1.name") },
    { Name = Localization.get("game_mode.option.2.name") },
    { Name = Localization.get("game_mode.option.3.name") },
    { Name = Localization.get("game_mode.option.4.name") },
    { Name = Localization.get("game_mode.option.5.name") },
    { Name = Localization.get("game_mode.option.6.name") },
}
MARKET_DIALOG_ID_OFFSET = 100

GAMEMODE_DIALOG_ID = 201
DRAW_MODE_DIALOG_ID = 202
HEXTECH_MODE_DIALOG_ID = 203
MORE_OPTIONS_DIALOG_ID = 204

SKILL_DIALOG_ID_OFFSET = 1000
SKILL_DIALOG_ID_OFFSET2 = 2000
PURCHASE_TECH_DIALOG_ID = 701
RECYCLE_UNIT_DIALOG_ID = 801
g_SkillNames = {
    Localization.get("skill.name.1"),
    Localization.get("skill.name.2"),
    Localization.get("skill.name.3"),
    Localization.get("skill.name.4"),
    Localization.get("skill.name.5"),
    Localization.get("skill.name.6"),
}
Localization.on_language_changed(function()
    g_GameModeName = {
        [1] = Localization.get("game_mode.name.1"),
        [2] = Localization.get("game_mode.name.2"),
        [4] = Localization.get("game_mode.name.4"),
    }
    g_GameModeOptions[1].Name = Localization.get("game_mode.option.1.name")
    g_GameModeOptions[2].Name = Localization.get("game_mode.option.2.name")
    g_GameModeOptions[3].Name = Localization.get("game_mode.option.3.name")
    g_GameModeOptions[4].Name = Localization.get("game_mode.option.4.name")
    g_GameModeOptions[5].Name = Localization.get("game_mode.option.5.name")
    g_GameModeOptions[6].Name = Localization.get("game_mode.option.6.name")
    g_SkillNames = {
        Localization.get("skill.name.1"),
        Localization.get("skill.name.2"),
        Localization.get("skill.name.3"),
        Localization.get("skill.name.4"),
        Localization.get("skill.name.5"),
        Localization.get("skill.name.6"),
    }
end)
g_PreselectedSkillIndices = {}



function BtnChoiceDialogEventFunc_GetSideOccupiedPlayerIndices(sideStartIndex)
    local playerIndices = {}
    local sideIndex = 7
    if sideStartIndex ~= 1 then sideIndex = 8 end
    local seats = g_SideSeatsOf(sideIndex) or {}
    for k = 1, getn(seats), 1 do
        local playerIndex = seats[k]
        local human = EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", "Player_" .. playerIndex, "Human")
        if human or (P ~= nil and P[playerIndex] ~= nil) then
            tinsert(playerIndices, playerIndex)
        end
    end
    return playerIndices
end




function BtnChoiceDialogEventFunc_GetSkillIndexForPlayer(playerIndex)
    local sideStartIndex = 1
    if g_IsAngelSeat(playerIndex) then
        sideStartIndex = 5
    end
    local playerIndices = BtnChoiceDialogEventFunc_GetSideOccupiedPlayerIndices(sideStartIndex)
    for i = 1, getn(playerIndices), 1 do
        if playerIndices[i] == playerIndex then
            return sideStartIndex - 1 + i
        end
    end
    return nil
end



function BtnChoiceDialogEventFunc_GetPreselectSlotCount()
    local sideCount = max(
        getn(BtnChoiceDialogEventFunc_GetSideOccupiedPlayerIndices(1)),
        getn(BtnChoiceDialogEventFunc_GetSideOccupiedPlayerIndices(5)))
    if sideCount < 1 then
        return 3
    end
    if sideCount > 4 then
        return 4
    end
    return sideCount
end




function BtnChoiceDialogEventFunc_FinishMarketTower(objectId)
    local tower = GetObjectById(objectId)
    ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower, "IN_SHIELD_SPHERE", 1)
    ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", tower, "UNPACKING", 0)
end

g_BuyTowerId = {
    ["JapanPointShieldControlTower"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    },
    ["SovietHeavyAntiAirMissileTurret"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    },
    ["JapanKamikazeCommandTower"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    },
    ["CelestialEnergyRailgunBase"] = {
        ["angel"] = 0,
        ["evil"] = 0,
    },
    ["AlliedAegisLargeDefenseBase"] = {
        ["angel"] = { 0, 0 },
        ["evil"] = { 0, 0 },
    }
}
g_MarketTowerBasePrice = {
    shield = 10000, sakura = 10000, poplar = 10000, aegis = 12000, railgun = 15000,
}
g_HextechTowerDefenseExpert = g_HextechTowerDefenseExpert or { false, false, false, false, false, false }

function BtnChoiceDialogEventFunc_HasTowerDefenseExpert(playerIndex)
    return g_HextechTowerDefenseExpert ~= nil
        and g_HextechTowerDefenseExpert[playerIndex] == true
end

function BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, basePrice)
    if BtnChoiceDialogEventFunc_HasTowerDefenseExpert(playerIndex) then
        return floor(basePrice * 0.5)
    end
    return basePrice
end


function BtnChoiceDialogEventFunc_GetFrontDefenseTower(playerIndex)
    local towerNames = { "T71", "T72", "T73", "T74" }
    if g_IsAngelSeat(playerIndex) then
        towerNames = { "T81", "T82", "T83", "T84" }
    end
    for i = 1, 4, 1 do
        local tower = GetObjectByScriptName(towerNames[i])
        if ObjectIsAlive(tower) then
            return tower
        end
    end
    return nil
end


function BtnChoiceDialogEventFunc_AllocateAegisSlot(slots, scanLimit)
    for i = 1, scanLimit, 1 do
        if not ObjectIsAlive(slots[i]) then
            return i
        end
    end
    return nil
end


function BtnChoiceDialogEventFunc_GetAegisLateralOffset(slotIndex)
    local ringCount = floor((slotIndex - 1) / 2)
    local lateralDirection = 1
    if slotIndex - ringCount * 2 == 2 then
        lateralDirection = -1
    end
    return lateralDirection * (126.75 + ringCount * 60)
end

g_CelestialTowerShadowFilter = nil

function BtnChoiceDialogEventFunc_GetCelestialTowerShadowFilter()
    if g_CelestialTowerShadowFilter == nil then
        g_CelestialTowerShadowFilter = CreateObjectFilter({
            Rule = "ANY",
            Relationship = "SAME_PLAYER",
            IncludeThing = { "CC_ShadowObject", "CC_ShadowParalyzer" },
        })
    end
    return g_CelestialTowerShadowFilter
end


function BtnChoiceDialogEventFunc_ClearCelestialTowerCore(objectId)
    if not ObjectIsAlive(objectId) then
        return
    end
    local object = GetObjectById(objectId)
    local x, y, z = ObjectGetPosition(object)
    local shadows, count = ObjectFindObjects(object,
        {X = x, Y = y, Z = z, Radius = 5, DistType = "CENTER_2D"},
        BtnChoiceDialogEventFunc_GetCelestialTowerShadowFilter())
    for i = 1, count, 1 do
        if shadows[i] ~= nil then
            ExecuteAction("NAMED_DELETE", shadows[i])
        end
    end
end

function BtnChoiceDialogEventFunc_FinishCelestialTower(objectId)
    ObjectSetObjectStatus(GetObjectById(objectId), "POINT_DEFENSE_DRONE_ATTACHED")
    SchedulerModule.delay_call(BtnChoiceDialogEventFunc_ClearCelestialTowerCore,
        3, {objectId})
end



function BtnChoiceDialogEventFunc_CreateCelestialRailgun(playerIndex)
    local behindDirection = -1;
    local playerOwn = "PlyrCivilian";
    local pos = {X = 2646.5, Y = 3102.5, Z = 210};
    if g_IsAngelSeat(playerIndex) then
        behindDirection = 1;
        playerOwn = "PlyrCreeps";
        pos = {X = 4403.5, Y = 3102.5, Z = 210};
    end
    local frontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(playerIndex)
    if ObjectIsAlive(frontTower) then
        local towerX, towerY, towerZ = ObjectGetPosition(frontTower);
        pos = {X = towerX + behindDirection * 253.5, Y = towerY, Z = towerZ};
    end
    local id = exCreateObject({
        ObjectType = FastHash("CelestialEnergyRailgunBase"),
        TeamName = playerOwn.."/team"..playerOwn,
        Position = pos,
        Angle = 0,
        Health = 9000
    });
    if not g_CelestialEnergyRailgunBaseRangeX175Modifier then
        g_CelestialEnergyRailgunBaseRangeX175Modifier = exAttributeModifierCreate(
            { RANGE = 1.75 }, 1)
    end
    ObjectLoadAttributeModifier(GetObjectById(id), g_CelestialEnergyRailgunBaseRangeX175Modifier)
    
    BtnChoiceDialogEventFunc_FinishMarketTower(id)
    BtnChoiceDialogEventFunc_FinishCelestialTower(id)
    return id
end


function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
    local round = exCounterGetByName("lvc")
    local previous = SetWorldBuilderThisPlayer(1)

    ButtonChoiceDialogManager:OnUserButtonChoiceDialogEvent(playerName, dialogId, btnIndex)
    
    if dialogId == 301 then
        if btnIndex == 1 then
            MsgCommand_BanSea()
        elseif btnIndex == 2 then
            MsgCommand_BanInfantry()
        end
    end

    SetWorldBuilderThisPlayer(previous)
end

function BtnChoiceDialogEventFunc_ShowMarketDialog(playerIndex)
    local dialogData = {
        DialogId = MARKET_DIALOG_ID_OFFSET + playerIndex,
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        Title = Localization.get("market.title"),
        Page = 1,
    }
    dialogData.RefreshData = function(self)
        local playerIndex = self.PlayerIndex
        local investedMax, investedMoney = devil_max, devil_money
        if g_IsAngelSeat(playerIndex) then
            investedMax, investedMoney = angel_max, angel_money
        end
        self.Title = Localization.get("market.title_with_investment", investedMax, investedMoney)

        local transferToA_Index, transferToB_Index, transferToC_Index = g_TfIdx(playerIndex)
        roles = {}
        for k = 1, 4 do
            roles[g_Seat7[k]] = Localization.get("board.role.devil" .. k)
            roles[g_Seat8[k]] = Localization.get("board.role.angel" .. k)
        end
        getColorText = function(index)
            local color = BtnChoiceDialogEventFunc_CalculateColor(index)
            if color == nil then
                return ""
            else
                return format("(%s)", color)
            end
        end
        roleText = function(k) return roles[k] or ("Player_" .. k) end
        local playerA_Color = getColorText(transferToA_Index)
        local playerB_Color = getColorText(transferToB_Index)
        
        local nextInvestmentText = Localization.get("market.next_investment.devil")
        if g_IsAngelSeat(playerIndex) then
            nextInvestmentText = Localization.get("market.next_investment.angel")
        end
        nextInvestmentText = nextInvestmentText .. Localization.get("market.next_investment.benefit")

        if self.Page == 2 then
            local shieldTowerPrice = BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, g_MarketTowerBasePrice.shield)
            local sakuraWellPrice = BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, g_MarketTowerBasePrice.sakura)
            local poplarTowerPrice = BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, g_MarketTowerBasePrice.poplar)
            local aegisPrice = BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, g_MarketTowerBasePrice.aegis)
            local tianmenBowPrice = BtnChoiceDialogEventFunc_GetTowerPrice(playerIndex, g_MarketTowerBasePrice.railgun)
            self.Choices = {
                Localization.get("market.buy_shield_tower", shieldTowerPrice), 
                Localization.get("market.buy_sakura_well", sakuraWellPrice), 
                Localization.get("market.buy_poplar_tower", poplarTowerPrice), 
                Localization.get("market.buy_aegis_shield_generator", aegisPrice), 
                Localization.get("market.buy_tianmen_bow", tianmenBowPrice), 
                Localization.get("market.back_to_main_page"), 
            }
        else
            local transferToC = transferToC_Index or transferToB_Index
            self.Choices = {
                Localization.get("market.transfer.choice", roleText(transferToA_Index), playerA_Color), 
                Localization.get("market.transfer.choice", roleText(transferToB_Index), playerB_Color), 
                Localization.get("market.transfer.choice", roleText(transferToC), getColorText(transferToC)), 
                nextInvestmentText, 
                Localization.get("market.back_to_battle"), 
                Localization.get("market.more_defense_buildings"), 
            }
        end
        
        
        
        
            
        
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if self.Page == 2 then
            if buttonIndex == 1 then
                self:BuyJapanPointShieldControlTower()
                return
            elseif buttonIndex == 2 then
                self:BuyJapanKamikazeCommandTower()
                return
            elseif buttonIndex == 3 then
                self:BuySovietHeavyAntiAirMissileTurret()
                return
            elseif buttonIndex == 4 then
                self:BuyAlliedAegisLargeDefenseBase()
                return
            elseif buttonIndex == 5 then
                self:BuyCelestialEnergyRailgunBase()
                return
            elseif buttonIndex == 6 then
                self.Page = 1
            end
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        end
        if buttonIndex >= 1 and buttonIndex <= 3 then
            self:TransferMoney(buttonIndex)
        elseif buttonIndex == 4 then
            self:InvestMoney()
        elseif buttonIndex == 5 then
            
            return
        elseif buttonIndex == 6 then
            self.Page = 2
        end
        
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData.TransferMoney = function(self, buttonIndex)
        local transferToA_Index, transferToB_Index, transferToC_Index = g_TfIdx(self.PlayerIndex)
        local transferTargetIndex = transferToA_Index
        if buttonIndex == 2 then
            transferTargetIndex = transferToB_Index
        elseif buttonIndex == 3 then
            transferTargetIndex = transferToC_Index or transferToB_Index
        end
        local transferTargetName = "Player_" .. transferTargetIndex
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', transferTargetName, '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, '-1000')
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.transfer.success", transferTargetIndex), 5)
        else
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.transfer.insufficient"), 5)
        end
    end
    
    dialogData.InvestMoney = function(self)
        local playerIndex = self.PlayerIndex
        local start = exCounterGetByName("start")
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        local isInvestementMax, totalInvestedMoney = false, 0
        if g_IsDevilSeat(playerIndex) and devil_money >= devil_max then
            isInvestementMax = true
        elseif g_IsAngelSeat(playerIndex) and angel_money >= angel_max then
            isInvestementMax = true
        end
        if isInvestementMax then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.invest.failed.max"), 5)
        elseif start <= 600 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.invest.failed.start_only"), 5)
        elseif money < 100 then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.invest.failed.insufficient"), 5)
        else
            if g_IsDevilSeat(playerIndex) then
                devil_money = devil_money + 100
                totalInvestedMoney = devil_money
            else
                angel_money = angel_money + 100
                totalInvestedMoney = angel_money
            end
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.invest.success", totalInvestedMoney), 5)
            ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, '-100')
        end
    end
    
    dialogData.TakeLoan = function(self)
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, debtMoney)
        exMessageAppendToMessageArea(Localization.get("market.loan.message", self.PlayerIndex))
        exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.loan.success"), 10)

        g_PlayerInDebt[self.PlayerName] = 1;
        g_PlayerDebtCount[self.PlayerName] = g_PlayerDebtCount[self.PlayerName] + 1;

        SchedulerModule.delay_call(function(pName)
            g_PlayerInDebt[pName] = 0;
        end, 15 * 60 * 3, {self.PlayerName})
    end
    dialogData.BuyJapanPointShieldControlTower = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local pos = {X = 2900, Y = 3187};
        if self.g_IsAngelSeat(PlayerIndex) then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            pos = {X = 4150, Y = 3187};
        end
        local objectId = g_BuyTowerId["JapanPointShieldControlTower"][sideName];
        local ignoresLimit = BtnChoiceDialogEventFunc_HasTowerDefenseExpert(self.PlayerIndex)
        if ObjectIsAlive(objectId) and not ignoresLimit then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.tower.already_exists"), 10);
            return;
        end
        local price = BtnChoiceDialogEventFunc_GetTowerPrice(self.PlayerIndex, g_MarketTowerBasePrice.shield)
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < price then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.funds.insufficient"), 10);
            return;
        end
        local id = exCreateObject({
            ObjectType = FastHash("JapanPointShieldControlTower"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = 210},
            Angle = 0,
            Health = 5500
        });
        if not ignoresLimit then
            g_BuyTowerId["JapanPointShieldControlTower"][sideName] = id;
        end
        local tower = GetObjectById(id);
        ObjectLoadAttributeModifier(tower,'AttributeModifier_BoxRateOfFireUp', 999999)
        ObjectLoadAttributeModifier(tower,'AttributeModifier_BoxRangeUp', 999999)
        BtnChoiceDialogEventFunc_FinishMarketTower(id)

        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -price);

    end
    dialogData.BuySovietHeavyAntiAirMissileTurret = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local pos = {X = 2900, Y = 3018};
        if self.g_IsAngelSeat(PlayerIndex) then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            pos = {X = 4150, Y = 3018};
        end
        local objectId = g_BuyTowerId["SovietHeavyAntiAirMissileTurret"][sideName];
        local ignoresLimit = BtnChoiceDialogEventFunc_HasTowerDefenseExpert(self.PlayerIndex)
        if ObjectIsAlive(objectId) and not ignoresLimit then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.tower.already_exists"), 10);
            return;
        end
        local price = BtnChoiceDialogEventFunc_GetTowerPrice(self.PlayerIndex, g_MarketTowerBasePrice.poplar)
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < price then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.funds.insufficient"), 10);
            return;
        end
        local id = exCreateObject({
            ObjectType = FastHash("SovietHeavyAntiAirMissileTurret"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = 210},
            Angle = 0,
            Health = 9000
        });
        if not ignoresLimit then
            g_BuyTowerId["SovietHeavyAntiAirMissileTurret"][sideName] = id;
        end
        local tower = GetObjectById(id);
        ObjectLoadAttributeModifier(tower,'AttributeModifier_MAP_Area_FireSpeed_Up', 999999)
        ObjectLoadAttributeModifier(tower,'AttributeModifier_JapanNanoEnhanceDroneReinforcement', 999999)
        
        if not g_SovietHeavyAntiAirMissileTurretRangeX15Modifier then
            g_SovietHeavyAntiAirMissileTurretRangeX15Modifier = exAttributeModifierCreate(
                { RANGE = 1.5, VISION = 1.5 }, 1)
        end
        ObjectLoadAttributeModifier(tower, g_SovietHeavyAntiAirMissileTurretRangeX15Modifier)
        BtnChoiceDialogEventFunc_FinishMarketTower(id)

        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -price);

    end
    dialogData.BuyJapanKamikazeCommandTower = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local behindDirection = -1;
        local pos = {X = 2773.25, Y = 3102.5, Z = 210};
        if self.g_IsAngelSeat(PlayerIndex) then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            behindDirection = 1;
            pos = {X = 4276.75, Y = 3102.5, Z = 210};
        end
        local frontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(self.PlayerIndex)
        if ObjectIsAlive(frontTower) then
            local towerX, towerY, towerZ = ObjectGetPosition(frontTower);
            
            local behindDistance = 126.75;
            pos = {X = towerX + behindDirection * behindDistance, Y = towerY, Z = towerZ};
        end
        local objectId = g_BuyTowerId["JapanKamikazeCommandTower"][sideName];
        local ignoresLimit = BtnChoiceDialogEventFunc_HasTowerDefenseExpert(self.PlayerIndex)
        if ObjectIsAlive(objectId) and not ignoresLimit then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.tower.already_exists"), 10);
            return;
        end
        local price = BtnChoiceDialogEventFunc_GetTowerPrice(self.PlayerIndex, g_MarketTowerBasePrice.sakura)
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < price then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.funds.insufficient"), 10);
            return;
        end
        local id = exCreateObject({
            ObjectType = FastHash("JapanKamikazeCommandTower"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = pos.Z},
            Angle = 0,
            
            Health = 9000
        });
        
        if not g_JapanKamikazeCommandTowerRangeX15Modifier then
            g_JapanKamikazeCommandTowerRangeX15Modifier = exAttributeModifierCreate(
                { RANGE = 1.5, VISION = 1.5 }, 1)
        end
        ObjectLoadAttributeModifier(GetObjectById(id), g_JapanKamikazeCommandTowerRangeX15Modifier)
        
        BtnChoiceDialogEventFunc_FinishMarketTower(id)
        if not ignoresLimit then
            g_BuyTowerId["JapanKamikazeCommandTower"][sideName] = id;
        end
        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -price);
    end
    
    dialogData.BuyCelestialEnergyRailgunBase = function(self)
        local sideName = "evil";
        if self.g_IsAngelSeat(PlayerIndex) then
            sideName = "angel";
        end
        local objectId = g_BuyTowerId["CelestialEnergyRailgunBase"][sideName];
        local ignoresLimit = BtnChoiceDialogEventFunc_HasTowerDefenseExpert(self.PlayerIndex)
        if ObjectIsAlive(objectId) and not ignoresLimit then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.tower.already_exists"), 10);
            return;
        end
        local price = BtnChoiceDialogEventFunc_GetTowerPrice(self.PlayerIndex, g_MarketTowerBasePrice.railgun)
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < price then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.funds.insufficient"), 10);
            return;
        end
        local id = BtnChoiceDialogEventFunc_CreateCelestialRailgun(self.PlayerIndex)
        if not ignoresLimit then
            g_BuyTowerId["CelestialEnergyRailgunBase"][sideName] = id;
        end
        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -price);
    end
    dialogData.BuyAlliedAegisLargeDefenseBase = function(self)
        local sideName = "evil";
        local playerOwn = "PlyrCivilian";
        local behindDirection = -1;
        local towerPos = {X = 2900, Y = 3102.5, Z = 210};
        if self.g_IsAngelSeat(PlayerIndex) then
            sideName = "angel";
            playerOwn = "PlyrCreeps";
            behindDirection = 1;
            towerPos = {X = 4150, Y = 3102.5, Z = 210};
        end
        local frontTower = BtnChoiceDialogEventFunc_GetFrontDefenseTower(self.PlayerIndex)
        if ObjectIsAlive(frontTower) then
            local towerX, towerY, towerZ = ObjectGetPosition(frontTower);
            towerPos = {X = towerX + behindDirection * 126.75, Y = towerY, Z = towerZ};
        end
        local ignoresLimit = BtnChoiceDialogEventFunc_HasTowerDefenseExpert(self.PlayerIndex)
        
        local slots = g_BuyTowerId["AlliedAegisLargeDefenseBase"][sideName];
        
        
        local scanLimit = getn(slots);
        if not ignoresLimit then
            scanLimit = 2;
        end
        local slotIndex = BtnChoiceDialogEventFunc_AllocateAegisSlot(slots, scanLimit)
        if slotIndex == nil then
            if not ignoresLimit then
                exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.tower.already_exists"), 10);
                return;
            end
            
            slotIndex = getn(slots) + 1;
            slots[slotIndex] = 0;
        end
        local price = BtnChoiceDialogEventFunc_GetTowerPrice(self.PlayerIndex, g_MarketTowerBasePrice.aegis)
        local money = exPlayerGetCurrentMoney(self.PlayerName)
        if money < price then
            exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("market.funds.insufficient"), 10);
            return;
        end
        
        local pos = {
            X = towerPos.X,
            Y = towerPos.Y + BtnChoiceDialogEventFunc_GetAegisLateralOffset(slotIndex),
            Z = towerPos.Z
        };
        local id = exCreateObject({
            ObjectType = FastHash("AlliedAegisLargeDefenseBase"),
            TeamName = playerOwn.."/team"..playerOwn,
            Position = {X = pos.X, Y = pos.Y, Z = pos.Z},
            Angle = 0,
            Health = 9000
        });
        slots[slotIndex] = id;
        BtnChoiceDialogEventFunc_FinishMarketTower(id)
        ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -price);
    end

    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end



function g_TfIdx(playerIndex)
    local seats = g_Seat7
    if g_IsAngelSeat(playerIndex) then
        seats = g_Seat8
    end
    local list = {}
    for k = 1, 4 do
        if seats[k] ~= playerIndex then tinsert(list, seats[k]) end
    end
    return list[1], list[2], list[3]
end

function BtnChoiceDialogEventFunc_CalculateColor(playerIndex)
    local playerName = "Player_" .. playerIndex
    local color = exPlayerGetColor(playerName)
    if color == nil or color[1] == nil or color[1] <= 0 then
        return nil
    end
    
    
    local red = color[1] / 255
    local green = color[2] / 255
    local blue = color[3] / 255
    local maxValue = max(red, green, blue)
    local minValue = min(red, green, blue)
    local lightness = (maxValue + minValue) / 2
    if lightness < 0.1 then
        return Localization.get("color.black")
    elseif lightness > 0.95 then
        return Localization.get("color.white")
    elseif maxValue == minValue then
        return Localization.get("color.gray")
    end
    local d = maxValue - minValue
    local saturation = 0
    if lightness > 0.5 then
        saturation = d / (2 - maxValue - minValue)
    else
        saturation = d / (maxValue + minValue)
    end
    if saturation < 0.1 then
        return Localization.get("color.gray")
    end
    local hue = 0
    if maxValue == red then
        hue = (green - blue) / d
    elseif maxValue == green then
        hue = (blue - red) / d + 2
    elseif maxValue == blue then
        hue = (red - green) / d + 4
    end
    if hue < 0 then
        hue = hue + 6
    end
    hue = hue * 60
    if hue < 20 or hue >= 330 then
        return Localization.get("color.red")
    elseif hue < 45 then
        return Localization.get("color.orange")
    elseif hue < 75 then
        return Localization.get("color.yellow")
    elseif hue < 160 then
        return Localization.get("color.green")
    elseif hue < 200 then
        return Localization.get("color.cyan")
    elseif hue < 270 then
        return Localization.get("color.blue")
    elseif hue < 300 then
        return Localization.get("color.purple")
    elseif hue < 330 then
        return Localization.get("color.pink")
    end
    return nil
end

function BtnChoiceDialogEventFunc_ShowGameModeDialog(playerName)
    local dialogData = {
        DialogId = GAMEMODE_DIALOG_ID,
        PlayerName = playerName,
        Title = Localization.get("game_mode.dialog.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        local hasSelected = false
        for i = 1, getn(g_GameModeOptions) do
            local option = g_GameModeOptions[i]
            if i == 4 then
                
                local drawModeName = Localization.get("draw_mode.disabled")
                if g_DrawMode == 1 then
                    drawModeName = Localization.get("draw_mode.original")
                elseif g_DrawMode == 2 then
                    drawModeName = Localization.get("draw_mode.pure")
                end
                tinsert(self.Choices, Localization.get("draw_mode.open", drawModeName))
            elseif i == 5 then
                
                local hextechName = Localization.get("hextech.option.0")
                if g_HextechCount ~= nil then
                    if g_HextechCount >= 1 and g_HextechCount <= 4 then
                        hextechName = Localization.get("hextech.option." .. tostring(g_HextechCount))
                    end
                end
                tinsert(self.Choices, Localization.get("hextech.entry", hextechName))
            elseif i == 6 then
                
                local moreOptionsName = ""
                if g_EnableShrinkMode == 1 then
                    moreOptionsName = moreOptionsName .. Localization.get("game_mode.shrink_suffix")
                end
                tinsert(self.Choices, Localization.get("more_options.entry") .. moreOptionsName)
            elseif option.IsSelected then
                tinsert(self.Choices, option.Name .. Localization.get("game_mode.selected_suffix"))
                hasSelected = true
            else
                tinsert(self.Choices, option.Name)
            end
        end
        if hasSelected then
            tinsert(self.Choices, Localization.get("game_mode.confirm"))
        end
        self._initialized = true
    end
    dialogData.OnChoice = function(self, buttonIndex)
        local normalGameOption = g_GameModeOptions[1]
        local deathGameOption = g_GameModeOptions[2]
        local purchaseTechMode = g_GameModeOptions[3]
        
        if buttonIndex == getn(g_GameModeOptions) + 1 then
            
            g_EnableDeathModeEffect = self:BooleanToNumber(deathGameOption.IsSelected)
            g_LuckyCrateMode = 0
            if g_DrawMode == 1 or g_DrawMode == 2 then
                g_LuckyCrateMode = 1
            end
            BtnChoiceDialogEventFunc_ApplyHostHextechSetting()
            if g_DisableSeaArmy == 1 then
                
                g_NoNavyTeslaBoatUnlocked = 0
                for i = 1, 8 do
                    ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. i, "SovietAntiNavyShipTech1", 0)
                end
            end
            if purchaseTechMode.IsSelected then
                g_GameMode = 4
            elseif g_EnableDeathModeEffect == 1 then
                g_GameMode = 2
            else
                g_GameMode = 1 
            end
            BtnChoiceDialogEventFunc_ShowHostChoosePlayerSkillModeDialog(self.PlayerName)
            return
        end
        
        if buttonIndex == 4 then
            BtnChoiceDialogEventFunc_ShowDrawModeDialog(self.PlayerName)
            return
        end
        
        if buttonIndex == 5 then
            BtnChoiceDialogEventFunc_ShowHextechModeDialog(self.PlayerName)
            return
        end
        
        if buttonIndex == 6 then
            BtnChoiceDialogEventFunc_ShowMoreOptionsDialog(self.PlayerName)
            return
        end
        local option = g_GameModeOptions[buttonIndex]
        if not option then
            exMessageAppendToMessageArea(Localization.get("game_mode.error.invalid_button", self.PlayerName, buttonIndex))
            return
        end
        if not option.IsSelected then
            option.IsSelected = true
            exMessageAppendToMessageArea(Localization.get("game_mode.host.selected", option.Name))
        elseif option ~= normalGameOption then
            option.IsSelected = nil
            exMessageAppendToMessageArea(Localization.get("game_mode.host.canceled", option.Name))
        end
        if option == normalGameOption then
            
            deathGameOption.IsSelected = nil
            purchaseTechMode.IsSelected = nil
        elseif option == deathGameOption then
            normalGameOption.IsSelected = nil
            purchaseTechMode.IsSelected = nil
        elseif option == purchaseTechMode then
            normalGameOption.IsSelected = nil
            deathGameOption.IsSelected = nil
        end
        
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData.BooleanToNumber = function(self, value)
        if value then
            return 1
        else
            return 0
        end
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end


function BtnChoiceDialogEventFunc_ShowMoreOptionsDialog(playerName)
    local dialogData = {
        DialogId = MORE_OPTIONS_DIALOG_ID,
        PlayerName = playerName,
        Title = Localization.get("more_options.dialog.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {
            Localization.get("more_options.shrink") .. (g_EnableShrinkMode == 1 and Localization.get("game_mode.selected_suffix") or ""),
            Localization.get("more_options.ban_mode") .. BanModeGetSummarySuffix(),
            Localization.get("more_options.back"),
        }
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 then
            if g_EnableShrinkMode == 1 then
                g_EnableShrinkMode = 0
                exMessageAppendToMessageArea(Localization.get("game_mode.host.canceled", Localization.get("more_options.shrink")))
            else
                g_EnableShrinkMode = 1
                exMessageAppendToMessageArea(Localization.get("game_mode.host.selected", Localization.get("more_options.shrink")))
            end
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        elseif buttonIndex == 2 then
            BtnChoiceDialogEventFunc_ShowBanModeDialog(self.PlayerName)
            return
        elseif buttonIndex == 3 then
            BtnChoiceDialogEventFunc_ShowGameModeDialog(self.PlayerName)
            return
        end
        exMessageAppendToMessageArea(Localization.get("game_mode.error.invalid_button", self.PlayerName, buttonIndex))
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowDrawModeDialog(playerName)
    local dialogData = {
        DialogId = DRAW_MODE_DIALOG_ID,
        PlayerName = playerName,
        Title = Localization.get("draw_mode.dialog.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {
            Localization.get("draw_mode.disabled"),
            Localization.get("draw_mode.original"),
            Localization.get("draw_mode.pure"),
            Localization.get("draw_mode.back"),
        }
        if g_DrawMode >= 0 and g_DrawMode <= 2 then
            self.Choices[g_DrawMode + 1] = self.Choices[g_DrawMode + 1]
                .. Localization.get("game_mode.selected_suffix")
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex >= 1 and buttonIndex <= 3 then
            g_DrawMode = buttonIndex - 1
            g_LuckyCrateMode = 0
            if g_DrawMode ~= 0 then
                g_LuckyCrateMode = 1
            end
            
            local selectedDrawModeName = Localization.get("draw_mode.disabled")
            if g_DrawMode == 1 then
                selectedDrawModeName = Localization.get("draw_mode.original")
            elseif g_DrawMode == 2 then
                selectedDrawModeName = Localization.get("draw_mode.pure")
            end
            exMessageAppendToMessageArea(
                Localization.get("game_mode.host.selected", selectedDrawModeName))
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        elseif buttonIndex == 4 then
            BtnChoiceDialogEventFunc_ShowGameModeDialog(self.PlayerName)
            return
        end
        exMessageAppendToMessageArea(Localization.get("game_mode.error.invalid_button", self.PlayerName, buttonIndex))
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowHextechModeDialog(playerName)
    local dialogData = {
        DialogId = HEXTECH_MODE_DIALOG_ID,
        PlayerName = playerName,
        Title = Localization.get("hextech.dialog.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {
            Localization.get("hextech.option.0"),
            Localization.get("hextech.option.1"),
            Localization.get("hextech.option.2"),
            Localization.get("hextech.option.3"),
            Localization.get("hextech.option.4"),
            HextechRerollModeLabel(),
            Localization.get("hextech.back"),
        }
        if g_HextechCount >= 0 and g_HextechCount <= 4 then
            self.Choices[g_HextechCount + 1] = self.Choices[g_HextechCount + 1]
                .. Localization.get("game_mode.selected_suffix")
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex >= 1 and buttonIndex <= 5 then
            g_HextechCount = buttonIndex - 1
            g_HextechCountManuallySet = true
            local selectedHextechName = Localization.get("hextech.option." .. g_HextechCount)
            exMessageAppendToMessageArea(
                Localization.get("game_mode.host.selected", selectedHextechName))
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        elseif buttonIndex == 6 then
            HextechRerollModeApply(self)
            return
        elseif buttonIndex == 7 then
            BtnChoiceDialogEventFunc_ShowGameModeDialog(self.PlayerName)
            return
        end
        exMessageAppendToMessageArea(Localization.get("game_mode.error.invalid_button", self.PlayerName, buttonIndex))
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowHostChoosePlayerSkillModeDialog(playerName)
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET + 0, 
        PlayerName = playerName,
        Title = Localization.get("skill_mode.dialog.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        if preselectedSkillCount == 0 then
            tinsert(self.Choices, Localization.get("skill_mode.choose_yourself"))
        end
        tinsert(self.Choices, Localization.get("skill_mode.host_symmetric"))
        
        if preselectedSkillCount == 0 then
            
            
            tinsert(self.Choices, Localization.get("skill_mode.random_symmetric"))
            tinsert(self.Choices, Localization.get("skill_mode.random_asymmetric"))
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 then
            if getn(g_PreselectedSkillIndices) == 0 then
                
                
                BtnChoiceDialogEventFunc_InvokeStartGame()
                return
            end
            return
        end
        if buttonIndex == 2 then
            BtnChoiceDialogEventFunc_ShowHostChooseSkillForAllDialog(self.PlayerName)
            return
        elseif buttonIndex == 3 then
            self:RandomSkill(true)
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        elseif buttonIndex == 4 then
            self:RandomSkill(false)
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        end

    end
    
    
    dialogData.EnsureSideHasNonCopySkill = function(self, sideStartIndex, copySkillIndex, poolOffset)
        local playerIndices = BtnChoiceDialogEventFunc_GetSideOccupiedPlayerIndices(sideStartIndex)
        if getn(playerIndices) < 1 then
            return
        end
        local skillIndices = {}
        local allCopy = 1
        for i = 1, getn(playerIndices), 1 do
            local skillIndex = sideStartIndex - 1 + i - poolOffset
            tinsert(skillIndices, skillIndex)
            if g_PreselectedSkillIndices[skillIndex] ~= copySkillIndex then
                allCopy = nil
            end
        end
        if allCopy then
            local targetIndex = skillIndices[self:RandomInteger(1, getn(skillIndices))]
            g_PreselectedSkillIndices[targetIndex] = self:RandomInteger(1, copySkillIndex - 1)
        end
    end

    
    dialogData.AppendRandomSkillSide = function(self, baseIndex, sideCount, skillNamesCount)
        for i = 1, 4, 1 do
            if i <= sideCount then
                tinsert(g_PreselectedSkillIndices, self:RandomInteger(1, skillNamesCount))
            else
                tinsert(g_PreselectedSkillIndices,
                    g_PreselectedSkillIndices[baseIndex + i - sideCount])
            end
        end
    end

    dialogData.RandomSkill = function(self, isSymmetric)
        
        local copySkillIndex = 6
        g_PreselectedSkillIndices = {}
        g_PreselectedSkillIndices.IsRandom = true
        local skillNamesCount = getn(g_SkillNames)
        
        
        local sideCount = BtnChoiceDialogEventFunc_GetPreselectSlotCount()
        self:AppendRandomSkillSide(0, sideCount, skillNamesCount)
        if isSymmetric then
            g_PreselectedSkillIndices.IsSymmetric = true
            
            self:EnsureSideHasNonCopySkill(1, copySkillIndex, 0)
            self:EnsureSideHasNonCopySkill(5, copySkillIndex, 4)
            for i = 1, 4, 1 do
                tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[i])
            end
        else
            g_PreselectedSkillIndices.IsSymmetric = false
            
            self:AppendRandomSkillSide(4, sideCount, skillNamesCount)
            self:EnsureSideHasNonCopySkill(1, copySkillIndex, 0)
            self:EnsureSideHasNonCopySkill(5, copySkillIndex, 0)
        end
    end
    dialogData.RandomInteger = function(self, min, max)
        
        for i = 1, mod(GetFrame(), 7) do
            GetRandomNumber()
        end

        local range = max - min + 1
        local value = GetRandomNumber() * range + min
        value = floor(value)
        if value < min then
            value = min
        elseif value > max then
            value = max
        end
        return value
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end


function BtnChoiceDialogEventFunc_ShowHostChooseSkillForAllDialog(playerName)
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET2 + 0, 
        PlayerName = playerName,
        Title = Localization.get("skill_mode.all.title"),
        Choices = {},
    }
    dialogData.RefreshData = function(self)
        self.Choices = {}
        
        local requiredCount = BtnChoiceDialogEventFunc_GetPreselectSlotCount()
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        if preselectedSkillCount > 0 then
            tinsert(self.Choices, Localization.get("skill_mode.cancel"))
            if preselectedSkillCount < requiredCount then
                
                self.Title = Localization.get("skill_mode.continue", requiredCount - preselectedSkillCount)
            end
        else
            self.Title = Localization.get("skill_mode.all.title")
        end
        for i = 1, getn(g_SkillNames) do
            local name = g_SkillNames[i]
            for j = 1, getn(g_PreselectedSkillIndices) do
                if g_PreselectedSkillIndices[j] == i then
                    name = name .. Localization.get("skill_mode.selected_suffix")
                    break
                end
            end
            tinsert(self.Choices, name)
        end
    end
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 and getn(g_PreselectedSkillIndices) > 0 then
            
            g_PreselectedSkillIndices = {}
            
            self:RefreshData()
            ButtonChoiceDialogManager:ShowDialog(self)
            return
        end

        
        
        local skillIndex = buttonIndex - 1
        local preselectedSkillCount = getn(g_PreselectedSkillIndices)
        
        if preselectedSkillCount == 0 then
            skillIndex = buttonIndex
        end
        if skillIndex < 1 or skillIndex > getn(g_SkillNames) then
            exMessageAppendToMessageArea(Localization.get("skill_mode.invalid_button", self.PlayerName, buttonIndex))
            return
        end
        local alreadySelected = false
        for i = 1, getn(g_PreselectedSkillIndices) do
            if g_PreselectedSkillIndices[i] == skillIndex then
                alreadySelected = true
                break
            end
        end
        if not alreadySelected then
            tinsert(g_PreselectedSkillIndices, skillIndex)
        end

        if getn(g_PreselectedSkillIndices) >= BtnChoiceDialogEventFunc_GetPreselectSlotCount() then
            
            for i = getn(g_PreselectedSkillIndices) + 1, 4, 1 do
                tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[1])
            end
            for i = 1, 4, 1 do
                tinsert(g_PreselectedSkillIndices, g_PreselectedSkillIndices[i])
            end
            
            BtnChoiceDialogEventFunc_InvokeStartGame()
            return
        end

        
        self:RefreshData()
        ButtonChoiceDialogManager:ShowDialog(self)
    end
    dialogData:RefreshData()
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_InvokeStartGame()
    
    local gameModeText = ''
    local skillText = ''
    
    if g_GameMode == 1 then
        gameModeText = Localization.get("game_mode.standard")
    elseif g_GameMode == 2 then
        gameModeText = Localization.get("game_mode.death")
    elseif g_GameMode == 4 then
        gameModeText = Localization.get("game_mode.level_up")
    end
    
    local featureText = ''
    if g_EnableHextechRune == 1 then
        featureText = Localization.get("game_mode.hextech_name")
    end
    if g_EnableShrinkMode == 1 then
        if featureText ~= '' then
            featureText = featureText .. Localization.get("game_mode.feature_separator")
        end
        featureText = featureText .. Localization.get("game_mode.shrink_name")
    end
    if g_BanModeOrder ~= nil and BanModeNameOf ~= nil then
        for banIndex = 1, getn(g_BanModeOrder), 1 do
            if featureText ~= '' then
                featureText = featureText .. Localization.get("game_mode.feature_separator")
            end
            featureText = featureText .. BanModeNameOf(g_BanModeOrder[banIndex])
        end
    end
    if featureText ~= '' then
        gameModeText = gameModeText .. Localization.get("game_mode.feature_bracket", featureText)
    end
    
    local drawModeText = ''
    if g_DrawMode == 1 then
        drawModeText = Localization.get("game_mode.lucky_crate_suffix")
    elseif g_DrawMode == 2 then
        drawModeText = Localization.get("game_mode.pure_draw_suffix")
    end
    local preselectedSkillCount = getn(g_PreselectedSkillIndices)
    if preselectedSkillCount == 6 then
        if g_PreselectedSkillIndices.IsRandom then
            if g_PreselectedSkillIndices.IsSymmetric then
                skillText = Localization.get("game.start.skill_random_symmetric")
            else
                skillText = Localization.get("game.start.skill_random_asymmetric")
            end
            
            
            
            
            
            
            
            
        else
            
            local preselectCount = BtnChoiceDialogEventFunc_GetPreselectSlotCount()
            skillText = Localization.get("game.start.skill_prefix")
            for i = 1, preselectCount do
                skillText = skillText .. g_SkillNames[g_PreselectedSkillIndices[i]]
                if i < preselectCount then
                    skillText = skillText .. ','
                end
            end
        end
    elseif preselectedSkillCount == 0 then
        skillText = Localization.get("game.start.skill_free_choice")
    else
        exMessageAppendToMessageArea(Localization.get("skill_mode.error.preselected_count", preselectedSkillCount))
        return
    end
    local beginLines = { Localization.get("game.start.begin", gameModeText) }
    if drawModeText ~= '' then
        tinsert(beginLines, drawModeText)
    end
    tinsert(beginLines, skillText)
    for i = 1, getn(beginLines), 1 do
        exMessageAppendToMessageArea(beginLines[i])
    end
    local economicMultiplier = exModeGetCheatMultiplier()
    tinsert(beginLines, Localization.get("game.start.economic_multiplier",
        economicMultiplier, GetBaseRecycleRate(economicMultiplier) * 100))
    local boardText = beginLines[1]
    for i = 2, getn(beginLines), 1 do
        boardText = boardText .. "\n" .. beginLines[i]
    end
    exAddTextToPublicBoard(boardText, 15)
    exEnableWBScript("readyForStartCam")
end

function BtnChoiceDialogEventFunc_ShowPlayerChooseSkillDialog(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 8 then
        exMessageAppendToMessageArea(Localization.get("skill_mode.player_choose.invalid_player_name"))
        return
    end
    local dialogData = {
        DialogId = SKILL_DIALOG_ID_OFFSET + g_PlayerNameToIndex[playerName],
        PlayerName = playerName,
        Title = Localization.get("skill_mode.player_choose.title"),
        Choices = {},
    }
    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == getn(g_SkillNames) + 1 then
            
            return
        end
        CenterTopBtnFunc_CreatePlayerSkillButtons(g_PlayerNameToIndex[self.PlayerName], buttonIndex)
    end
    for i = 1, getn(g_SkillNames) do
        tinsert(dialogData.Choices, g_SkillNames[i])
    end
    tinsert(dialogData.Choices, Localization.get("skill_mode.player_choose.exit"))
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_ShowPurchaseTechDialog(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 8 then
        exMessageAppendToMessageArea(Localization.get("skill_mode.player_choose.invalid_tech_player_name"))
        return
    end
    local techLevel = g_evilTechLevel
    if g_IsAngelSeat(playerIndex) then
        techLevel = g_angelTechLevel
    end

    local dialogData = {
        DialogId = PURCHASE_TECH_DIALOG_ID + g_PlayerNameToIndex[playerName],
        PlayerName = playerName,
        Choices = {},
    }

    dialogData.getNeededMoney = function(self, techLevel3)
        local playerIndex2 = g_PlayerNameToIndex[self.PlayerName]
        local neededMoneyOriginal = g_techLevelNeededMoney[techLevel3]
        local roundRecord = g_evilTechBuyRound;
        if playerIndex2 >= 4 then
            roundRecord = g_angelTechBuyRound
        end
        local round = exCounterGetByName("lvc")
        local diffRound = round - roundRecord[techLevel3]
        return neededMoneyOriginal - min(g_maxTechLevelDecreaseMoney[techLevel3], diffRound * g_maxTechLevelDecreaseRate[techLevel3])
    end

    local neededMoney = dialogData:getNeededMoney(techLevel)
    dialogData.Title = Localization.get("skill_mode.purchase.tech.title", neededMoney)

    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex == 1 then

            local previous = SetWorldBuilderThisPlayer(1)

            local playerIndex2 = g_PlayerNameToIndex[self.PlayerName]
            local techLevel2 = g_evilTechLevel
            if playerIndex2 >= 4 then
                techLevel2 = g_angelTechLevel
            end

            local neededMoney2 = self:getNeededMoney(techLevel2)

            local money = exPlayerGetCurrentMoney(self.PlayerName)
            if money >= neededMoney2 then
                ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, -neededMoney2)

                self:onPurchaseSuccess(playerIndex2)

            else
                exAddTextToPublicBoardForPlayer(self.PlayerName, Localization.get("skill_mode.purchase.tech.failed"), 10)
            end

            SetWorldBuilderThisPlayer(previous)
        end
    end

    dialogData.onPurchaseSuccess = function(self, pIndex)
        if g_IsAngelSeat(pIndex) then
            g_angelTechLevel = g_angelTechLevel + 1
            if g_angelTechLevel < 4 then
                for _k = 1, 4 do local i = g_Seat8[_k]
                    exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("skill_mode.purchase.tech.success"), 20)
                    exCreateCustomButtonForPlayer("Player_" .. i, {
                        Index = 7,
                        TextureName = "AUA_Bribe",
                        Desc = Localization.get("skill_mode.purchase.tech.description", g_angelTechLevel),
                        X = 250,
                        Y = 20,
                        GroupIndex = 1,
                        AlignX = "right",
                        AlignY = "top",
                    })
                end

            else
                for _k = 1, 4 do local i = g_Seat8[_k]
                    exCustomBtnSetVisibilityForPlayer("Player_" .. i, 7, 0)
                end
            end

            

            if g_angelTechLevel == 2 then
                exEnableWBScript('Player_4/UNLOCK1__4')
                exEnableWBScript('Player_5/UNLOCK1__5')
                exEnableWBScript('Player_6/UNLOCK1__6')
                LIMITPOWERC = 6
                g_angelTechBuyRound[2] = exCounterGetByName("lvc")
            elseif g_angelTechLevel == 3 then
                exEnableWBScript('Player_4/UNLOCK2__4')
                exEnableWBScript('Player_5/UNLOCK2__5')
                exEnableWBScript('Player_6/UNLOCK2__6')
                LIMITPOWERC = 8
                g_angelTechBuyRound[3] = exCounterGetByName("lvc")
            elseif g_angelTechLevel == 4 then
                exEnableWBScript('Player_4/UNLOCK3__4')
                exEnableWBScript('Player_5/UNLOCK3__5')
                exEnableWBScript('Player_6/UNLOCK3__6')
                LIMITPOWERC = 10
            end

            ExecuteAction("PLAY_SOUND_EFFECT", "MAP_Rescue");

            for _k = 1, 4 do local i = g_Seat8[_k]
                
                local nonCelestialLimit = 5
                local celestialLimit = 4
                if GetPlayerPowerPlantReferenceLimit ~= nil then
                    nonCelestialLimit = GetPlayerPowerPlantReferenceLimit(i, 0)
                    celestialLimit = GetPlayerPowerPlantReferenceLimit(i, 1)
                end
                exCustomTextUpdateTextForPlayer("Player_" .. i, 1, Localization.get("purchase_tech.level", g_angelTechLevel))
                exCustomTextUpdateTextForPlayer("Player_" .. i, 2, Localization.get("purchase_tech.power_plants", nonCelestialLimit))
                exCustomTextUpdateTextForPlayer("Player_" .. i, 3, Localization.get("purchase_tech.celestial_plants", celestialLimit))
            end


        else
            g_evilTechLevel = g_evilTechLevel + 1
            if g_evilTechLevel < 4 then
                for _k = 1, 4 do local i = g_Seat8[_k]
                    exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("skill_mode.purchase.tech.success"), 20)
                    exCreateCustomButtonForPlayer("Player_" .. i, {
                        Index = 7,
                        TextureName = "AUA_Bribe",
                        Desc = Localization.get("skill_mode.purchase.tech.description", g_evilTechLevel),
                        X = 250,
                        Y = 20,
                        GroupIndex = 1,
                        AlignX = "right",
                        AlignY = "top",
                    })
                end

            else
                for _k = 1, 4 do local i = g_Seat8[_k]
                    exCustomBtnSetVisibilityForPlayer("Player_" .. i, 7, 0)
                end
            end

            LIMITPOWERC = LIMITPOWERC  + 2
            if g_evilTechLevel == 2 then
                exEnableWBScript('Player_1/UNLOCK1__1')
                exEnableWBScript('Player_2/UNLOCK1__2')
                exEnableWBScript('Player_3/UNLOCK1__3')
                LIMITPOWERC = 6
                g_evilTechBuyRound[2] = exCounterGetByName("lvc")
            elseif g_evilTechLevel == 3 then
                exEnableWBScript('Player_1/UNLOCK2__1')
                exEnableWBScript('Player_2/UNLOCK2__2')
                exEnableWBScript('Player_3/UNLOCK2__3')
                LIMITPOWERC = 8
                g_evilTechBuyRound[3] = exCounterGetByName("lvc")
            elseif g_evilTechLevel == 4 then
                exEnableWBScript('Player_1/UNLOCK3__1')
                exEnableWBScript('Player_2/UNLOCK3__2')
                exEnableWBScript('Player_3/UNLOCK3__3')
                LIMITPOWERC = 10
            end

            ExecuteAction("PLAY_SOUND_EFFECT", "MAP_Rescue");

            for _k = 1, 4 do local i = g_Seat8[_k]
                
                local nonCelestialLimit = 5
                local celestialLimit = 4
                if GetPlayerPowerPlantReferenceLimit ~= nil then
                    nonCelestialLimit = GetPlayerPowerPlantReferenceLimit(i, 0)
                    celestialLimit = GetPlayerPowerPlantReferenceLimit(i, 1)
                end
                exCustomTextUpdateTextForPlayer("Player_" .. i, 1, Localization.get("purchase_tech.level", g_evilTechLevel))
                exCustomTextUpdateTextForPlayer("Player_" .. i, 2, Localization.get("purchase_tech.power_plants", nonCelestialLimit))
                exCustomTextUpdateTextForPlayer("Player_" .. i, 3, Localization.get("purchase_tech.celestial_plants", celestialLimit))
            end

        end
        if PureDrawReapplyPlayerQuota ~= nil then
            local firstPlayer = 1
            if g_IsAngelSeat(pIndex) then
                firstPlayer = 4
            end
            for i = firstPlayer, firstPlayer + 2, 1 do
                PureDrawReapplyPlayerQuota(i)
            end
        end
    end

    tinsert(dialogData.Choices, Localization.get("skill_mode.purchase.tech.choice.buy"))
    tinsert(dialogData.Choices, Localization.get("skill_mode.purchase.tech.choice.no_buy"))
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end

function BtnChoiceDialogEventFunc_RecycleUnitDialog(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 8 then
        exMessageAppendToMessageArea(Localization.get("skill_mode.player_choose.invalid_tech_player_name"))
        return
    end

    local dialogData = {
        DialogId = RECYCLE_UNIT_DIALOG_ID + g_PlayerNameToIndex[playerName],
        PlayerName = playerName,
        Choices = {},
    }

    local clickedUnitInfo = g_CurrentClickRecycleUnit[playerIndex]
    if clickedUnitInfo == nil then
        return
    end
    dialogData.Title = Localization.get("recycle.dialog.title", clickedUnitInfo.Name)

    dialogData.OnChoice = function(self, buttonIndex)
        if buttonIndex <= 4 then

            local previous = SetWorldBuilderThisPlayer(1)

            local playerIndex2 = g_PlayerNameToIndex[self.PlayerName]

            local recycleUnitInfo = g_CurrentClickRecycleUnit[playerIndex2]
            if recycleUnitInfo == nil then
                SetWorldBuilderThisPlayer(previous)
                return
            end
            local availableCount = GetRecycleUnitCount(playerIndex2, recycleUnitInfo)

            if availableCount > 0 then
                local count = g_RecycleUnitCount[buttonIndex];
                local leftCount = 0
                count, leftCount = RemoveRecycleUnitCount(playerIndex2, recycleUnitInfo, count)
                ExecuteAction('PLAYER_GIVE_MONEY', self.PlayerName, count * recycleUnitInfo.Money * GetRecycleRate(playerIndex2)) ;
                
                local msg = Localization.get("recycle.message", tostring(playerIndex2), count, recycleUnitInfo.Name, tostring(leftCount));
                if playerIndex2 >= 4 then
                    exAddTextToPublicBoardForPlayer("Player_4", msg, 5);
                    exAddTextToPublicBoardForPlayer("Player_5", msg, 5);
                    exAddTextToPublicBoardForPlayer("Player_6", msg, 5);
                else
                    exAddTextToPublicBoardForPlayer("Player_1", msg, 5);
                    exAddTextToPublicBoardForPlayer("Player_2", msg, 5);
                    exAddTextToPublicBoardForPlayer("Player_3", msg, 5);
                end
            end

            SetWorldBuilderThisPlayer(previous)
        end
    end

    tinsert(dialogData.Choices, Localization.get("recycle.choice.1"))
    tinsert(dialogData.Choices, Localization.get("recycle.choice.5"))
    tinsert(dialogData.Choices, Localization.get("recycle.choice.10"))
    tinsert(dialogData.Choices, Localization.get("recycle.choice.20"))
    tinsert(dialogData.Choices, Localization.get("recycle.choice.cancel"))
    ButtonChoiceDialogManager:ShowDialog(dialogData)
end