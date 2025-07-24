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

    -- 试图重构一下之前的那堆复制粘贴的代码
    -- 首先弄清楚目前各种 hard coded 的数字代表什么
    -- Player_1, Player_2, Player_N, ...
    -- btnIndex：
    --   1 和 2 分别代表向队友转移资金
    --   4 代表购买投资
    --   5 代表贷款
    -- 此外看起来每个玩家都有自己的 dialogId：Player_1 是 101，Player_2 是 102，Player_3 是 103，。。。

    -- 那么，我们可以首先获取玩家序号
    local playerIndex = g_PlayerNameToIndex[playerName]
    -- 处理交易市场对话框
    local marketDialogId = 100 + playerIndex
    if dialogId == marketDialogId then
        -- 首先，除非玩家退出交易市场，否则等玩家执行完操作之后，我们还要重新显示交易市场对话框
        -- 因此首先准备好下一次显示交易市场对话框的内容（也就是 exShowCustomBtnChoiceDialogForPlayer 的参数）
        function showNextMarketDialog(playerName, playerIndex, transferToA_Index, transferToB_Index)
            local investedMax = devil_max
            local investedMoney = devil_money
            if playerIndex >= 4 then
                investedMax = angel_max
                investedMoney = angel_money
            end
            local nextTitle = format('欢迎进入交易市场\n投资金额(上限%d):%d', investedMax, investedMoney)
            local roles = { '恶魔攻击单元', '恶魔时空管理员', '恶魔空军司令', 
                           '天使攻击单元', '天使时空管理员', '天使空军司令' }
            local nextInvestmentText = '购买100恶魔投资'
            if playerIndex >= 4 then
                nextInvestmentText = '购买100天使投资'
            end
            exShowCustomBtnChoiceDialogForPlayer(playerName, 100 + playerIndex, nextTitle,
                format('向%s转移1000资金', roles[transferToA_Index]),
                format('向%s转移1000资金', roles[transferToB_Index]),
                '回到战场', nextInvestmentText, '', '', '')
        end
        -- 假如是 Player_1，他应该转账给 Player_2 和 3；假如是 2，则应该转账给 1 和 3
        -- 假如是 4，应该转账给 5 和 6；假如是 6，则应该转账给 4 和 5
        local transferToA_Index, transferToB_Index
        if playerIndex == 1 or playerIndex == 4 then
            transferToA_Index = playerIndex + 1
            transferToB_Index = playerIndex + 2
        elseif playerIndex == 2 or playerIndex == 5 then
            transferToA_Index = playerIndex - 1
            transferToB_Index = playerIndex + 1
        elseif playerIndex == 3 or playerIndex == 6 then
            transferToA_Index = playerIndex - 2
            transferToB_Index = playerIndex - 1
        end

        -- 处理转账
        if btnIndex == 1 or btnIndex == 2 then
            local transferTargetIndex = transferToA_Index
            if btnIndex == 2 then
                transferTargetIndex = transferToB_Index
            end
            local transferTargetName = "Player_" .. transferTargetIndex
            local money = exPlayerGetCurrentMoney(playerName)
            if money >= 1000 then
                ExecuteAction('PLAYER_GIVE_MONEY', transferTargetName, '1000')
                ExecuteAction('PLAYER_GIVE_MONEY', playerName, '-1000')
                exAddTextToPublicBoardForPlayer(playerName, '转移成功', 5)
            else
                exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
            end
            -- 重新显示交易市场对话框
            showNextMarketDialog(playerName, playerIndex, transferToA_Index, transferToB_Index)
        elseif btnIndex == 4 then
            -- 处理购买投资
            local money = exPlayerGetCurrentMoney(playerName)
            local isInvestementMax = false
            if playerIndex <= 3 and devil_money >= devil_max then
                isInvestementMax = true
            elseif playerIndex >= 4 and angel_money >= angel_max then
                isInvestementMax = true
            end
            if isInvestementMax then
                exAddTextToPublicBoardForPlayer(playerName, '投资失败：投资已达到上限', 5)
            elseif start <= 600 then
                exAddTextToPublicBoardForPlayer(playerName, '投资失败：只能在每个回合刚开始时投资', 5)
            elseif money < 100 then
                exAddTextToPublicBoardForPlayer(playerName, '投资失败：余额不足', 5)
            else
                if playerIndex <= 3 then
                    devil_money = devil_money + 100
                    exAddTextToPublicBoardForPlayer(playerName, '投资成功，当前投资金额：' .. devil_money, 5)
                else
                    angel_money = angel_money + 100
                    exAddTextToPublicBoardForPlayer(playerName, '投资成功，当前投资金额：' .. angel_money, 5)
                end
                ExecuteAction('PLAYER_GIVE_MONEY', playerName, '-100')
            end
            -- 重新显示交易市场对话框
            showNextMarketDialog(playerName, playerIndex, transferToA_Index, transferToB_Index)
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