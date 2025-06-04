local units,count = ObjectFindObjects(T74, nil,AAMissileProjectile)
       for i = 1, count do
          local wuti = ObjectGetId(units[i])
ObjectLoadAttributeModifier(wuti,'AttributeMod_ChronoRiftEffect_Contained',30000)
        end