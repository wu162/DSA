FilterCelestialBattery=CreateObjectFilter({
    Rule="ANY",
    StatusBitFlagsExclude="UNPACKING",
    IncludeThing = {
        "CelestialBattery"
    },
})

SchedulerModule.call_every_x_frame(function()
    local obj, count = ObjectFindObjects(nil, nil, FilterCelestialBattery)
    for i = 1 , count , 1 do
        ExecuteAction("NAMED_DAMAGE", obj[i], 23);
    end

end, 30, nil)
