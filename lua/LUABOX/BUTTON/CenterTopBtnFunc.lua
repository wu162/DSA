angel_money = 0
devil_money = 0
devil_surrender = 0
angel_surrender = 0

g_AlliedSuperWeaponBuilt = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

g_ProductionBonus_JapanGet = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

g_ProductionBonus_SovietGet = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

g_ProductionBonus_JapanWeaponEnable = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [4] = 1,
    [5] = 1,
    [6] = 1,
}

g_VehicleFilter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="VEHICLE",
})

g_MoneyBonusTargetFilter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="VEHICLE INFANTRY HUGE_VEHICLE",
    Exclude="IGNORE_IN_AI_HUNT_TACTIC DEBRIS SHIP"
})

g_CelestialSuperWeapon_Get = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

g_CelestialSuperWeapon_CelestialWeaponEnable = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [4] = 1,
    [5] = 1,
    [6] = 1,
}

g_angelButtonClickHistory = {}
g_evilButtonClickHistory = {}

g_CelestialEngineerRepairDroneIndex = 1;

g_VehicleInfantryAircraftFilter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="INFANTRY VEHICLE AIRCRAFT",
})

function onCenterTopBtnClickEvent(playerName, btnIndex)
    ButtonManager:OnClick(playerName, btnIndex)
end

g_AutoSurrender = {
    PlayerInitiallyPresent = { 0, 0, 0, 0, 0, 0 },
    PlayerNowDied = { 0, 0, 0, 0, 0, 0 },
    DidPlayerAutoSurrender = { 0, 0, 0, 0, 0, 0 },
}
function CenterTopBtnFunc_InitializeAutoSurrender()
    for i = 1, 6, 1 do
        local playerName = "Player_" .. i
        -- check if player has at least one structure
        local previous = SetWorldBuilderThisPlayer(1)
        local structures, count = CopyPlayerRegisteredObjectSet(playerName, "STRUCTURES")
        SetWorldBuilderThisPlayer(previous)
        if count > 0 then
            g_AutoSurrender.PlayerInitiallyPresent[i] = 1
        end
    end
    SchedulerModule.call_every_x_frame(function()
        for i = 1, 6, 1 do
            local playerName = "Player_" .. i
            local previous = SetWorldBuilderThisPlayer(1)
            local structures, count = CopyPlayerRegisteredObjectSet(playerName, "STRUCTURES")
            SetWorldBuilderThisPlayer(previous)
            if count == 0 and g_AutoSurrender.PlayerInitiallyPresent[i] == 1 then
                g_AutoSurrender.PlayerNowDied[i] = 1
                -- 自动发起一次投降
                if g_AutoSurrender.DidPlayerAutoSurrender[i] ~= 1 then
                    g_AutoSurrender.DidPlayerAutoSurrender[i] = 1
                    -- 但假如是游戏即将正常结束那就不投降了
                    -- 检查 PlyrCivilian 和 PlyrCreeps 里是否还有建筑
                    -- 如果没有了说明游戏即将结束了，就不投降了
                    -- 只有在它们都还有建筑的情况下才自动投降
                    local previous2 = SetWorldBuilderThisPlayer(1)
                    local civilianStructures, civilianStructureCount = CopyPlayerRegisteredObjectSet("PlyrCivilian", "STRUCTURES")
                    local creepStructures, creepStructureCount = CopyPlayerRegisteredObjectSet("PlyrCreeps", "STRUCTURES")
                    SetWorldBuilderThisPlayer(previous2)
                    if civilianStructureCount > 0 and creepStructureCount > 0 then
                        RequestSurrender(i, true)
                    end
                end
            end
        end
    end, 15, nil)
end

function RequestSurrender(playerIndex, isAutoSurrender)
    local side, sideName, sideAiPlayer, sidePlayerIndexOffset = "devil", Localization.get("side.devil"), "PlyrCivilian", 0
    if playerIndex >= 4 then
        side, sideName, sideAiPlayer, sidePlayerIndexOffset = "angel", Localization.get("side.angel"), "PlyrCreeps", 3
    end
    local globalVariableName = format("%s_surrender", side)
    setglobal(globalVariableName, 0)
    exEnableWBScript(format("%s/%s_surrender", sideAiPlayer, side))
    exAddTextToPublicBoard(Localization.get("surrender.public.start", sideName, playerIndex), 10)
    local voteText = Localization.get("surrender.vote_text")
    for i = 1, 3, 1 do
        local p = sidePlayerIndexOffset + i
        local targetPlayerName = format("Player_%d", p)
        exHideCustomBtnChoiceDialogForPlayer(targetPlayerName)
        exHideLongTextDialogForPlayer(targetPlayerName)
        exShowLongTextDialogForPlayer(targetPlayerName, 200 + p, voteText, Localization.get("surrender.choice.surrender"), Localization.get("surrender.choice.pass"), Localization.get("surrender.choice.fight"))
    end
    if isAutoSurrender then
        exAddTextToPublicBoard(Localization.get("surrender.public.auto", sideName, playerIndex), 30)
        setglobal(globalVariableName, getglobal(globalVariableName) + 1)
    end
    return true
end

function CenterTopBtnFunc_CreateInitialButtons(playerIndex)
    local playerName = "Player_" .. playerIndex
    local buttons = {}
    local preselectedPlayerSkillKind = g_PreselectedSkillIndices[playerIndex]
    if preselectedPlayerSkillKind ~= nil then
        CenterTopBtnFunc_CreatePlayerSkillButtons(playerIndex, preselectedPlayerSkillKind)
    else
        buttons[1] = CreateButton({
            PlayerName = playerName,
            PlayerIndex = playerIndex,
            ButtonIndex = 1,
            IconId = 'Button_Toggle_Power',
            Title = Localization.get("button.choose_skill.title"),
            Description = Localization.get("button.choose_skill.description"),
            IsEnabled = true,
            IsHighlighted = true,
            OnClick = function(self)
                BtnChoiceDialogEventFunc_ShowPlayerChooseSkillDialog(self.PlayerName)
                return true
            end
        })
    end
    if g_PlayerSide[playerIndex] == 1 then
        buttons[3] = CreateChronosphereButton(playerIndex)
    elseif g_PlayerSide[playerIndex] == 3 then
        buttons[3] = CreateJapanShieldButton(playerIndex)
    elseif g_PlayerSide[playerIndex] == 4 then
        buttons[3] = CreateCelestialMoraleButton(playerIndex)
    end
    buttons[4] = CreateButton({
        PlayerName = playerName,
        PlayerIndex = playerIndex,
        ButtonIndex = 4,
        IconId = 'Button_PlayerPower_FreeTrade',
        Title = Localization.get("button.market.title"),
        Description = Localization.get("button.market.description"),
        IsEnabled = true,
        OnClick = function(self)
            BtnChoiceDialogEventFunc_ShowMarketDialog(self.PlayerIndex)
            return true
        end
    })
    buttons[6] = CreateButton({
        PlayerName = playerName,
        PlayerIndex = playerIndex,
        ButtonIndex = 6,
        IconId = 'Allied_topmenu_communicator',
        Title = Localization.get("button.surrender.title"),
        Description = Localization.get("button.surrender.description"),
        MaxUseCount = 1,
        SharedCooldownId = 'surrender',
        SharedCooldownSeconds = 3,
        IsEnabled = true,
        OnClick = function(self)
            RequestSurrender(self.PlayerIndex, false)
            return true
        end
    })
    
    for i = 1, 6, 1 do
        local button = buttons[i]
        if button then
            ButtonManager:SetButton(button)
        end
    end
end

function CenterTopBtnFunc_CreatePlayerSkillButtons(playerIndex, kind)
    local buttons = {}
    if kind == 1 then
        buttons[1] = CreateDestructionButton(playerIndex)
        buttons[2] = CreateDamoclesSwordButton(playerIndex)
    elseif kind == 2 then
        buttons[1] = CreateIronCurtainButton(playerIndex)
        buttons[2] = CreateTimeStopButton(playerIndex)
    elseif kind == 3 then
        buttons[1] = CreateDragonshipButton(playerIndex)
        buttons[2] = CreateAirMarshalButton(playerIndex)
    elseif kind == 4 then
        buttons[1] = CreateSpawnArmyImmediatelyButton(playerIndex)
        buttons[2] = CreateNanoMaintainHiveButton(playerIndex)
    elseif kind == 5 then
        buttons[1] = CreateRepeatEnemySpecialPowerButton(playerIndex)
        buttons[2] = CreateRepeatSelfSpecialPowerButton(playerIndex)
    else
        exMessageAppendToMessageArea(Localization.get("error.invalid_kind"))
        return
    end
    for j = 1, 2 do
        if playerIndex <= 3 then
            for i = 1, 3 do
                exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("button.skill_selected", playerIndex, buttons[j].Title), 8)
            end
        else
            for i = 4, 6 do
                exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("button.skill_selected", playerIndex, buttons[j].Title), 8)
            end
        end
    end

    ButtonManager:SetButton(buttons[1])
    ButtonManager:SetButton(buttons[2])
end

function CenterTopBtnFunc_UpdatePlayer3rdButton(playerIndex)
    local playerName = "Player_" .. playerIndex
    local button = nil
    if g_ProductionBonus_JapanGet[playerIndex] == 1 then
        button = CreateJapanShieldButton(playerIndex)
    elseif g_CelestialSuperWeapon_Get[playerIndex] == 1 then
        button = CreateCelestialMoraleButton(playerIndex)
    elseif g_AlliedSuperWeaponBuilt[playerIndex] == 1 then
        button = CreateChronosphereButton(playerIndex)
    end
    if button then
        button.Description = button.UnlockedDescription
        button.IsLocked = false
        button.IsEnabled = true
        button:FormatText()
        ButtonManager:SetButton(button)
    end
end

function CreateDestructionButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'Button_SovietTeslaMissile',
        Title = Localization.get("button.destruction.title"),
        Description = Localization.get("button.destruction.description"),
        IsEnabled = true,
        MaxUseCount = 1,
        SharedCooldownId = "destruction",
        SharedCooldownSeconds = 5,
        OnClick = function(self)
            return RequestDestruction(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateDamoclesSwordButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'Button_CelestialPantaOrbitalStrike',
        Title = Localization.get("button.damocles.title"),
        Description = Localization.get("button.damocles.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 10,
        SharedCooldownId = "damoclessword",
        SharedCooldownSeconds = 10,
        OnClick = function(self)
            return RequestDamoclesSword(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateIronCurtainButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'Button_PlayerPower_IronCurtain',
        Title = Localization.get("button.iron_curtain.title"),
        Description = Localization.get("button.iron_curtain.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 10,
        SharedCooldownId = "ironcurtain",
        SharedCooldownSeconds = 10,
        OnClick = function(self)
            return RequestIronCurtain(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateTimeStopButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'AUA_Timebelt',
        Title = Localization.get("button.time_stop.title"),
        Description = Localization.get("button.time_stop.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 10,
        SharedCooldownId = "timestop",
        SharedCooldownSeconds = 10,
        OnClick = function(self)
            return RequestTimeStop(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateDragonshipButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'CEL_DragonShipLand',
        Title = Localization.get("button.dragonship.title"),
        Description = Localization.get("button.dragonship.description"),
        UnlockedDescription = Localization.get("button.dragonship.unlocked_description"),
        IsLocked = true,
        MaxUseCount = 2,
        CooldownRounds = 1,
        SharedCooldownId = "dragonship",
        SharedCooldownSeconds = 5,
        DragonshipNumber = 1,
        OnClick = function(self)
            if RequestDragonShip(self.PlayerIndex, self.DragonshipNumber) then
                self.DragonshipNumber = 2
                return true
            end
            return nil
        end,
    }
    local round = exCounterGetByName("lvc")
    if round >= 5 then
        buttonData.IsLocked = false
        buttonData.IsEnabled = true
        buttonData.Description = buttonData.UnlockedDescription
    else
        RoundLuaManager.DelayCallOnRoundBegin(function(self)
            self.IsLocked = false
            self.IsEnabled = true
            self.Description = self.UnlockedDescription
            self:FormatText()
            ButtonManager:SetButton(self)
        end, { buttonData }, 5 - round)
    end
    return CreateButton(buttonData)
end

function CreateAirMarshalButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'Button_SovietInterceptorAircraft',
        Title = Localization.get("button.air_marshal.title"),
        Description = Localization.get("button.air_marshal.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 10,
        SharedCooldownId = "airmarshal",
        SharedCooldownSeconds = 10,
        OnClick = function(self)
            return RequestAirMarshal(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateRepeatSelfSpecialPowerButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'CelestialPowerPlantDetection',
        Title = Localization.get("center_top.copy_our_skill.title"),
        Description = Localization.get("center_top.copy_our_skill.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 30,
        SharedCooldownId = "repeatselfspecialpower",
        SharedCooldownSeconds = 10,
        DragonshipNumber = 1,
        OnClick = function(self)
            return RequestRepeatSelfSpecialPower(self.PlayerIndex, self)
        end,
    }
    return CreateButton(buttonData)
end

function CreateRepeatEnemySpecialPowerButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'CelestialSonarOn',
        Title = Localization.get("center_top.copy_enemy_skill.title"),
        Description = Localization.get("center_top.copy_enemy_skill.description"),
        IsEnabled = true,
        MaxUseCount = 1,
        CooldownSeconds = 30,
        SharedCooldownId = "repeatenemyspecialpower",
        SharedCooldownSeconds = 10,
        DragonshipNumber = 1,
        OnClick = function(self)
            return RequestRepeatEnemySpecialPower(self.PlayerIndex, self)
        end,
    }
    return CreateButton(buttonData)
end

--function CreateBuyOverButton(playerIndex)
--    local buttonData = {
--        PlayerName = "Player_" .. playerIndex,
--        PlayerIndex = playerIndex,
--        ButtonIndex = 1,
--        IconId = 'Button_AlliedInfiltrationInfantry_on',
--        Title = '策反',
--        Description = '策反中间区域附近的陆军和空军',
--        IsEnabled = true,
--        MaxUseCount = 1,
--        SharedCooldownId = "buyover",
--        SharedCooldownSeconds = 10,
--        OnClick = function(self)
--            return RequestBuyOver(self.PlayerIndex)
--        end,
--    }
--    return CreateButton(buttonData)
--end

function CreateNanoMaintainHiveButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'Button_JapanNanoMaintainHive',
        Title = Localization.get("center_top.nano_repair.title"),
        Description = Localization.get("center_top.nano_repair.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 10,
        SharedCooldownId = "namomaintainhive",
        SharedCooldownSeconds = 10,
        OnClick = function(self)
            return RequestNanoMaintainHive(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

-- 立即再次生成一次军队
function CreateSpawnArmyImmediatelyButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'Button_JapanKamikazeTeammate',
        Title = Localization.get("center_top.reinforce_army.title"),
        Description = Localization.get("center_top.reinforce_army.description"),
        IsEnabled = true,
        MaxUseCount = 2,
        CooldownSeconds = 70,
        SharedCooldownId = "SpawnArmyImmediately",
        SharedCooldownSeconds = 70,
        OnClick = function(self)
            return RequestSpawnArmyImmediately(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateCashBonusButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'AUA_Bribe',
        Title = Localization.get("center_top.kill_reward.title"),
        Description = Localization.get("center_top.kill_reward.description"),
        IsEnabled = true,
        MaxUseCount = 1,
        CooldownSeconds = 70,
        SharedCooldownId = "cashbonus",
        SharedCooldownSeconds = 70,
        OnClick = function(self)
            return RequestCashBonus(self.PlayerIndex)
        end,
    }
    return CreateButton(buttonData)
end

function CreateChronosphereButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 3,
        IconId = 'AUA_Aegis_Shield',
        Title = Localization.get("center_top.temporal_raid.title"),
        Description = Localization.get("center_top.temporal_raid.description"),
        UnlockedDescription = Localization.get("center_top.temporal_raid.unlocked_description"),
        IsLocked = true,
        MaxUseCount = nil, -- 没有限制
        CooldownRounds = 3,
        SharedCooldownId = "alliedsuperweapon",
        SharedCooldownSeconds = 2,
        OnClick = function(self)
            return RequestChronosphere(self.PlayerIndex)
        end
    }
    return CreateButton(buttonData)
end

function CreateJapanShieldButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 3,
        IconId = 'Button_PlayerPower_PointDefenseDrones',
        Title = Localization.get("center_top.japan_shield.title"),
        Description = Localization.get("center_top.japan_shield.description"),
        UnlockedDescription = Localization.get("center_top.japan_shield.unlocked_description"),
        IsLocked = true,
        MaxUseCount = nil, -- 没有限制
        CooldownSeconds = 200,
        SharedCooldownId = "japanshield",
        SharedCooldownSeconds = 5,
        OnClick = function(self)
            return RequestJapanShield(self.PlayerIndex)
        end
    }
    return CreateButton(buttonData)
end

function CreateCelestialMoraleButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 3,
        IconId = 'CelestialLightningTroop_Lv3',
        Title = Localization.get("center_top.morale_boost.title"),
        Description = Localization.get("center_top.morale_boost.description"),
        UnlockedDescription = Localization.get("center_top.morale_boost.unlocked_description"),
        IsLocked = true,
        MaxUseCount = nil, -- 没有限制
        CooldownSeconds = 220,
        SharedCooldownId = "celestialmorale",
        SharedCooldownSeconds = 5,
        OnClick = function(self)
            return RequestCelestialMorale(self.PlayerIndex)
        end
    }
    return CreateButton(buttonData)
end

function RequestDestruction(playerIndex)
    local sideName = Localization.get("side.devil")
    local sideScript = "KW"
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideScript = "KB"
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.local_destruction", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "A01_CoastalGun_ImpactExplosion")
    exEnableWBScript(sideScript)
    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestDestruction)
    else
        tinsert(g_angelButtonClickHistory, RequestDestruction)
    end
    return true
end

function RequestBuyOver(playerIndex)
    local sideName = Localization.get("side.devil")
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.bribe", sideName))
    --ExecuteAction("PLAY_SOUND_EFFECT", "A01_CoastalGun_ImpactExplosion")

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestDestruction)
    else
        tinsert(g_angelButtonClickHistory, RequestDestruction)
    end
    return true
end

function RequestDamoclesSword(playerIndex)
    local sideName = Localization.get("side.devil")
    local sideScript = "devil_nemesisplay"
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideScript = "angel_nemesisplay"
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.damocles_struck", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "CelestialEnergyGatling_Select")
    exEnableWBScript(sideScript)
    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestDamoclesSword)
    else
        tinsert(g_angelButtonClickHistory, RequestDamoclesSword)
    end
    return true
end

function RequestIronCurtain(playerIndex)
    local sideName = Localization.get("side.devil")
    local referenceObject = T74
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        referenceObject = T84
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.iron_curtain_speech", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "SOV_IronCurtain_Cast")
    local units, count = ObjectFindObjects(referenceObject, nil, FilterALLUNIT)
    for i = 1, count, 1 do
        ObjectLoadAttributeModifier(units[i], "AttributeModifier_IronCurtain", 196)
    end
    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestIronCurtain)
    else
        tinsert(g_angelButtonClickHistory, RequestIronCurtain)
    end
    return true
end

function RequestTimeStop(playerIndex)
    local sideName = Localization.get("side.devil")
    local sideScript = "devilstop"
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideScript = "angelstop"
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.time_stop", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Off")
    exEnableWBScript(sideScript)
    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestTimeStop)
    else
        tinsert(g_angelButtonClickHistory, RequestTimeStop)
    end
    return true
end

function RequestDragonShip(playerIndex, count)
    if count ~=1 and count ~= 2 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.dragonship_invalid_number"))
        return nil
    end
    local cutMCV = 5
    local counterValue = exCounterGetByName("lvc");
    if counterValue < cutMCV then
        exMessageAppendToMessageArea(Localization.get("center_top.error.dragonship_round_insufficient"))
        return nil
    end

    local sideName = Localization.get("side.devil")
    local sideAIPlayer = "PlyrCivilian"
    -- local mcvHealthScript = "MCVhealthD"
    local dragonshipAngle = "0"
    local waypoint = "TD7"
    local tower = T74
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideAIPlayer = "PlyrCreeps"
        -- mcvHealthScript = "MCVhealthA"
        dragonshipAngle = "180"
        waypoint = "TD8"
        tower = T84
    end
    local aiTeamName = sideAIPlayer .. '/ATTACK'

    exMessageAppendToMessageArea(Localization.get("center_top.used.dragon_core_called", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "CEL_DragonShip_VoicePack")
    local pos = exWaypointGetPos(waypoint)
    local x1 = pos[1];
    local y1 = pos[2];
    local z1 = pos[3];
    local positions = {
        { X = x1, Y = y1, Z = z1 },
    }
    if count == 2 then
        positions[1].Y = y1 - 150
        positions[2] = { X = x1, Y = y1 + 100, Z = z1 }
    end

    for j = 1, count, 1 do
        ExecuteAction("CREATE_OBJECT", 'CelestialMCV', aiTeamName, positions[j], dragonshipAngle)
    end
    -- exEnableWBScript(mcvHealthScript)
    local round = exCounterGetByName("lvc")
    if round > 18 then
        round = 18
    end
    local maxHealth = 8000 + max(round - 10, 0) * 3000
    local dragonships, dragonshipCount = ObjectFindObjects(tower, nil, CelestialMCV)
    for i = 1, count do
        local index = dragonshipCount - count + i
        local dragonship = dragonships[index]
        local id = ObjectGetId(dragonship)
        local str = "UnitStrRef" .. id
        local previousHp = ObjectGetCurrentHealth(dragonship)
        ExecuteAction("SET_UNIT_REFERENCE", str, dragonship)
        ExecuteAction("NAMED_SET_MAX_HEALTH", str, maxHealth, 'true')
        local currentHp = ObjectGetCurrentHealth(dragonship)
        exMessageAppendToMessageArea(Localization.get("center_top.dragonship.hp_change", id, previousHp, currentHp))
    end

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestDragonShip)
    else
        tinsert(g_angelButtonClickHistory, RequestDragonShip)
    end
    return true
end

function RequestAirMarshal(playerIndex)
    local sideName = Localization.get("side.devil")
    local sideScript = "devil_air"
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideScript = "angel_air"
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.air_marshal", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "SOV_SukhoiInterceptor_VoiceAttack")
    ExecuteAction("PLAY_SOUND_EFFECT", "CEL_NukeIncoming")
    exEnableWBScript(sideScript)

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestAirMarshal)
    else
        tinsert(g_angelButtonClickHistory, RequestAirMarshal)
    end
    return true
end

function RequestNanoMaintainHive(playerIndex)
    local sideName = Localization.get("side.devil")
    local sideAIPlayer = "PlyrCivilian"
    local tower = T74
    local positions = { X = 3000, Y = 3104, Z = 210 }
    local position2 = {
        { X = 3200, Y = 3200, Z = 210 },
        { X = 3200, Y = 3000, Z = 210 },
        { X = 3200, Y = 3300, Z = 210 },
        { X = 3200, Y = 2900, Z = 210 },
    }
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideAIPlayer = "PlyrCreeps"
        tower = T84
        positions = { X = 4030, Y = 3104, Z = 210 }
        position2 = {
            { X = 3830, Y = 3200, Z = 210 },
            { X = 3830, Y = 3000, Z = 210 },
            { X = 3830, Y = 3300, Z = 210 },
            { X = 3830, Y = 2900, Z = 210 },
        }
    end

    exMessageAppendToMessageArea(Localization.get("center_top.used.nano_repair", sideName))

    ExecuteAction("CREATE_OBJECT", 'JapanNanoMaintainHive', sideAIPlayer .. "/team" .. sideAIPlayer, positions, 0)
    for j = 1, 4, 1 do
        g_CelestialEngineerRepairDroneIndex = g_CelestialEngineerRepairDroneIndex + 1;
        ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "CelestialEngineerRepairDroneLv3" .. tostring(g_CelestialEngineerRepairDroneIndex),
                "CelestialEngineerRepairDroneLv3",
                sideAIPlayer .. "/team" .. sideAIPlayer, position2[j], 0)
        local object = GetObjectByScriptName("CelestialEngineerRepairDroneLv3" .. tostring(g_CelestialEngineerRepairDroneIndex))
        SchedulerModule.delay_call(function(objectId)
            ExecuteAction("NAMED_DELETE", GetObjectById(objectId))
        end, 450, {ObjectGetId(object)})
    end

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestNanoMaintainHive)
    else
        tinsert(g_angelButtonClickHistory, RequestNanoMaintainHive)
    end
    return true
end

function RequestRepeatSelfSpecialPower(playerIndex, self)
    local sideName = Localization.get("side.devil")
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
    end
    local destPowerFunc = nil;
    local history = g_evilButtonClickHistory;
    if playerIndex >= 4 then
        history = g_angelButtonClickHistory;
    end
    if getn(history) == 0 then
        exAddTextToPublicBoardForPlayer("Player_" .. playerIndex, Localization.get("center_top.error.no_skill_to_copy"), 8)
        return false;
    end
    for i = getn(history), 1, -1 do
        if history[i] ~= RequestRepeatSelfSpecialPower then
            destPowerFunc = history[i];
            break;
        end
    end

    if destPowerFunc ~= nil then
        exMessageAppendToMessageArea(Localization.get("center_top.used.copy_our_skill", sideName))
        if destPowerFunc == RequestDragonShip then
            if RequestDragonShip(self.PlayerIndex, self.DragonshipNumber) then
                self.DragonshipNumber = 2
                return true
            end
            return nil
        else
            return destPowerFunc(playerIndex)
        end

    else
                        exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("center_top.error.no_suitable_skill"), 8)
        return false;
    end

end

function RequestRepeatEnemySpecialPower(playerIndex, self)
    local sideName = Localization.get("side.devil")
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
    end
    local destPowerFunc = nil;
    local history = g_angelButtonClickHistory;
    if playerIndex >= 4 then
        history = g_evilButtonClickHistory;
    end
    if getn(history) == 0 then
        exAddTextToPublicBoardForPlayer("Player_" .. playerIndex, Localization.get("center_top.error.enemy_no_skill_to_copy"), 8)
        return false;
    end
    for i = getn(history), 1, -1 do
        if history[i] ~= RequestRepeatSelfSpecialPower then
            destPowerFunc = history[i];
            break;
        end
    end

    if destPowerFunc ~= nil then
        exMessageAppendToMessageArea(Localization.get("center_top.used.copy_enemy_skill", sideName))
        if destPowerFunc == RequestDragonShip then
            if RequestDragonShip(self.PlayerIndex, self.DragonshipNumber) then
                self.DragonshipNumber = 2
                return true
            end
            return nil
        else
            return destPowerFunc(playerIndex)
        end

    else
        exAddTextToPublicBoardForPlayer("Player_" .. i, Localization.get("center_top.error.no_suitable_skill"), 8)
        return false;
    end

end

function RequestSpawnArmyImmediately(playerIndex)
    local sideName = Localization.get("side.devil")
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.reinforce_army", sideName))
    if playerIndex <= 3 then
        SchedulerModule.delay_call(function()
            UNITSPST_left (1,step1,INFANTSP,INFANTTEAM,INFANTATTACK,INFANTSPCH)
            UNITSPST_left (step1+1,step2,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
            UNITSPST_left (step2+1,step3,HEAVYVEHSP,HEAVYVEHTEAM,HEAVYVEHATTACK,HEAVYVEHSPCH)
            UNITSPAIRST_left (step4+1,step5,INFANTSP,AIRTEAM,AIRATTACK,INFANTSPCH)
            SpawnGigaFortressAir_left()
            SpawnLandUnit_left()

            exEnableWBScript('SHIPNOCOACT')
            exEnableWBScript('PlyrCivilian/attackHEAVYVEHVEH__7')
            exEnableWBScript('PlyrCivilian/attackINFANT__7')
            exEnableWBScript('PlyrCivilian/attackLIGHTVEH__7')
            exEnableWBScript('BUFFACTONCE')
            exEnableWBScript('ShrinkMode_Trigger')

            UNITSPAIRST_left (step3+1,step35,LIGHTVEHSP,AIRTEAM,AIRATTACK,LIGHTVEHSPCH)
            UNITSPST_left (step5+1,step6,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
            exEnableWBScript('PlyrCivilian/attackAIR__7')
            exEnableWBScript('BUFFACTONCE__AIR')
        end, 5)
    else
        SchedulerModule.delay_call(function()
            UNITSPST_right (1,step1,INFANTSP,INFANTTEAM,INFANTATTACK,INFANTSPCH)
            UNITSPST_right (step1+1,step2,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
            UNITSPST_right (step2+1,step3,HEAVYVEHSP,HEAVYVEHTEAM,HEAVYVEHATTACK,HEAVYVEHSPCH)
            UNITSPAIRST_right (step4+1,step5,INFANTSP,AIRTEAM,AIRATTACK,INFANTSPCH)
            SpawnGigaFortressAir_right()
            SpawnLandUnit_right()

            exEnableWBScript('SHIPNOCOACT')
            exEnableWBScript('PlyrCreeps/attackHEAVYVEHVEH__8')
            exEnableWBScript('PlyrCreeps/attackINFANT__8')
            exEnableWBScript('PlyrCreeps/attackLIGHTVEH__8')
            exEnableWBScript('BUFFACTONCE')
            exEnableWBScript('ShrinkMode_Trigger')

            UNITSPAIRST_right (step3+1,step35,LIGHTVEHSP,AIRTEAM,AIRATTACK,LIGHTVEHSPCH)
            UNITSPST_right (step5+1,step6,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
            exEnableWBScript('PlyrCreeps/attackAIR__8')
            exEnableWBScript('BUFFACTONCE__AIR')
        end, 5)
    end

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestSpawnArmyImmediately)
    else
        tinsert(g_angelButtonClickHistory, RequestSpawnArmyImmediately)
    end
    return true
end

function RequestChronosphere(playerIndex)
    if g_AlliedSuperWeaponBuilt[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.player_not_built_chronosphere", playerIndex))
        return false
    end
    local sideName = Localization.get("side.devil")
    local sideScript = "PlyrCivilian/devilASuper"
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        sideScript = "PlyrCreeps/angelASuper"
    end
    exMessageAppendToMessageArea(Localization.get("center_top.used.temporal_raid", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
    exEnableWBScript(sideScript)
    return true
end

function RequestJapanShield(playerIndex)
    if g_ProductionBonus_JapanGet[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.player_not_emp_mech_protocol", playerIndex))
        return false
    end
    local sideName = Localization.get("side.devil")
    local filterObj = T74
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        filterObj = T84
    end
    
    exMessageAppendToMessageArea(Localization.get("center_top.used.emp_nano_shield", sideName, playerIndex))
    local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleFilter)
    if count == 0 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.no_tank_found"))
        return false
    end
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        local x, y, z = ObjectGetPosition(current)
        ObjectCreateAndFireTempWeaponToTarget(filterObj, "PlayerPowerPointDefenseDronesWeapon_Individual", {
            X = x, Y = y, Z = z
        }, current)
    end

    return true
end

function RequestCashBonus(playerIndex)
    local sideName = Localization.get("side.devil")
    local filterObj = T84
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        filterObj = T74
    end

    exMessageAppendToMessageArea(Localization.get("center_top.used.kill_reward", sideName))
    local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_MoneyBonusTargetFilter)
    if count == 0 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.no_land_unit_found"))
        return false
    end
    local fireObject = GetObjectByScriptName("wan" .. tostring(playerIndex))
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        local x, y, z = ObjectGetPosition(current)
        ObjectCreateAndFireTempWeaponToTarget(fireObject, "PlayerPowerProductionKickbacksWeapon_Individual", {
            X = x, Y = y, Z = z
        }, current)
    end

    if playerIndex <= 3 then
        tinsert(g_evilButtonClickHistory, RequestCashBonus)
    else
        tinsert(g_angelButtonClickHistory, RequestCashBonus)
    end
    return true
end

function RequestCelestialMorale(playerIndex)
    if g_CelestialSuperWeapon_Get[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.player_not_obtained_morale", playerIndex))
        return false
    end
    local sideName = Localization.get("side.devil")
    local filterObj = T74
    if playerIndex >= 4 then
        sideName = Localization.get("side.angel")
        filterObj = T84
    end
    
    exMessageAppendToMessageArea(Localization.get("center_top.used.global_morale", sideName, playerIndex))
    local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleInfantryAircraftFilter)
    if count == 0 then
        exMessageAppendToMessageArea(Localization.get("center_top.error.no_unit_found"))
        return false
    end
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current, "AttributeMod_lightningTroop_Lv1", 270)
    end

    return true
end
