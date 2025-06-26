g_CelestialCoreFilter = CreateObjectFilter({
    Rule = "ANY",
    IncludeThing = {
        "CelestialCore"
    },
})

SchedulerModule.call_every_x_frame(function()
    local obj, count = ObjectFindObjects(nil, {
        X=1300, Y=3000, Z=210, Radius=1300, DistType="EXTENTS_3D"
    }, g_CelestialCoreFilter)
    for i = 1 , count , 1 do
        ExecuteAction("NAMED_DELETE", obj[i]);
    end

    obj, count = ObjectFindObjects(nil, {
        X=3000, Y=3000, Z=210, Radius=1300, DistType="EXTENTS_3D"
    }, g_CelestialCoreFilter)
    for i = 1 , count , 1 do
        ExecuteAction("NAMED_DELETE", obj[i]);
    end

    obj, count = ObjectFindObjects(nil, {
        X=5700, Y=3000, Z=210, Radius=1300, DistType="EXTENTS_3D"
    }, g_CelestialCoreFilter)
    for i = 1 , count , 1 do
        ExecuteAction("NAMED_DELETE", obj[i]);
    end

end, 15 * 4, nil)