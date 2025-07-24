devil_max = 200
angel_max = 200

g_GameMode = 1;
g_EnableDeathModeEffect = 0;

g_GameModeName = {
    [1] = "正常模式",
    [2] = "死亡模式",
    [3] = "缩小模式",
}

function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
    local round = exCounterGetByName("lvc")
    local start = exCounterGetByName("start")
    local previous = SetWorldBuilderThisPlayer(1)
    if playerName == "Player_1" and btnIndex == 1 and dialogId == 101 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_2', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_1', '-1000')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_1" and btnIndex == 2 and dialogId == 101 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_3', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_1', '-1000')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_2" and btnIndex == 1 and dialogId == 102 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_1', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_2', '-1000')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_2" and btnIndex == 2 and dialogId == 102 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_3', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_2', '-1000')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_3" and btnIndex == 1 and dialogId == 103 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_1', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_3', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_3" and btnIndex == 2 and dialogId == 103 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_2', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_3', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_4" and btnIndex == 1 and dialogId == 104 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_4', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_4" and btnIndex == 2 and dialogId == 104 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_6', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_4', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_5" and btnIndex == 1 and dialogId == 105 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_4', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_5" and btnIndex == 2 and dialogId == 105 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_6', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_6" and btnIndex == 1 and dialogId == 106 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_4', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_6', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_6" and btnIndex == 2 and dialogId == 106 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 1000 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '1000')
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_6', '-1000')
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_1" and btnIndex == 4 and dialogId == 101 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and devil_money < devil_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_1', '-100')
            devil_money = devil_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 101, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔时空管理员转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_2" and btnIndex == 4 and dialogId == 102 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and devil_money < devil_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_2', '-100')
            devil_money = devil_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 102, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔空军司令转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_3" and btnIndex == 4 and dialogId == 103 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and devil_money < devil_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_3', '-100')
            devil_money = devil_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 103, '欢迎进入交易市场\n投资金额(上限' .. devil_max .. '):' .. devil_money, '向恶魔攻击单元转移1000资金', '向恶魔时空管理员转移1000资金', '回到战场', '购买100恶魔投资', '', '', '')
        end
    end
    if playerName == "Player_4" and btnIndex == 4 and dialogId == 104 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and angel_money < angel_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_4', '-100')
            angel_money = angel_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 104, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使时空管理员转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_5" and btnIndex == 4 and dialogId == 105 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and angel_money < angel_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '-100')
            angel_money = angel_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 105, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使空军司令转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end
    if playerName == "Player_6" and btnIndex == 4 and dialogId == 106 then
        local money = exPlayerGetCurrentMoney(playerName)
        if money >= 100 and angel_money < angel_max and start > 600 then
            ExecuteAction('PLAYER_GIVE_MONEY', 'Player_5', '-100')
            angel_money = angel_money + 100
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
            exAddTextToPublicBoardForPlayer(playerName, '投资成功', 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '条件不满足!', 5)
            exShowCustomBtnChoiceDialogForPlayer(playerName, 106, '欢迎进入交易市场\n投资金额(上限' .. angel_max .. '):' .. angel_money, '向天使攻击单元转移1000资金', '向天使时空管理员转移1000资金', '回到战场', '购买100天使投资', '', '', '')
        end
    end

    if btnIndex == 5 and dialogId >= 101 and dialogId <= 106 then
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        ExecuteAction('PLAYER_GIVE_MONEY', playerName, debtMoney)
        exMessageAppendToMessageArea('$p'.. g_PlayerNameToIndex[playerName] ..'Name' .. '向银行贷款')
        exAddTextToPublicBoardForPlayer(playerName, '贷款成功', 10)

        g_PlayerInDebt[playerName] = 1;
        g_PlayerDebtCount[playerName] = g_PlayerDebtCount[playerName] + 1;

        SchedulerModule.delay_call(function(pName)
            g_PlayerInDebt[pName] = 0;
        end, 15 * 60 * 3, {playerName})
    end

    if dialogId == 201 then
        g_GameMode = btnIndex;
        exMessageAppendToMessageArea('已选择游戏模式' .. g_GameModeName[g_GameMode])
        if g_GameMode == 3 then
            -- 进一步选择是否启用死亡模式效果
            exShowCustomBtnChoiceDialogForPlayer(playerName, 202, "是否启用死亡模式效果\n(只有1个塔,科技全开)", '启用', '不启用', '', '', '', '', '')
        else
            exEnableWBScript("readyForStartCam");
        end
    end
    if dialogId == 202 then
        if btnIndex == 1 then
            g_EnableDeathModeEffect = 1;
            exMessageAppendToMessageArea("同时启用了死亡模式效果")
        end

        exEnableWBScript("readyForStartCam");
    end
    if dialogId == 301 then
        if btnIndex == 1 then
            MsgCommand_BanSea()
        elseif btnIndex == 2 then
            MsgCommand_BanInfantry()
        end
    end

    SetworldBuilderThisPlayer(previous)
end