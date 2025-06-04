local T2zhong, count = ObjectFindObjects(T84, nil, T2zhong)
 for i = 1, count do
  local wuti = ObjectGetId(T2zhong[i])
  local str = "T2zhong" .. i
  ExecuteAction("SET_UNIT_REFERENCE", str, T2zhong[i])
  ExecuteAction("UNIT_SET_TEAM","T2zhong" .. i,'T2')
 end