FilterCelestialBattery=CreateObjectFilter({
    Rule="ANY",
    StatusBitFlagsExclude="UNPACKING",
    IncludeThing = {
        "CelestialBattery"
    },
})

SchedulerModule.call_every_x_frame(function()
    local obj, count = ObjectFindObjects(nil, nil, FilterCelestialBattery)
    local playerCounts = {}
    for i = 1 , count , 1 do
        local player = ObjectPlayerScriptName(obj[i])
        local playerCount = playerCounts[player] or 1
        if playerCount <= 3 then
            ExecuteAction("NAMED_DAMAGE", obj[i], 8);
        end
        playerCounts[player] = playerCount + 1
    end

end, 30, nil)
