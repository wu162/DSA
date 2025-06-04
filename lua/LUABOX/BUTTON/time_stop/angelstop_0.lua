local units, count = ObjectFindObjects(T74, nil, FilterALLUNIT)
for i=1,count,1 do
  local wuti = ObjectGetId(units[i])
  local str = "units" .. i
  ExecuteAction("SET_UNIT_REFERENCE", str, units[i])
  ExecuteAction("NAMED_SET_DISABLED","units" .. i,'PARALYZED','true')
ObjectLoadAttributeModifier(wuti,'AttributeMod_ChronoRiftEffect',100000000)
end