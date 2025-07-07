g_CelestialBomberAircraftFilter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing={"CelestialBomberAircraft_Enhanced"}
})

function CelestialBomberAircraft_RandomChangeMode()
    local objects , count = ObjectFindObjects(T84, nil, g_CelestialBomberAircraftFilter)
    for i = 1 , count , 1 do
        local obj = objects[i]
        local random = GetRandomNumber() * 100;
        if random < 60 then
            if EvaluateCondition("UNIT_HAS_OBJECT_STATUS", obj, "TRANSFORMATION_TOGGLE_STATE") then
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", obj,"TRANSFORMATION_TOGGLE_STATE", 0)
            else
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", obj,"TRANSFORMATION_TOGGLE_STATE", 1)
            end
        end
    end

    objects , count = ObjectFindObjects(T74, nil, g_CelestialBomberAircraftFilter)
    for i = 1 , count , 1 do
        local obj = objects[i]
        local random = GetRandomNumber() * 100;
        if random < 60 then
            if EvaluateCondition("UNIT_HAS_OBJECT_STATUS", obj, "TRANSFORMATION_TOGGLE_STATE") then
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", obj,"TRANSFORMATION_TOGGLE_STATE", 0)
            else
                ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", obj,"TRANSFORMATION_TOGGLE_STATE", 1)
            end
        end
    end
end