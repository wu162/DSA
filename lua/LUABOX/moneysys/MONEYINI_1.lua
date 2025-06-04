FilterPowerAllied=CreateObjectFilter({
  Rule="ANY",
  Relationship="SAME_PLAYER",
  IncludeThing = {
 "AlliedPowerPlant"
  }
})
function addmoneyAllied  (money)
for playindex = 1 , 6 , 1 do 
  if EvaluateCondition("NAMED_NOT_DESTROYED",'PlayerA_'..playindex) then
-- exMessageAppendToMessageArea("鎵ц")
local TAR, count = ObjectFindObjects(P[playindex], nil,FilterPowerAllied)
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
 end