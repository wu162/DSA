devil_max = 200
angel_max = 200

g_GameMode = 1;
g_EnableDeathModeEffect = 0;
g_DisableSeaArmy = 0;

g_GameModeName = {
    [1] = "正常模式",
    [2] = "死亡模式",
    [3] = "缩小模式",
}

function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
    local round = exCounterGetByName("lvc")
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
        BtnChoiceDialogEventFunc_HandleMarketDialogEvent(playerName)
    end

    if dialogId == 201 then
        g_GameMode = btnIndex;
        exMessageAppendToMessageArea('已选择游戏模式' .. g_GameModeName[g_GameMode])
        if g_GameMode == 3 then
            -- 启用了缩小模式，进一步选择是否启用死亡模式效果
            exShowCustomBtnChoiceDialogForPlayer(playerName, 202, "是否启用死亡模式效果\n(只有1个塔,科技全开)", '启用', '不启用', '', '', '', '', '')
        else
            exShowCustomBtnChoiceDialogForPlayer(playerName, 203, "是否禁止生成海军", '禁止', '不禁止', '', '', '', '', '')
            --exEnableWBScript("readyForStartCam");
        end
    end
    if dialogId == 202 then
        if btnIndex == 1 then
            g_EnableDeathModeEffect = 1;
            exMessageAppendToMessageArea("同时启用了死亡模式效果")
        end

        exShowCustomBtnChoiceDialogForPlayer(playerName, 203, "是否禁止生成海军", '禁止', '不禁止', '', '', '', '', '')
        --exEnableWBScript("readyForStartCam");
    end
    if dialogId == 203 then
        if btnIndex == 1 then
            g_DisableSeaArmy = 1;
            exMessageAppendToMessageArea("房主已禁止生成海军")
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

    if dialogId == 1001 then
        if btnIndex <= 3 then
            CenterTopBtnFunc_CreatePlayerSkillButtons(playerIndex, btnIndex)
        end
    end

    SetWorldBuilderThisPlayer(previous)
end

function BtnChoiceDialogEventFunc_ShowNextMarketDialog(playerIndex)
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 6 then
        exMessageAppendToMessageArea("错误：BtnChoiceDialogEventFunc_ShowNextMarketDialog 的参数 playerIndex 无效")
        return
    end
    local playerName = "Player_" .. playerIndex
    local investedMax = devil_max
    local investedMoney = devil_money
    if playerIndex >= 4 then
        investedMax = angel_max
        investedMoney = angel_money
    end
    local nextTitle = format('欢迎进入交易市场\n投资金额(上限%d):%d', investedMax, investedMoney)
    local transferToA_Index, transferToB_Index = BtnChoiceDialogEventFunc_GetTransferMoneyIndices(playerIndex)
    local roles = { '恶魔1号', '恶魔2号', '恶魔3号', '天使1号', '天使2号', '天使3号' }
    local transferToA_PlayerName = "Player_" .. transferToA_Index
    local transferToB_PlayerName = "Player_" .. transferToB_Index
    local playerA_Color = BtnChoiceDialogEventFunc_CalculateColor(transferToA_Index)
    local playerB_Color = BtnChoiceDialogEventFunc_CalculateColor(transferToB_Index)
    if playerA_Color == nil then
        playerA_Color = ""
    else
        playerA_Color = format("(%s)", playerA_Color)
    end
    if playerB_Color == nil then
        playerB_Color = ""
    else
        playerB_Color = format("(%s)", playerB_Color)
    end

    local nextInvestmentText = '购买100恶魔投资'
    if playerIndex >= 4 then
        nextInvestmentText = '购买100天使投资'
    end

    local debtStr = "";
    if g_PlayerDebtCount[playerName] == 0 then
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        debtStr = "向银行贷款 " .. debtMoney .. '\n(将会3分钟无收入)';
    end

    exShowCustomBtnChoiceDialogForPlayer(playerName, 100 + playerIndex, nextTitle,
        format('向%s%s转移1000资金', roles[transferToA_Index], playerA_Color), -- 1
        format('向%s%s转移1000资金', roles[transferToB_Index], playerB_Color), -- 2
        '回到战场', -- 3
        nextInvestmentText, -- 4
        debtStr, -- 5
        '',
        ''
    )
end

function BtnChoiceDialogEventFunc_HandleMarketDialogEvent(playerName)
    local playerIndex = g_PlayerNameToIndex[playerName]
    if type(playerIndex) ~= 'number' or playerIndex < 1 or playerIndex > 6 then
        exMessageAppendToMessageArea("错误：BtnChoiceDialogEventFunc_HandleMarketDialog 的参数 playerName 无效")
        return
    end
    -- 获取回合开始时间计数器
    local start = exCounterGetByName("start")

    -- 假如是 Player_1，他应该转账给 Player_2 和 3；假如是 2，则应该转账给 1 和 3
    -- 假如是 4，应该转账给 5 和 6；假如是 6，则应该转账给 4 和 5
    local transferToA_Index, transferToB_Index = BtnChoiceDialogEventFunc_GetTransferMoneyIndices(playerIndex)

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
            exAddTextToPublicBoardForPlayer(playerName, format('成功转账1000给$p%dName', transferTargetIndex), 5)
        else
            exAddTextToPublicBoardForPlayer(playerName, '您的余额不足', 5)
        end
        -- 重新显示交易市场对话框
        BtnChoiceDialogEventFunc_ShowNextMarketDialog(playerIndex)
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
        BtnChoiceDialogEventFunc_ShowNextMarketDialog(playerIndex)
    elseif btnIndex == 5 then
        -- 处理贷款
        local debtMoney = g_TowerDestroyProgress * 2600 + 4000;
        ExecuteAction('PLAYER_GIVE_MONEY', playerName, debtMoney)
        exMessageAppendToMessageArea(format('$p%dName向银行贷款', playerIndex))
        exAddTextToPublicBoardForPlayer(playerName, '贷款成功', 10)

        g_PlayerInDebt[playerName] = 1;
        g_PlayerDebtCount[playerName] = g_PlayerDebtCount[playerName] + 1;

        SchedulerModule.delay_call(function(pName)
            g_PlayerInDebt[pName] = 0;
        end, 15 * 60 * 3, {playerName})
    end
end

-- 假如是 Player_1，他应该转账给 Player_2 和 3；假如是 2，则应该转账给 1 和 3
-- 假如是 4，应该转账给 5 和 6；假如是 6，则应该转账给 4 和 5
function BtnChoiceDialogEventFunc_GetTransferMoneyIndices(playerIndex)
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
    return transferToA_Index, transferToB_Index
end

function BtnChoiceDialogEventFunc_CalculateColor(playerIndex)
    local playerName = "Player_" .. playerIndex
    local color = exPlayerGetColor(playerName)
    if color == nil or color[1] == nil or color[1] <= 0 then
        return nil
    end
    -- from 0~255 RGB values, determine human readable color
    -- maybe we can convert RGB to HSL and determine color based on hue?
    local red = color[1] / 255
    local green = color[2] / 255
    local blue = color[3] / 255
    local maxValue = max(red, green, blue)
    local minValue = min(red, green, blue)
    local lightness = (maxValue + minValue) / 2
    if lightness < 0.1 then
        return "黑色"
    elseif lightness > 0.95 then
        return "白色"
    elseif maxValue == minValue then
        return "灰色"
    end
    local d = maxValue - minValue
    local saturation = 0
    if lightness > 0.5 then
        saturation = d / (2 - maxValue - minValue)
    else
        saturation = d / (maxValue + minValue)
    end
    if saturation < 0.1 then
        return "灰色"
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
        return "红色"
    elseif hue < 45 then
        return "橙色"
    elseif hue < 75 then
        return "黄色"
    elseif hue < 160 then
        return "绿色"
    elseif hue < 190 then
        return "青色"
    elseif hue < 270 then
        return "蓝色"
    elseif hue < 300 then
        return "紫色"
    elseif hue < 330 then
        return "粉色"
    end
    return nil
end