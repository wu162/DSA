local T2zhong, count = ObjectFindObjects(T74, nil, T2zhong)
 for i = 1, count do
  local wuti = ObjectGetId(T2zhong[i])
  local str = "T2zhong1" .. i
  ExecuteAction("SET_UNIT_REFERENCE", str, T2zhong[i])
  ExecuteAction("UNIT_SET_TEAM","T2zhong1" .. i,'T2')
 end