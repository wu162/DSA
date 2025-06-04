 local countD  = GetPlayerAllUnitsValue('PlyrCivilian')
 local  countA = GetPlayerAllUnitsValue('PlyrCreeps')
 if countD>countA then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1',devil_money)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2',devil_money)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_3',devil_money)
 exAddTextToPublicBoard('鎭堕瓟鏂规湰鍥炲悎鑳?',10)
 if devil_max>=1200 then
  exAddTextToPublicBoard('鎭堕瓟鏂圭粓缁撹繛鑳?',10)
 end
 if angel_max>=1200 then
  exAddTextToPublicBoard('鎭堕瓟鏂规鍦ㄨ繛鑳?',10) 
 end
 devil_money=0
 angel_money=0
 if angel_max<4000 then
 angel_max=angel_max+400
 end
 devil_max=400
 elseif countD<countA then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4',angel_money)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5',angel_money)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_6',angel_money) 
   exAddTextToPublicBoard('澶╀娇鏂规湰鍥炲悎鑳?',10)  
   if devil_max>=1200 then
    exAddTextToPublicBoard('澶╀娇鏂规鍦ㄨ繛鑳?',10) 
   end
   if angel_max>=1200 then
    exAddTextToPublicBoard('澶╀娇鏂圭粓缁撹繛鑳?',10) 
   end
   devil_money=0
   angel_money=0
   angel_max=400
   if devil_max<4000 then
   devil_max=devil_max+400
   end
 else
   devil_money=0
 angel_money=0
 exAddTextToPublicBoard('鏈洖鍚堟殏鏃犺儨鑰?,10)
 end