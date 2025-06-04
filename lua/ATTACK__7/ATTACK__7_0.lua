 local T74 = GetObjectByScriptName("T74")
 local T2ship, count = ObjectFindObjects(T74, nil, AlliedAntiStructureVehicle)
 for i = 1, count do
    local wuti = ObjectGetId(T2ship[i])
    ObjectLoadAttributeModifier(wuti, gongsu1,150)
  end