LIMITPOWERC = 4
FLAGENPOWER = {}
for i = 1, 6, 1 do
    FLAGENPOWER[i] = 1
end

function LIMITPOWER()
    --exMessageAppendToMessageArea("FLAGENPOWER[6]:"..FLAGENPOWER[6])
    for playindex = 1, 6, 1 do
        local Power, count = ObjectFindObjects(P[playindex], nil, condition)
        local PowerCelestial, countCelestial = ObjectFindObjects(P[playindex], nil, FilterPowerCelestial)
        if count >= LIMITPOWERC and FLAGENPOWER[playindex] == 1 or countCelestial >= LIMITPOWERC and FLAGENPOWER[playindex] == 1 then
            --exMessageAppendToMessageArea("LIMLT")
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "alliedpowerplant", 0)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "celestialpowerplant", 0)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "SovietPowerPlant", 0)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "japanpowerplantegg", 0)
            FLAGENPOWER[playindex] = 0
        elseif count < LIMITPOWERC and countCelestial < LIMITPOWERC and FLAGENPOWER[playindex] == 0 then
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "alliedpowerplant", 1)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "celestialpowerplant", 1)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "SovietPowerPlant", 1)
            ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "Player_" .. playindex, "japanpowerplantegg", 1)
            FLAGENPOWER[playindex] = 1
            --exMessageAppendToMessageArea("RE")
        end
    end
end