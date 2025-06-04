FILTERDOUBLEHP=CreateObjectFilter({
            Rule="ANY",
            IncludeThing = {
           'JapanSentinelVehicle','SovietInterceptorAircraft'
            }
          })


function DOUBLEHP ()
local TAR , COUNTX = ObjectFindObjects(nil, nil, FILTERDOUBLEHP)
for i = 0 , COUNTX ,1 do
 ObjectLoadAttributeModifier(TAR[i], "AttributeMod_SovietAntiGroundAttackerBOSSAIUnitCheat",150)
ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(TAR[i], 1, 1, 1, 20)
end
end