local units, count = ObjectFindObjects(T84, nil, FilterALLUNIT)
for i=1,count,1 do
  local wuti = ObjectGetId(units[i])
  local str = "units2" .. i
  ExecuteAction("SET_UNIT_REFERENCE", str, units[i])
  ExecuteAction("NAMED_SET_DISABLED","units2" .. i,'PARALYZED','true')
end