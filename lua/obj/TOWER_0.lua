FilterTOWER=CreateObjectFilter({
    Rule="ANY",
    Include="SELECTABLE",
    IncludeThing = {
   "celestialbasedefensedropped'","celestialbasedefenseadvanced","celestialenergygatlingtower" ,"AlliedHeavyArtilleryDefenseBase"
    }
  })

  function UNFROZEN()
  local TAR, count = ObjectFindObjects(nil, nil,FilterTOWER)
  for i = 1 , count , 1 do
    objectId = ObjectGetId(TAR[i])
    exObjectDealSecondaryDamage(objectId, -5000)
  end
end

T74= GetObjectByScriptName("T74") ;
T84= GetObjectByScriptName("T84") ;