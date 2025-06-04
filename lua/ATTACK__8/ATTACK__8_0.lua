 local T84 = GetObjectByScriptName("T84")
 local T2ship, count = ObjectFindObjects(T84, nil, AlliedAntiStructureVehicle)
 for i = 1, count do
    local wuti = ObjectGetId(T2ship[i])
    ObjectLoadAttributeModifier(wuti, gongsu1,150)
  end