for i=1,8,1 do
  if g_IsDevilSeat(i) then
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'PlyrCivilian','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'PlyrCreeps','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_4','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_5','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_6','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_1','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_2','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_3','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER",'PlyrCreeps',"Player_"..i,'Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER",'PlyrCivilian',"Player_"..i,'Friend')
  elseif i>3 then
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'PlyrCivilian','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'PlyrCreeps','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_4','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_5','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_6','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_1','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_2','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER","Player_"..i,'Player_3','Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER",'PlyrCreeps',"Player_"..i,'Friend')
    ExecuteAction("PLAYER_RELATES_PLAYER",'PlyrCivilian',"Player_"..i,'Friend')
  end
end