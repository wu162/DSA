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

g_VehicleInfantryAircraftFilter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="INFANTRY VEHICLE AIRCRAFT",
})

function onCenterTopBtnClickEvent(playerName, btnIndex)
    ButtonManager:OnClick(playerName, btnIndex)
end

function CenterTopBtnFunc_CreateInitialButtons(playerIndex)
    local playerName = "Player_" .. playerIndex
    local buttons = {}
    buttons[1] = CreateButton({
        PlayerName = playerName,
        PlayerIndex = playerIndex,
        ButtonIndex = 1,
        IconId = 'Button_Toggle_Power',
        Title = '请选择你的技能组',
        Description = '选择后可获得两个强力技能，请尽快选择',
        IsEnabled = true,
        IsHighlighted = true,
        OnClick = function(self)
            exShowCustomBtnChoiceDialogForPlayer(self.PlayerName, 1001, '选择你的技能组', '炸弹+达摩克利斯之剑', '铁幕+时停', '龙船+空军元帅', '补充军队+纳米维修', '退出(待会再选)', '', '')
            return true
        end
    })
    if EvaluateCondition("PLAYER_HAS_PLAYER_TECH", playerName, "PlayerTech_Allied") then
        buttons[3] = CreateChronosphereButton(playerIndex)
    elseif EvaluateCondition("PLAYER_HAS_PLAYER_TECH", playerName, "PlayerTech_Japan") then
        buttons[3] = CreateJapanShieldButton(playerIndex)
    elseif EvaluateCondition("PLAYER_HAS_PLAYER_TECH", playerName, "PlayerTech_Celestial") then
        buttons[3] = CreateCelestialMoraleButton(playerIndex)
    end
    buttons[4] = CreateButton({
        PlayerName = playerName,
        PlayerIndex = playerIndex,
        ButtonIndex = 4,
        IconId = 'Button_PlayerPower_FreeTrade',
        Title = '交易市场',
        Description = '购买理财项目或者定向转移资金',
        IsEnabled = true,
        OnClick = function(self)
            BtnChoiceDialogEventFunc_ShowNextMarketDialog(self.PlayerIndex)
            return true
        end
    })
    buttons[6] = CreateButton({
        PlayerName = playerName,
        PlayerIndex = playerIndex,
        ButtonIndex = 6,
        IconId = 'Allied_topmenu_infantry',
        Title = '投降',
        Description = '召开一次严肃的会议试图结束游戏',
        MaxUseCount = 1,
        SharedCooldownId = 'surrender',
        SharedCooldownSeconds = 3,
        IsEnabled = true,
        OnClick = function(self)
            local side, sideName, sideAiPlayer, sidePlayerIndexOffset = "devil", "恶魔", "PlyrCivilian", 0
            if self.PlayerIndex >= 4 then
                side, sideName, sideAiPlayer, sidePlayerIndexOffset = "angel", "天使", "PlyrCreeps", 3
            end
            setglobal(format("%s_surrender", side), 0)
            exEnableWBScript(format("%s/%s_surrender", sideAiPlayer, side))
            exAddTextToPublicBoard(format("%s$p%dName发起了投降", sideName, self.PlayerIndex), 10)
            local voteText = '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降'
            for i = 1, 3, 1 do
                local p = sidePlayerIndexOffset + i
                exShowLongTextDialogForPlayer(format("Player_%d", p), 200 + p, voteText, '投降', '弃权', '战斗')
            end
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
    else
        exMessageAppendToMessageArea("错误：CenterTopBtnFunc_CreatePlayerSkillButtons 的 kind 参数无效")
        return
    end
    for j = 1, 2 do
        if playerIndex <= 3 then
            for i = 1, 3 do
                exAddTextToPublicBoardForPlayer("Player_" .. i, format('$p%dName选择了' .. buttons[j].Title, playerIndex), 6)
            end
        else
            for i = 4, 6 do
                exAddTextToPublicBoardForPlayer("Player_" .. i, format('$p%dName选择了' .. buttons[j].Title, playerIndex), 6)
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
        Title = '局部毁灭武器',
        Description = '摧毁中间区域的所有敌方单位，无视铁幕效果',
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
        Title = '达摩克利斯之剑',
        Description = '请求太空的卫星对敌方启用15秒的精准卫星打击',
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
        Title = '铁幕演说',
        Description = '发表铁幕演说,让全体单位套上坚不可摧的铁幕，持续15秒',
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
        Title = '时空管理局',
        Description = '借助未来科技的力量时停对方单位13秒',
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
        Title = '龙行天下',
        Description = '召唤龙船(第5回合起可以使用)',
        UnlockedDescription = '召唤龙船于主巨炮位置\n第一次召唤1艘，第二次召唤2艘'
            .. '\n龙船出现得越迟，血量越高，第18回合后血量抵达上限\n冷却时间1回合',
        IsEnabled = false,
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
        buttonData.IsEnabled = true
        buttonData.Description = buttonData.UnlockedDescription
    else
        RoundLuaManager.DelayCallOnRoundBegin(function(self)
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
        Title = '空军元帅',
        Description = '请求超级苏霍伊群抵达战场对敌方的空军造成毁灭性的攻击',
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

function CreateNanoMaintainHiveButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 2,
        IconId = 'Button_JapanNanoMaintainHive',
        Title = '纳米维修',
        Description = '在前线防御塔周围生成3个纳米维修立场，治愈己方部队和前线防御塔（每经过12回合，同位置多叠加一个立场）并额外恢复防御塔 500+回合数平方*70 的血量',
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
        Title = '补充军队',
        Description = '立即触发一次生成陆地和空中部队(冷却70秒)',
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

function CreateChronosphereButton(playerIndex)
    local buttonData = {
        PlayerName = "Player_" .. playerIndex,
        PlayerIndex = playerIndex,
        ButtonIndex = 3,
        IconId = 'AUA_Aegis_Shield',
        Title = '超时空突袭',
        Description = '请建造盟军小超武「超时空传送仪」以解锁此按钮',
        UnlockedDescription = '打开时空裂缝让主战坦克突袭敌方后排并获得短暂的铁幕\n冷却时间三回合',
        IsEnabled = false,
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
        Title = '全体护盾',
        Description = '请激活帝国最高机密协议「机械化组装」以解锁此按钮',
        UnlockedDescription = '为所有己方载具套上纳米护盾\n冷却时间200秒',
        IsEnabled = false,
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
        Title = '士气提升',
        Description = '请建造神州小超武「日晷阵列」（止戈力场）以解锁此按钮',
        UnlockedDescription = '己方全体单位获得18秒的1.25倍移速和伤害加成\n冷却时间220秒',
        IsEnabled = false,
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
    local sideName = "恶魔"
    local sideScript = "KW"
    if playerIndex >= 4 then
        sideName = "天使"
        sideScript = "KB"
    end
    exMessageAppendToMessageArea(format("%s方使用了局部杀伤性武器！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "A01_CoastalGun_ImpactExplosion")
    exEnableWBScript(sideScript)
    return true
end

function RequestDamoclesSword(playerIndex)
    local sideName = "恶魔"
    local sideScript = "devil_nemesisplay"
    if playerIndex >= 4 then
        sideName = "天使"
        sideScript = "angel_nemesisplay"
    end
    exMessageAppendToMessageArea(format("%s方落下了达摩克利斯之剑！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "CelestialEnergyGatling_Select")
    exEnableWBScript(sideScript)
    return true
end

function RequestIronCurtain(playerIndex)
    local sideName = "恶魔"
    local referenceObject = T74
    if playerIndex >= 4 then
        sideName = "天使"
        referenceObject = T84
    end
    exMessageAppendToMessageArea(format("%s方发表了铁幕演说！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "SOV_IronCurtain_Cast")
    local units, count = ObjectFindObjects(referenceObject, nil, FilterALLUNIT)
    for i = 1, count, 1 do
        ObjectLoadAttributeModifier(units[i], "AttributeModifier_IronCurtain", 196)
    end
    return true
end

function RequestTimeStop(playerIndex)
    local sideName = "恶魔"
    local sideScript = "devilstop"
    if playerIndex >= 4 then
        sideName = "天使"
        sideScript = "angelstop"
    end
    exMessageAppendToMessageArea(format("%s方竟然让时间停止！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Off")
    exEnableWBScript(sideScript)
    return true
end

function RequestDragonShip(playerIndex, count)
    if count ~=1 and count ~= 2 then
        exMessageAppendToMessageArea("错误：龙船召唤失败，数量必须为1或2")
        return nil
    end
    local cutMCV = 5
    local counterValue = exCounterGetByName("lvc");
    if counterValue < cutMCV then
        exMessageAppendToMessageArea("龙船召唤失败，回合数不足！")
        return nil
    end

    local sideName = "恶魔"
    local sideAIPlayer = "PlyrCivilian"
    -- local mcvHealthScript = "MCVhealthD"
    local dragonshipAngle = "0"
    local tower = T74
    if playerIndex >= 4 then
        sideName = "天使"
        sideAIPlayer = "PlyrCreeps"
        -- mcvHealthScript = "MCVhealthA"
        dragonshipAngle = "180"
        tower = T84
    end
    local aiTeamName = sideAIPlayer .. '/ATTACK'

    exMessageAppendToMessageArea(format("%s方召唤了青龙核心战斗舰！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "CEL_DragonShip_VoicePack")
    local x1, y1, z1 = ObjectGetPosition(tower);
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
    local maxHealth = 6000 + max(round - 10, 0) * 3000
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
        exMessageAppendToMessageArea(format("龙船#%d 血量%d->%d", id, previousHp, currentHp))
    end
    return true
end

function RequestAirMarshal(playerIndex)
    local sideName = "恶魔"
    local sideScript = "devil_air"
    if playerIndex >= 4 then
        sideName = "天使"
        sideScript = "angel_air"
    end
    exMessageAppendToMessageArea(format("%s方请求了空军元帅！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "SOV_SukhoiInterceptor_VoiceAttack")
    ExecuteAction("PLAY_SOUND_EFFECT", "CEL_NukeIncoming")
    exEnableWBScript(sideScript)
    return true
end

function RequestNanoMaintainHive(playerIndex)
    local sideName = "恶魔"
    local sideAIPlayer = "PlyrCivilian"
    local tower = T74
    local positions = {
        { X = 3000, Y = 3104, Z = 210 },
        { X = 3080, Y = 2704, Z = 210 },
        { X = 3080, Y = 3504, Z = 210 }
    }
    local towers = {T71, T72, T73, T74}
    if playerIndex >= 4 then
        sideName = "天使"
        sideAIPlayer = "PlyrCreeps"
        tower = T84
        positions = {
            { X = 4030, Y = 3104, Z = 210 },
            { X = 3950, Y = 2704, Z = 210 },
            { X = 3950, Y = 3504, Z = 210 }
        }
        towers = {T81, T82, T83, T84}
    end

    exMessageAppendToMessageArea(format("%s方启动了纳米维修！", sideName))

    local round = exCounterGetByName("lvc")
    local iteration = floor(round / 12) + 1
    for i = 1, iteration, 1 do
        for j = 1, 3, 1 do
            ExecuteAction("CREATE_OBJECT", 'JapanNanoMaintainHive', sideAIPlayer .. "/team" .. sideAIPlayer, positions[j], 0)
        end
    end
    local healAmount = 500 + round * round * 70
    for i = 1, 4 do
        ExecuteAction("NAMED_DAMAGE", towers[i], -healAmount);
    end

    return true
end

function RequestSpawnArmyImmediately(playerIndex)
    local sideName = "恶魔"
    if playerIndex >= 4 then
        sideName = "天使"
    end
    exMessageAppendToMessageArea(format("%s方使用了补充军队！", sideName))
    if playerIndex <= 3 then
        SchedulerModule.delay_call(function()
            UNITSPST_left (1,step1,INFANTSP,INFANTTEAM,INFANTATTACK,INFANTSPCH)
            UNITSPST_left (step1+1,step2,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
            UNITSPST_left (step2+1,step3,HEAVYVEHSP,HEAVYVEHTEAM,HEAVYVEHATTACK,HEAVYVEHSPCH)
            UNITSPAIRST_left (step4+1,step5,INFANTSP,AIRTEAM,AIRATTACK,INFANTSPCH)
            SpawnGigaFortressAir_left()

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
    return true
end

function RequestChronosphere(playerIndex)
    if g_AlliedSuperWeaponBuilt[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(format("错误：玩家 %d 尚未建造超时空。", playerIndex))
        return false
    end
    local sideName = "恶魔"
    local sideScript = "PlyrCivilian/devilASuper"
    if playerIndex >= 4 then
        sideName = "天使"
        sideScript = "PlyrCreeps/angelASuper"
    end
    exMessageAppendToMessageArea(format("%s方使用了超时空突袭！", sideName))
    ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
    exEnableWBScript(sideScript)
    return true
end

function RequestJapanShield(playerIndex)
    if g_ProductionBonus_JapanGet[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(format("错误：玩家 %d 尚未获得帝国机械化组装协议。", playerIndex))
        return false
    end
    local sideName = "恶魔"
    local filterObj = T74
    if playerIndex >= 4 then
        sideName = "天使"
        filterObj = T84
    end
    
    exMessageAppendToMessageArea(format("%s $p%dName使用了由帝国机械化组装协议提供的纳米护盾！", sideName, playerIndex))
    local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleFilter)
    if count == 0 then
        exMessageAppendToMessageArea("错误：没有找到任何坦克单位，无法施加纳米护盾。")
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

function RequestCelestialMorale(playerIndex)
    if g_CelestialSuperWeapon_Get[playerIndex] ~= 1 then
        exMessageAppendToMessageArea(format("错误：玩家 %d 尚未获得止戈立场。", playerIndex))
        return false
    end
    local sideName = "恶魔"
    local filterObj = T74
    if playerIndex >= 4 then
        sideName = "天使"
        filterObj = T84
    end
    
    exMessageAppendToMessageArea(format("%s $p%dName使用了由止戈立场提供的全图士气提升技能！", sideName, playerIndex))
    local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleInfantryAircraftFilter)
    if count == 0 then
        exMessageAppendToMessageArea("错误：没有找到任何单位，无法施加士气提升。")
        return false
    end
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current, "AttributeMod_lightningTroop_Lv1", 270)
    end

    return true
end