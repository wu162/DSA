if not RoundLuaManager then
    RoundLuaManager = {
        _onBegin = {},
        _onEnd = {},
        _delayedOnBegin = {},

        _begin = function()
            for i = 1, getn(RoundLuaManager._onBegin) do
                local data = RoundLuaManager._onBegin[i]
                if data.Enabled == 1 then
                    call(data.Callback, data.Arguments, "x")
                end
            end
            -- 处理延迟调用
            local delayedCalls = RoundLuaManager._delayedOnBegin
            local d = 1
            while d <= getn(delayedCalls) do
                local data = delayedCalls[d]
                data.Delay = data.Delay - 1
                if data.Delay > 0 then
                    d = d + 1
                else
                    call(data.Callback, data.Arguments, "x")
                    tremove(delayedCalls, d)
                end
            end
        end,

        _end = function()
            for i = 1, getn(RoundLuaManager._onEnd) do
                local data = RoundLuaManager._onEnd[i]
                if data.Enabled == 1 then
                    call(data.Callback, data.Arguments, "x")
                end
            end
        end,
    }

    function RoundLuaManager.CallOnEveryRoundBegin(callback, arguments)
        local id = getn(RoundLuaManager._onBegin) + 1
        RoundLuaManager._onBegin[id] = {
            Callback = callback,
            Arguments = arguments or {},
            Enabled = 1,
        }
        return id
    end

    function RoundLuaManager.CallOnEveryRoundEnd(callback, arguments)
        local id = getn(RoundLuaManager._onEnd) + 1
        RoundLuaManager._onEnd[id] = {
            Callback = callback,
            Arguments = arguments or {},
            Enabled = 1,
        }
        return id
    end

    function RoundLuaManager.DelayCallOnRoundBegin(callback, arguments, delay)
        tinsert(RoundLuaManager._delayedOnBegin, {
            Callback = callback,
            Arguments = arguments or {},
            Delay = delay or 0,
        })
    end

    exSetPublicBoardColor(HexToUInt32("00FFFF"))
    local list = { "INFANT12", "INFANT15", "INFANT23", "INFANT24", "AIR14", "AIR16", "AIR24", "AIR26" }
    RoundLuaManager.CallOnEveryRoundBegin(function(list)
        for i = 1, getn(list), 1 do
            ExecuteAction("OBJECT_CREATE_RADAR_EVENT", list[i], "Information")
        end
        local level = exCounterGetByName("lvc")
        if level ~= nil and level > 0 then
            exAddTextToPublicBoard(format("第%d回合，开始！", level), 10)
            if level == 1 then
                exAddTextToPublicBoard("战场右侧：天使$p4Name $p5Name $p6Name", 20)
                exAddTextToPublicBoard("战场左侧：恶魔$p1Name $p2Name $p3Name", 20)
            end
        end
    end, { list })
end

-- 回合结束
RoundLuaManager._end()

local countD  = GetPlayerAllUnitsValue('PlyrCivilian')
local  countA = GetPlayerAllUnitsValue('PlyrCreeps')
if countD>countA then
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_1',devil_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_2',devil_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_3',devil_money)
    exAddTextToPublicBoard('恶魔方本回合胜!',10)
    if devil_max>=1200 then
        exAddTextToPublicBoard('恶魔方终结连胜!',10)
    end
    if angel_max>=1200 then
        exAddTextToPublicBoard('恶魔方正在连胜!',10)
    end
    devil_money=0
    angel_money=0
    if angel_max<4200 then
        angel_max=angel_max+400
    end
    if devil_max >= 1800 then
        devil_max = devil_max / 2;
    else
        devil_max=200
    end
elseif countD<countA then
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_4',angel_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_5',angel_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_6',angel_money)
    exAddTextToPublicBoard('天使方本回合胜!',10)
    if devil_max>=1200 then
        exAddTextToPublicBoard('天使方正在连胜!',10)
    end
    if angel_max>=1200 then
        exAddTextToPublicBoard('天使方终结连胜!',10)
    end
    devil_money=0
    angel_money=0
    if angel_max >= 1800 then
        angel_max = angel_max / 2;
    else
        angel_max=200
    end
    if devil_max<4200 then
        devil_max=devil_max+400
    end
else
    devil_money=0
    angel_money=0
    exAddTextToPublicBoard('本回合暂无胜者',10)
end