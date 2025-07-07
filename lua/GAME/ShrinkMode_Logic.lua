g_ShrinkFilter1 = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="INFANTRY VEHICLE AIRCRAFT",
})

g_ShrinkFilter2 = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="VEHICLE",
})

function ShrinkMode_Apply()
    exMessageAppendToMessageArea("ShrinkMode_Apply")
    local matchedObjects, count = ObjectFindObjects(T74, nil, g_ShrinkFilter1)
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current,'AttributeMod_AlliedSupportAircraftShrinkRay_HighTechnology', 9999)
    end
    matchedObjects, count = ObjectFindObjects(T84, nil, g_ShrinkFilter1)
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current,'AttributeMod_AlliedSupportAircraftShrinkRay_HighTechnology', 9999)
    end

    matchedObjects, count = ObjectFindObjects(T74, nil, g_ShrinkFilter2)
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current,'AttributeModifier_JapanNanoEnhanceDroneReinforcement', 9999)
    end

    matchedObjects, count = ObjectFindObjects(T84, nil, g_ShrinkFilter2)
    for i = 1, count, 1 do
        local current = matchedObjects[i]
        ObjectLoadAttributeModifier(current,'AttributeModifier_JapanNanoEnhanceDroneReinforcement', 9999)
    end

    --AttributeModifier_JapanNanoEnhanceDroneReinforcement
end