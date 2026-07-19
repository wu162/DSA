LIMITPOWERC = 4
FLAGENPOWER = {}
for i = 1, 6, 1 do
    FLAGENPOWER[i] = 1
end

g_CachedPlayersPowerPlantLimit = {}

function LIMITPOWER()
    

    for playindex = 1, 6, 1 do
        g_CachedPlayersPowerPlantLimit[playindex] = 0
        if ObjectIsAlive(P[playindex]) then
            -- 非神州阵营的玩家能多造一个电厂
            local power, count = ObjectFindObjects(P[playindex], nil, FilterPowerPlantOrEggNotCelestial)
            if count > 0 then
                g_CachedPlayersPowerPlantLimit[playindex] = 1
            end
        end
    end
    -- g_PlayerNameToIndex 这个表在 lua\GAME\BasicVar1.lua 里面
    -- 此时可能还没有初始化
    if g_PlayerNameToIndex ~= nil then
        for playindex = 1, 6, 1 do
            if ObjectIsAlive(P[playindex]) then
                -- 假如有玩家继承了另一位玩家的基地，那这个玩家的电厂上限也要继承过去
                local actualOwner = ObjectPlayerScriptName(P[playindex])
                if actualOwner ~= nil then
                    local actualIndex = g_PlayerNameToIndex[actualOwner]
                    if actualIndex ~= nil then
                        local currentCount = g_CachedPlayersPowerPlantLimit[actualIndex]
                        local newCount = currentCount + LIMITPOWERC
                        g_CachedPlayersPowerPlantLimit[actualIndex] = newCount
                    end
                end
            end
        end
    end
    for playindex = 1, 6, 1 do
        local currentLimit = g_CachedPlayersPowerPlantLimit[playindex]
        local Power, count = ObjectFindObjects(P[playindex], nil, FilterAnyPowerPlantOrEgg)
        if Power ~= nil then
            if count >= currentLimit and FLAGENPOWER[playindex] == 1 then
                --exMessageAppendToMessageArea("LIMLT")
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "alliedpowerplant", 0)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "celestialpowerplant", 0)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "SovietPowerPlant", 0)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "japanpowerplantegg", 0)
                FLAGENPOWER[playindex] = 0
            elseif count < currentLimit and FLAGENPOWER[playindex] == 0 then
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "alliedpowerplant", 1)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "celestialpowerplant", 1)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "SovietPowerPlant", 1)
                ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "japanpowerplantegg", 1)
                FLAGENPOWER[playindex] = 1
                --exMessageAppendToMessageArea("RE")
            end
        end
    end
end