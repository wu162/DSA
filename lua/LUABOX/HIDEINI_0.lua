FilterJapanLightTransportVehicle=CreateObjectFilter({
  Rule="ANY",
  IncludeThing = {
 "JapanLightTransportVehicle"
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
