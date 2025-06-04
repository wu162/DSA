local units, count = ObjectFindObjects(T84, nil,CelestialMCV)--鑾峰緱瀵绘壘鍒扮殑鍗曚綅鐨勬暟閲?
          for i = 1, count do--瀵绘壘姣忎竴涓崟浣嶏紝骞舵搷浣?
             local wuti = ObjectGetId(units[i])
             local str = "Unit11" .. i
   ExecuteAction("SET_UNIT_REFERENCE", str, units[i])
             ExecuteAction("NAMED_SET_MAX_HEALTH","Unit11" .. i,'30000','true') 
        end