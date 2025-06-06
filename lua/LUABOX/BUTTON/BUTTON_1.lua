Player1CD1=0
Player2CD1=0
Player3CD1=0
Player4CD1=0
Player5CD1=0
Player6CD1=0
Player1CD3=0
Player2CD3=0
Player3CD3=0
Player4CD3=0
Player5CD3=0
Player6CD3=0
Player1CD2=0
Player2CD2=0
Player3CD2=0
Player4CD2=0
Player5CD2=0
Player6CD2=0
Player1CD5=0
Player2CD5=0
Player3CD5=0
Player4CD5=0
Player5CD5=0
Player6CD5=0
Player1CD6=0
Player2CD6=0
Player3CD6=0
Player4CD6=0
Player5CD6=0
Player6CD6=0
angel_money=0
devil_money=0
devil_surrender=0
angel_surrender=0
function onCenterTopBtnClickEvent(playerName, btnIndex)
 local cutMCV = 3
 if playerName == "Player_".. 3 and btnIndex == 1 and Player3CD1==0 then
  exMessageAppendToMessageArea("¶ñÄ§·½ÕÙ»½ÁËÇàÁúºËÐÄÕ½¶·½¢£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","CEL_DragonShip_VoicePack")
  local counterValue = exCounterGetByName("lvc");
  if counterValue > cutMCV then
   local x1, y1, z1 = ObjectGetPosition(T74) ;
   local sign = 1
   local deltay = 100
   local realy = 0
   for j = 1 , counterValue - cutMCV , 1 do
    if j <= 3 then
     --exMessageAppendToMessageArea("Áú´¬ÊýÁ¿£º"..i)
     sign = ( sign ) * (-1)
     deltay = deltay * (-1)
     realy = ( realy + deltay ) * sign
     ExecuteAction("CREATE_OBJECT",'CelestialMCV','PlyrCivilian/ATTACK',{X=x1 ,Y=y1 + realy ,Z=z1},"0")
    end
    exEnableWBScript("MCVhealthD");
   end
  end
  Player3CD1=1
  exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
  exCenterTopBtnShowForPlayer(playerName, 1,'CEL_DragonShipLand','ÁúÐÐÌìÏÂ\nÕÙ»½»ØºÏÊý¼õÈýµÄÁú´¬ÊýÁ¿ÓÚÖ÷¾ÞÅÚÎ»ÖÃ,ÉÏÏÞ²»µÃ³¬¹ýÈýËÒ(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 1 and btnIndex == 1 and Player1CD1==0 then
  exMessageAppendToMessageArea("¶ñÄ§·½Ê¹ÓÃÁË¾Ö²¿É±ÉËÐÔÎäÆ÷£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","A01_CoastalGun_ImpactExplosion")
  exEnableWBScript("KW");
  Player1CD1=1
  exCenterTopBtnSetEnableForPlayer(playerName, 1, 0)
  exCenterTopBtnShowForPlayer(playerName, 1,'Button_SovietTeslaMissile','¾Ö²¿»ÙÃðÎäÆ÷\n´Ý»ÙÒ»´óÆ¬µØÇøµÄËùÓÐµÐ·½µ¥Î»(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 2 and btnIndex == 1 and Player2CD1<2 then
  exMessageAppendToMessageArea("¶ñÄ§·½·¢±íÁËÌúÄ»ÑÝËµ£¡")
  Player2CD1=Player2CD1+1
  ExecuteAction("PLAY_SOUND_EFFECT","SOV_IronCurtain_Cast")
  local TAR, count = ObjectFindObjects(P[7],nil,FilterALLUNIT)
  for j = 1 , count , 1 do
   ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
  end
  if Player2CD1>=2 then
   exCenterTopBtnSetEnableForPlayer(playerName, 1, 0)
   exCenterTopBtnShowForPlayer(playerName, 1,'Button_PlayerPower_IronCurtain','ÌúÄ»ÑÝËµ\n½øÐÐÌúÄ»ÑÝËµ,ÈÃÈ«Ìåµ¥Î»Ì×ÉÏ¼á²»¿É´ÝµÄÌúÄ»£¬³ÖÐø15Ãë(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 6 and btnIndex == 1 and Player6CD1==0 then
  exMessageAppendToMessageArea("ÌìÊ¹·½ÕÙ»½ÁËÇàÁúºËÐÄÕ½¶·½¢£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","CEL_DragonShip_VoicePack")
  local counterValue = exCounterGetByName("lvc");
  if counterValue > cutMCV then
   local x1, y1, z1 = ObjectGetPosition(T84) ;
   local sign = 1
   local deltay = 100
   local realy = 0
   for j = 1 , counterValue - cutMCV , 1 do
    if j <= 3 then
     sign = ( sign ) * (-1)
     deltay = deltay * (-1)
     realy = ( realy + deltay ) * sign
     ExecuteAction("CREATE_OBJECT",'CelestialMCV','PlyrCreeps/ATTACK',{X=x1 ,Y=y1 + realy ,Z=z1},"180")
    end
    exEnableWBScript("MCVhealthA");
   end
  end
  Player6CD1=1
  exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
  exCenterTopBtnShowForPlayer(playerName, 1,'CEL_DragonShipLand','ÁúÐÐÌìÏÂ\nÕÙ»½»ØºÏÊý¼õÈýµÄÁú´¬ÊýÁ¿ÓÚÖ÷¾ÞÅÚÎ»ÖÃ,ÉÏÏÞ²»µÃ³¬¹ýÈýËÒ(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 4 and btnIndex == 1 and Player4CD1==0 then
  exMessageAppendToMessageArea("ÌìÊ¹·½Ê¹ÓÃÁË¾Ö²¿É±ÉËÐÔÎäÆ÷£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","A01_CoastalGun_ImpactExplosion")
  exEnableWBScript("KB");
  Player4CD1=1
  exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
  exCenterTopBtnShowForPlayer(playerName, 1,'Button_SovietTeslaMissile','¾Ö²¿»ÙÃðÎäÆ÷\n´Ý»ÙÒ»´óÆ¬µØÇøµÄËùÓÐµÐ·½µ¥Î»(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 5 and btnIndex == 1 and Player5CD1<2 then
  exMessageAppendToMessageArea("ÌìÊ¹·½·¢±íÁËÌúÄ»ÑÝËµ£¡")
  Player5CD1=Player5CD1+1
  ExecuteAction("PLAY_SOUND_EFFECT","SOV_IronCurtain_Cast")
  local TAR, count = ObjectFindObjects(P[8],nil,FilterALLUNIT)
  for j = 1 , count , 1 do
   ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
  end
  if Player5CD1>=2 then
   exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
   exCenterTopBtnShowForPlayer(playerName, 1,'Button_PlayerPower_IronCurtain','ÌúÄ»ÑÝËµ\n½øÐÐÌúÄ»ÑÝËµ,ÈÃÈ«Ìåµ¥Î»Ì×ÉÏ¼á²»¿É´ÝµÄÌúÄ»£¬³ÖÐø15Ãë(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 1 and btnIndex == 3 and Player1CD3==0 then
  exEnableWBScript("PlyrCivilian/devilASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player1CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 2 and btnIndex == 3 and Player2CD3==0 then
  exEnableWBScript("PlyrCivilian/devilASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player2CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 3 and btnIndex == 3 and Player3CD3==0 then
  exEnableWBScript("PlyrCivilian/devilASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player3CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 4 and btnIndex == 3 and Player4CD3==0 then
  exEnableWBScript("PlyrCreeps/angelASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player4CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 5 and btnIndex == 3 and Player5CD3==0 then
  exEnableWBScript("PlyrCreeps/angelASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player5CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 6 and btnIndex == 3 and Player6CD3==0 then
  exEnableWBScript("PlyrCreeps/angelASuper");
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Die")
  Player6CD3=3
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0);
 end
 if playerName == "Player_".. 2 and btnIndex == 2 and Player2CD2==0 then
  exMessageAppendToMessageArea("¶ñÄ§·½¾¹È»ÈÃÊ±¼äÍ£Ö¹£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Off")
  exEnableWBScript("devilstop");
  Player2CD2=1
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0)
  exCenterTopBtnShowForPlayer(playerName, btnIndex,'AUA_Timebelt','Ê±¿Õ¹ÜÀí¾Ö\n½èÖúÎ´À´¿Æ¼¼µÄÁ¦Á¿Ê±Í£¶Ô·½µ¥Î»30s(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 5 and btnIndex == 2 and Player5CD2==0 then
  exMessageAppendToMessageArea("ÌìÊ¹·½¾¹È»ÈÃÊ±¼äÍ£Ö¹£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Off")
  exEnableWBScript("angelstop");
  Player5CD2=1
  exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0)
  exCenterTopBtnShowForPlayer(playerName, btnIndex,'AUA_Timebelt','Ê±¿Õ¹ÜÀí¾Ö\n½èÖúÎ´À´¿Æ¼¼µÄÁ¦Á¿Ê±Í£¶Ô·½µ¥Î»30s(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 3 and btnIndex == 2 and Player3CD2<2 then
  exMessageAppendToMessageArea("¶ñÄ§·½ÇëÇóÁË¿Õ¾üÔªË§£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","SOV_SukhoiInterceptor_VoiceAttack")
  ExecuteAction("PLAY_SOUND_EFFECT","CEL_NukeIncoming")
  exEnableWBScript("devil_air");
  Player3CD2=Player3CD2+1
  if Player3CD2>=2 then
   exCenterTopBtnSetEnableForPlayer('Player_3',2, 0)
   exCenterTopBtnShowForPlayer('Player_3',2,'Button_SovietInterceptorAircraft','¿Õ¾üÔªË§\nÇëÇó³¬¼¶ËÕ»ôÒÁÈºµÖ´ïÕ½³¡¶ÔµÐ·½µÄ¿Õ¾üÔì³É»ÙÃðÐÔµÄ¹¥»÷(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 6 and btnIndex == 2 and Player6CD2<2 then
  exMessageAppendToMessageArea("ÌìÊ¹·½ÇëÇóÁË¿Õ¾üÔªË§£¡")
  ExecuteAction("PLAY_SOUND_EFFECT","SOV_SukhoiInterceptor_VoiceAttack")
  ExecuteAction("PLAY_SOUND_EFFECT","CEL_NukeIncoming")
  exEnableWBScript("angel_air");
  Player6CD2=Player6CD2+1
  if Player6CD2>=2 then
   exCenterTopBtnSetEnableForPlayer('Player_6',2, 0)
   exCenterTopBtnShowForPlayer('Player_6',2,'Button_SovietInterceptorAircraft','¿Õ¾üÔªË§\nÇëÇó³¬¼¶ËÕ»ôÒÁÈºµÖ´ïÕ½³¡¶ÔµÐ·½µÄ¿Õ¾üÔì³É»ÙÃðÐÔµÄ¹¥»÷(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 1 and btnIndex == 2 and Player1CD2<2 then
  exMessageAppendToMessageArea("¶ñÄ§·½ÂäÏÂÁË´ïÄ¦¿ËÀûË¹Ö®½££¡")
  ExecuteAction("PLAY_SOUND_EFFECT","CelestialEnergyGatling_Select")
  exEnableWBScript("devil_nemesisplay");
  Player1CD2=Player1CD2+1
  if Player1CD2>=2 then
   exCenterTopBtnSetEnableForPlayer('Player_1',2, 0)
   exCenterTopBtnShowForPlayer('Player_1',2,'Button_CelestialPantaOrbitalStrike','´ïÄ¦¿ËÀûË¹Ö®½£\nÇëÇóÌ«¿ÕµÄÎÀÐÇ¶ÔµÐ·½ÆôÓÃ15ÃëµÄ¾«×¼ÎÀÐÇ´ò»÷(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 4 and btnIndex == 2 and Player4CD2<2 then
  exMessageAppendToMessageArea("ÌìÊ¹·½ÂäÏÂÁË´ïÄ¦¿ËÀûË¹Ö®½££¡")
  ExecuteAction("PLAY_SOUND_EFFECT","CelestialEnergyGatling_Select")
  exEnableWBScript("angel_nemesisplay");
  Player4CD2=Player4CD2+1
  if Player4CD2>=2 then
   exCenterTopBtnSetEnableForPlayer('Player_4',2, 0)
   exCenterTopBtnShowForPlayer('Player_4',2,'Button_CelestialPantaOrbitalStrike','´ïÄ¦¿ËÀûË¹Ö®½£\nÇëÇóÌ«¿ÕµÄÎÀÐÇ¶ÔµÐ·½ÆôÓÃ15ÃëµÄ¾«×¼ÎÀÐÇ´ò»÷(ÒÑÊ¹ÓÃ)')
  end
 end
 if playerName == "Player_".. 1 and btnIndex == 6 and Player1CD6==0 then
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("¶ñÄ§$p1Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player1CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 2 and btnIndex == 6 and Player2CD6==0 then
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("¶ñÄ§$p2Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player2CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 3 and btnIndex == 6 and Player3CD6==0 then
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("¶ñÄ§$p3Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player3CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 4 and btnIndex == 6 and Player4CD6==0 then
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("ÌìÊ¹$p4Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player4CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 5 and btnIndex == 6 and Player5CD6==0 then
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("ÌìÊ¹$p5Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player5CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_".. 6 and btnIndex == 6 and Player6CD6==0 then
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("ÌìÊ¹$p6Name·¢ÆðÁËÍ¶½µ",10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          ÕýÔÚÍ¶Æ±\n¹æÔò:Í¶½µ´óÓÚÕ½¶·ÔòÎª³É¹¦Í¶½µ,Æ±ÊýÏàµÈ»á¼ÌÐøÓÎÏ·\nÈ«¾ÖÃ¿¸öÈËÖ»ÄÜ·¢¶¯Ò»´ÎÍ¶½µ','Í¶½µ','ÆúÈ¨','Õ½¶·')
  Player6CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','Í¶½µ\nÕÙ¿ªÒ»´ÎÑÏËàµÄ»áÒéÊÔÍ¼½áÊøÓÎÏ·(ÒÑÊ¹ÓÃ)')
 end
 if playerName == "Player_1" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,101,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'..devil_max..'):'..devil_money,'Ïò¶ñÄ§Ê±¿Õ¹ÜÀíÔ±×ªÒÆ1000×Ê½ð','Ïò¶ñÄ§¿Õ¾üË¾Áî×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100¶ñÄ§Í¶×Ê','','','')
 elseif playerName == "Player_2" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,102,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'.. devil_max..'):'..devil_money,'Ïò¶ñÄ§¹¥»÷µ¥Ôª×ªÒÆ1000×Ê½ð','Ïò¶ñÄ§¿Õ¾üË¾Áî×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100¶ñÄ§Í¶×Ê','','','')
 elseif playerName == "Player_3" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,103,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'.. devil_max..'):'..devil_money,'Ïò¶ñÄ§¹¥»÷µ¥Ôª×ªÒÆ1000×Ê½ð','Ïò¶ñÄ§Ê±¿Õ¹ÜÀíÔ±×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100¶ñÄ§Í¶×Ê','','','')
 elseif playerName == "Player_4" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,104,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'.. angel_max..'):'..angel_money,'ÏòÌìÊ¹Ê±¿Õ¹ÜÀíÔ±×ªÒÆ1000×Ê½ð','ÏòÌìÊ¹¿Õ¾üË¾Áî×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100ÌìÊ¹Í¶×Ê','','','')
 elseif playerName == "Player_5" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,105,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'.. angel_max..'):'..angel_money,'ÏòÌìÊ¹¹¥»÷µ¥Ôª×ªÒÆ1000×Ê½ð','ÏòÌìÊ¹¿Õ¾üË¾Áî×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100ÌìÊ¹Í¶×Ê','','','')
 elseif playerName == "Player_6" and btnIndex == 4 then
  local round = exCounterGetByName("lvc")
  exShowCustomBtnChoiceDialogForPlayer(playerName,106,'»¶Ó­½øÈë½»Ò×ÊÐ³¡\nÍ¶×Ê½ð¶î(ÉÏÏÞ'.. angel_max..'):'..angel_money,'ÏòÌìÊ¹¹¥»÷µ¥Ôª×ªÒÆ1000×Ê½ð','ÏòÌìÊ¹Ê±¿Õ¹ÜÀíÔ±×ªÒÆ1000×Ê½ð','»Øµ½Õ½³¡','¹ºÂò100ÌìÊ¹Í¶×Ê','','','')
 end
end