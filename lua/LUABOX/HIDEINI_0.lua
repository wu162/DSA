FilterJapanLightTransportVehicle=CreateObjectFilter({
  Rule="ANY",
  IncludeThing = {
    "JapanLightTransportVehicle",
  }
})
FilterAlliedNightinaleHelicopter=CreateObjectFilter({
  Rule="ANY",
  IncludeThing = {
    "AlliedNightinaleHelicopter",
  }
})


function HIDEOBJ ()
  local SELF, count = ObjectFindObjects(nil, nil, FilterJapanLightTransportVehicle)
  for i = 1 , count , 1 do
    ObjectLoadAttributeModifier(SELF[i], "AttributeMod_ContainedTurretREALLYDAMAGED", 9999)
    ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",SELF[i],"STEALTHED",1)
    ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",SELF[i],"UNDER_IRON_CURTAIN",1)
  end
end

HIDEOBJ ()
-- 只对地图上已有的夜莺生效，后续生产的夜莺不受影响
local initialNightinales, countNightinales = ObjectFindObjects(nil, nil, FilterAlliedNightinaleHelicopter)
for i = 1 , countNightinales , 1 do
  local nightinale = initialNightinales[i]
  ObjectLoadAttributeModifier(nightinale, "AttributeMod_ContainedTurretREALLYDAMAGED", 9999)
  ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", nightinale, "STEALTHED", 1)
  ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", nightinale, "UNDER_IRON_CURTAIN", 1)
end
