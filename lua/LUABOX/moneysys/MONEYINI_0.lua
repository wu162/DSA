condition=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
   'JapanPowerPlantEgg',"AlliedPowerPlant","JapanPowerPlant","SovietPowerPlant"
    }
  })
FilterPower=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
 "AlliedPowerPlant","JapanPowerPlant","SovietPowerPlant"
    }
  })
 -- exMessageAppendToMessageArea("瀹氫箟杩囨护鍣?)
function addmoney  (money)
  for playindex = 1 , 6 , 1 do 
   -- exMessageAppendToMessageArea("鎵ц")
    local TAR, count = ObjectFindObjects(P[playindex], nil,FilterPower)
    for i = 1 , count , 1 do
        if not EvaluateCondition("UNIT_HAS_MODELCONDITION", TAR[i] , "STRUCTURE_UNPACKING") then
         ExecuteAction("PLAYER_GIVE_MONEY","Player_"..playindex , money)
       --  exMessageAppendToMessageArea("浠烽挶")
         local objectId = ObjectGetId(TAR[i])
         exShowFloatingIntAtObject( objectId, money)
        end
    end
end
end

