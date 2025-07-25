Player1CD1 = 0
Player2CD1 = 0
Player3CD1 = 0
Player4CD1 = 0
Player5CD1 = 0
Player6CD1 = 0
Player1CD3 = 0
Player2CD3 = 0
Player3CD3 = 0
Player4CD3 = 0
Player5CD3 = 0
Player6CD3 = 0
Player1CD2 = 0
Player2CD2 = 0
Player3CD2 = 0
Player4CD2 = 0
Player5CD2 = 0
Player6CD2 = 0
Player1CD5 = 0
Player2CD5 = 0
Player3CD5 = 0
Player4CD5 = 0
Player5CD5 = 0
Player6CD5 = 0
Player1CD6 = 0
Player2CD6 = 0
Player3CD6 = 0
Player4CD6 = 0
Player5CD6 = 0
Player6CD6 = 0
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

-- 避免连着点两下
g_CenterTopButtonClickCooldown = {
    ['Player_1'] = {},
    ['Player_2'] = {},
    ['Player_3'] = {},
    ['Player_4'] = {},
    ['Player_5'] = {},
    ['Player_6'] = {},
}

function onCenterTopBtnClickEvent(playerName, btnIndex)

    -- 先处理一下按钮冷却
    if g_CenterTopButtonClickCooldown[playerName] == nil then
        g_CenterTopButtonClickCooldown[playerName] = {}
    end
    if g_CenterTopButtonClickCooldown[playerName][btnIndex] then
        -- 假如之前请求了按钮冷却、并且按钮依然正在冷却中，直接返回
        return
    end

    local cutMCV = 3

    local debtStr = "";
    if g_PlayerDebtCount[playerName] == 0 then
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        debtStr = "向银行贷款 " .. debtMoney .. '\n(将会3分钟无收入)';
    end

    if playerName == "Player_" .. 3 and btnIndex == 1 and Player3CD1 == 0 then
        local counterValue = exCounterGetByName("lvc");
        if counterValue > cutMCV then
            exMessageAppendToMessageArea("恶魔方召唤了青龙核心战斗舰！")
            ExecuteAction("PLAY_SOUND_EFFECT", "CEL_DragonShip_VoicePack")
            local x1, y1, z1 = ObjectGetPosition(T74);
            local sign = 1
            local deltay = 100
            local realy = 0
            for j = 1, counterValue - cutMCV, 1 do
                if j <= 3 then
                    --exMessageAppendToMessageArea("龙船数量："..i)
                    sign = (sign) * (-1)
                    deltay = deltay * (-1)
                    realy = (realy + deltay) * sign
                    ExecuteAction("CREATE_OBJECT", 'CelestialMCV', 'PlyrCivilian/ATTACK', { X = x1, Y = y1 + realy, Z = z1 }, "0")
                end
                exEnableWBScript("MCVhealthD");
            end    
            Player3CD1 = 1
            exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
            exCenterTopBtnShowForPlayer(playerName, 1, 'CEL_DragonShipLand', '龙行天下\n召唤回合数减三的龙船数量于主巨炮位置,上限不得超过三艘(已使用)')
        end
    end
    if playerName == "Player_" .. 1 and btnIndex == 1 and Player1CD1 == 0 then
        exMessageAppendToMessageArea("恶魔方使用了局部杀伤性武器！")
        ExecuteAction("PLAY_SOUND_EFFECT", "A01_CoastalGun_ImpactExplosion")
        exEnableWBScript("KW");
        Player1CD1 = 1
        exCenterTopBtnSetEnableForPlayer(playerName, 1, 0)
        exCenterTopBtnShowForPlayer(playerName, 1, 'Button_SovietTeslaMissile', '局部毁灭武器\n摧毁一大片地区的所有敌方单位(已使用)')
    end
    if playerName == "Player_" .. 2 and btnIndex == 1 and Player2CD1 < 2 then
        exMessageAppendToMessageArea("恶魔方发表了铁幕演说！")
        Player2CD1 = Player2CD1 + 1
        ExecuteAction("PLAY_SOUND_EFFECT", "SOV_IronCurtain_Cast")
        local TAR, count = ObjectFindObjects(P[7], nil, FilterALLUNIT)
        for j = 1, count, 1 do
            ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
        end
        exCenterTopBtnSetEnableForPlayer(playerName, 1, 0) -- 先禁用（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown[playerName][1] = true
        if Player2CD1 >= 2 then
            exCenterTopBtnShowForPlayer(playerName, 1, 'Button_PlayerPower_IronCurtain', '铁幕演说\n进行铁幕演说,让全体单位套上坚不可摧的铁幕，持续15秒(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player2CD1 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 6 and btnIndex == 1 and Player6CD1 == 0 then
        local counterValue = exCounterGetByName("lvc");
        if counterValue > cutMCV then
            exMessageAppendToMessageArea("天使方召唤了青龙核心战斗舰！")
            ExecuteAction("PLAY_SOUND_EFFECT", "CEL_DragonShip_VoicePack")
            local x1, y1, z1 = ObjectGetPosition(T84);
            local sign = 1
            local deltay = 100
            local realy = 0
            for j = 1, counterValue - cutMCV, 1 do
                if j <= 3 then
                    sign = (sign) * (-1)
                    deltay = deltay * (-1)
                    realy = (realy + deltay) * sign
                    ExecuteAction("CREATE_OBJECT", 'CelestialMCV', 'PlyrCreeps/ATTACK', { X = x1, Y = y1 + realy, Z = z1 }, "180")
                end
                exEnableWBScript("MCVhealthA");
            end
            Player6CD1 = 1
            exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
            exCenterTopBtnShowForPlayer(playerName, 1, 'CEL_DragonShipLand', '龙行天下\n召唤回合数减三的龙船数量于主巨炮位置,上限不得超过三艘(已使用)')
        end
    end
    if playerName == "Player_" .. 4 and btnIndex == 1 and Player4CD1 == 0 then
        exMessageAppendToMessageArea("天使方使用了局部杀伤性武器！")
        ExecuteAction("PLAY_SOUND_EFFECT", "A01_CoastalGun_ImpactExplosion")
        exEnableWBScript("KB");
        Player4CD1 = 1
        exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
        exCenterTopBtnShowForPlayer(playerName, 1, 'Button_SovietTeslaMissile', '局部毁灭武器\n摧毁一大片地区的所有敌方单位(已使用)')
    end
    if playerName == "Player_" .. 5 and btnIndex == 1 and Player5CD1 < 2 then
        exMessageAppendToMessageArea("天使方发表了铁幕演说！")
        Player5CD1 = Player5CD1 + 1
        ExecuteAction("PLAY_SOUND_EFFECT", "SOV_IronCurtain_Cast")
        local TAR, count = ObjectFindObjects(P[8], nil, FilterALLUNIT)
        for j = 1, count, 1 do
            ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
        end
        exCenterTopBtnSetEnableForPlayer(playerName, 1, 0) -- 先禁用（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown[playerName][1] = true
        if Player5CD1 >= 2 then
            exCenterTopBtnShowForPlayer(playerName, 1, 'Button_PlayerPower_IronCurtain', '铁幕演说\n进行铁幕演说,让全体单位套上坚不可摧的铁幕，持续15秒(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player5CD1 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 1 and btnIndex == 3 and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player1CD3 == 0 then
        exEnableWBScript("PlyrCivilian/devilASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player1CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if playerName == "Player_" .. 2 and btnIndex == 3  and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player2CD3 == 0 then
        exEnableWBScript("PlyrCivilian/devilASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player2CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if playerName == "Player_" .. 3 and btnIndex == 3  and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player3CD3 == 0 then
        exEnableWBScript("PlyrCivilian/devilASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player3CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if playerName == "Player_" .. 4 and btnIndex == 3  and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player4CD3 == 0 then
        exEnableWBScript("PlyrCreeps/angelASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player4CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if playerName == "Player_" .. 5 and btnIndex == 3  and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player5CD3 == 0 then
        exEnableWBScript("PlyrCreeps/angelASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player5CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if playerName == "Player_" .. 6 and btnIndex == 3  and g_AlliedSuperWeaponBuilt[g_PlayerNameToIndex[playerName]] == 1 and Player6CD3 == 0 then
        exEnableWBScript("PlyrCreeps/angelASuper");
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Die")
        Player6CD3 = 3
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);
    end
    if btnIndex == 3 and g_ProductionBonus_JapanGet[g_PlayerNameToIndex[playerName]] == 1 then
        local playerIndex = g_PlayerNameToIndex[playerName];
        g_ProductionBonus_JapanWeaponEnable[playerIndex] = 0;
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);

        local filterObj = T74;
        if playerIndex >= 4 then
            filterObj = T84;
        end

        local sideName = "天使"
        if playerIndex <= 3 then
            sideName = "恶魔"
        end
        exMessageAppendToMessageArea(format("%s $p%dName使用了由帝国机械化组装协议提供的纳米护盾！", sideName, playerIndex))

        local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleFilter)
        for i = 1, count, 1 do
            local current = matchedObjects[i]
            local x,y,z = ObjectGetPosition(current)
            ObjectCreateAndFireTempWeaponToTarget(filterObj, "PlayerPowerPointDefenseDronesWeapon_Individual", {
                X=x, Y=y, Z=z
            }, current)
        end

        SchedulerModule.delay_call(function(pName)
            local playerIndex2 = g_PlayerNameToIndex[pName];
            g_ProductionBonus_JapanWeaponEnable[playerIndex2] = 1;
            exCenterTopBtnSetEnableForPlayer(pName, 3, 1);
        end, 2700 , {playerName})

    end
    if btnIndex == 3 and g_CelestialSuperWeapon_Get[g_PlayerNameToIndex[playerName]] == 1 then
        local playerIndex = g_PlayerNameToIndex[playerName];
        g_CelestialSuperWeapon_CelestialWeaponEnable[playerIndex] = 0;
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0);

        local filterObj = T74;
        if playerIndex >= 4 then
            filterObj = T84;
        end

        local sideName = "天使"
        if playerIndex <= 3 then
            sideName = "恶魔"
        end
        exMessageAppendToMessageArea(format("%s $p%dName使用了由止戈立场提供的全图士气提升技能！", sideName, playerIndex))

        local matchedObjects, count = ObjectFindObjects(filterObj, nil, g_VehicleInfantryAircraftFilter)
        for i = 1, count, 1 do
            local current = matchedObjects[i]
            ObjectLoadAttributeModifier(current, "AttributeMod_lightningTroop_Lv1", 270)
        end

        SchedulerModule.delay_call(function(pName)
            local playerIndex2 = g_PlayerNameToIndex[pName];
            g_CelestialSuperWeapon_CelestialWeaponEnable[playerIndex2] = 1;
            exCenterTopBtnSetEnableForPlayer(pName, 3, 1);
        end, 3300 , {playerName})

    end
    if playerName == "Player_" .. 2 and btnIndex == 2 and Player2CD2 < 2 then
        exMessageAppendToMessageArea("恶魔方竟然让时间停止！")
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Off")
        exEnableWBScript("devilstop");
        Player2CD2 =  Player2CD2 + 1
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0) -- 先禁用（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown[playerName][btnIndex] = true
        if Player2CD2 >= 2 then
            exCenterTopBtnShowForPlayer(playerName, btnIndex, 'AUA_Timebelt', '时空管理局\n借助未来科技的力量时停对方单位13s(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player2CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 5 and btnIndex == 2 and Player5CD2 < 2 then
        exMessageAppendToMessageArea("天使方竟然让时间停止！")
        ExecuteAction("PLAY_SOUND_EFFECT", "ALL_Chronosphere_Off")
        exEnableWBScript("angelstop");
        Player5CD2 = Player5CD2 + 1
        exCenterTopBtnSetEnableForPlayer(playerName, btnIndex, 0) -- 先禁用（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown[playerName][btnIndex] = true
        if Player5CD2 >= 2 then
            exCenterTopBtnShowForPlayer(playerName, btnIndex, 'AUA_Timebelt', '时空管理局\n借助未来科技的力量时停对方单位13s(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player5CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 3 and btnIndex == 2 and Player3CD2 < 2 then
        exMessageAppendToMessageArea("恶魔方请求了空军元帅！")
        ExecuteAction("PLAY_SOUND_EFFECT", "SOV_SukhoiInterceptor_VoiceAttack")
        ExecuteAction("PLAY_SOUND_EFFECT", "CEL_NukeIncoming")
        exEnableWBScript("devil_air");
        Player3CD2 = Player3CD2 + 1
        exCenterTopBtnSetEnableForPlayer('Player_3', 2, 0) -- 先禁用按钮（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown['Player_3'][2] = true
        if Player3CD2 >= 2 then
            exCenterTopBtnShowForPlayer('Player_3', 2, 'Button_SovietInterceptorAircraft', '空军元帅\n请求超级苏霍伊群抵达战场对敌方的空军造成毁灭性的攻击(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player3CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 6 and btnIndex == 2 and Player6CD2 < 2 then
        exMessageAppendToMessageArea("天使方请求了空军元帅！")
        ExecuteAction("PLAY_SOUND_EFFECT", "SOV_SukhoiInterceptor_VoiceAttack")
        ExecuteAction("PLAY_SOUND_EFFECT", "CEL_NukeIncoming")
        exEnableWBScript("angel_air");
        Player6CD2 = Player6CD2 + 1
        exCenterTopBtnSetEnableForPlayer('Player_6', 2, 0) -- 先禁用按钮（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown['Player_6'][2] = true
        if Player6CD2 >= 2 then
            exCenterTopBtnShowForPlayer('Player_6', 2, 'Button_SovietInterceptorAircraft', '空军元帅\n请求超级苏霍伊群抵达战场对敌方的空军造成毁灭性的攻击(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player6CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 1 and btnIndex == 2 and Player1CD2 < 2 then
        exMessageAppendToMessageArea("恶魔方落下了达摩克利斯之剑！")
        ExecuteAction("PLAY_SOUND_EFFECT", "CelestialEnergyGatling_Select")
        exEnableWBScript("devil_nemesisplay");
        Player1CD2 = Player1CD2 + 1
        exCenterTopBtnSetEnableForPlayer('Player_1', 2, 0) -- 先禁用按钮（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown['Player_1'][2] = true
        if Player1CD2 >= 2 then
            exCenterTopBtnShowForPlayer('Player_1', 2, 'Button_CelestialPantaOrbitalStrike', '达摩克利斯之剑\n请求太空的卫星对敌方启用15秒的精准卫星打击(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player1CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 4 and btnIndex == 2 and Player4CD2 < 2 then
        exMessageAppendToMessageArea("天使方落下了达摩克利斯之剑！")
        ExecuteAction("PLAY_SOUND_EFFECT", "CelestialEnergyGatling_Select")
        exEnableWBScript("angel_nemesisplay");
        Player4CD2 = Player4CD2 + 1
        exCenterTopBtnSetEnableForPlayer('Player_4', 2, 0) -- 先禁用按钮（无论还有没有使用次数）
        g_CenterTopButtonClickCooldown['Player_4'][2] = true
        if Player4CD2 >= 2 then
            exCenterTopBtnShowForPlayer('Player_4', 2, 'Button_CelestialPantaOrbitalStrike', '达摩克利斯之剑\n请求太空的卫星对敌方启用15秒的精准卫星打击(已使用)')
        else
            -- 150 帧（10秒）后恢复按钮，避免玩家卡比的时候不小心连点两下
            SchedulerModule.delay_call(function(pName, bIndex)
                g_CenterTopButtonClickCooldown[pName][bIndex] = false
                if Player4CD2 < 2 then
                    exCenterTopBtnSetEnableForPlayer(pName, bIndex, 1)
                end
            end, 150, {playerName, btnIndex})
        end
    end
    if playerName == "Player_" .. 1 and btnIndex == 6 and Player1CD6 == 0 then
        devil_surrender = 0
        exEnableWBScript("PlyrCivilian/devil_surrender")
        exAddTextToPublicBoard("恶魔$p1Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_1', 201, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_2', 202, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_3', 203, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player1CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_" .. 2 and btnIndex == 6 and Player2CD6 == 0 then
        devil_surrender = 0
        exEnableWBScript("PlyrCivilian/devil_surrender")
        exAddTextToPublicBoard("恶魔$p2Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_1', 201, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_2', 202, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_3', 203, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player2CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_" .. 3 and btnIndex == 6 and Player3CD6 == 0 then
        devil_surrender = 0
        exEnableWBScript("PlyrCivilian/devil_surrender")
        exAddTextToPublicBoard("恶魔$p3Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_1', 201, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_2', 202, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_3', 203, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player3CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_" .. 4 and btnIndex == 6 and Player4CD6 == 0 then
        angel_surrender = 0
        exEnableWBScript("PlyrCreeps/angel_surrender")
        exAddTextToPublicBoard("天使$p4Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_4', 204, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_5', 205, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_6', 206, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player4CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_" .. 5 and btnIndex == 6 and Player5CD6 == 0 then
        angel_surrender = 0
        exEnableWBScript("PlyrCreeps/angel_surrender")
        exAddTextToPublicBoard("天使$p5Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_4', 204, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_5', 205, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_6', 206, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player5CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_" .. 6 and btnIndex == 6 and Player6CD6 == 0 then
        angel_surrender = 0
        exEnableWBScript("PlyrCreeps/angel_surrender")
        exAddTextToPublicBoard("天使$p6Name发起了投降", 10)
        exShowLongTextDialogForPlayer('Player_4', 204, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_5', 205, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        exShowLongTextDialogForPlayer('Player_6', 206, '                                                          正在投票\n规则:投降大于战斗则为成功投降,票数相等会继续游戏\n全局每个人只能发动一次投降', '投降', '弃权', '战斗')
        Player6CD6 = 1
        exCenterTopBtnShowForPlayer(playerName, 6, 'Allied_topmenu_infantry', '投降\n召开一次严肃的会议试图结束游戏(已使用)')
    end
    if playerName == "Player_1" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', debtStr, '', '')
    elseif playerName == "Player_2" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', debtStr, '', '')
    elseif playerName == "Player_3" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', debtStr, '', '')
    elseif playerName == "Player_4" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', debtStr, '', '')
    elseif playerName == "Player_5" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', debtStr, '', '')
    elseif playerName == "Player_6" and btnIndex == 4 then
        exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', debtStr, '', '')
    end
end