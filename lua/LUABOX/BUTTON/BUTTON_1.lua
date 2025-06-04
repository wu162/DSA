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
exMessageAppendToMessageArea("鎭堕瓟鏂瑰彫鍞や簡闈掗緳鏍稿績鎴樻枟鑸帮紒") 
ExecuteAction("PLAY_SOUND_EFFECT","CEL_DragonShip_VoicePack") 
local counterValue = exCounterGetByName("lvc");
if counterValue > cutMCV then
local x1, y1, z1 = ObjectGetPosition(T74) ;
local sign = 1
local deltay = 100 
local realy = 0
for j = 1 , counterValue - cutMCV , 1 do
if j <= 3 then
--exMessageAppendToMessageArea("榫欒埞鏁伴噺锛?..i)
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
 exCenterTopBtnShowForPlayer(playerName, 1,'CEL_DragonShipLand','榫欒澶╀笅\n鍙敜鍥炲悎鏁板噺涓夌殑榫欒埞鏁伴噺浜庝富宸ㄧ偖浣嶇疆,涓婇檺涓嶅緱瓒呰繃涓夎墭(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 1 and btnIndex == 1 and Player1CD1==0 then
 exMessageAppendToMessageArea("鎭堕瓟鏂逛娇鐢ㄤ簡灞€閮ㄦ潃浼ゆ€ф鍣紒")
 ExecuteAction("PLAY_SOUND_EFFECT","A01_CoastalGun_ImpactExplosion") 
 exEnableWBScript("KW");
 Player1CD1=1
 exCenterTopBtnSetEnableForPlayer(playerName, 1, 0) 
 exCenterTopBtnShowForPlayer(playerName, 1,'Button_SovietTeslaMissile','灞€閮ㄦ瘉鐏鍣╘n鎽ф瘉涓€澶х墖鍦板尯鐨勬墍鏈夋晫鏂瑰崟浣?宸蹭娇鐢?') 
 end
 if playerName == "Player_".. 2 and btnIndex == 1 and Player2CD1<2 then
 exMessageAppendToMessageArea("鎭堕瓟鏂瑰彂琛ㄤ簡閾佸箷婕旇锛?)
 Player2CD1=Player2CD1+1
 ExecuteAction("PLAY_SOUND_EFFECT","SOV_IronCurtain_Cast") 
 local TAR, count = ObjectFindObjects(P[7],nil,FilterALLUNIT)
 for j = 1 , count , 1 do
 ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
 end
 if Player2CD1>=2 then
 exCenterTopBtnSetEnableForPlayer(playerName, 1, 0) 
 exCenterTopBtnShowForPlayer(playerName, 1,'Button_PlayerPower_IronCurtain','閾佸箷婕旇\n杩涜閾佸箷婕旇,璁╁叏浣撳崟浣嶅涓婂潥涓嶅彲鎽х殑閾佸箷锛屾寔缁?5绉?宸蹭娇鐢?')
 end
 end
 if playerName == "Player_".. 6 and btnIndex == 1 and Player6CD1==0 then
 exMessageAppendToMessageArea("澶╀娇鏂瑰彫鍞や簡闈掗緳鏍稿績鎴樻枟鑸帮紒")
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
 exCenterTopBtnShowForPlayer(playerName, 1,'CEL_DragonShipLand','榫欒澶╀笅\n鍙敜鍥炲悎鏁板噺涓夌殑榫欒埞鏁伴噺浜庝富宸ㄧ偖浣嶇疆,涓婇檺涓嶅緱瓒呰繃涓夎墭(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 4 and btnIndex == 1 and Player4CD1==0 then 
 exMessageAppendToMessageArea("澶╀娇鏂逛娇鐢ㄤ簡灞€閮ㄦ潃浼ゆ€ф鍣紒")
 ExecuteAction("PLAY_SOUND_EFFECT","A01_CoastalGun_ImpactExplosion") 
 exEnableWBScript("KB");
 Player4CD1=1
 exCenterTopBtnSetEnableForPlayer(playerName, 1, 0);
 exCenterTopBtnShowForPlayer(playerName, 1,'Button_SovietTeslaMissile','灞€閮ㄦ瘉鐏鍣╘n鎽ф瘉涓€澶х墖鍦板尯鐨勬墍鏈夋晫鏂瑰崟浣?宸蹭娇鐢?') 
 end
 if playerName == "Player_".. 5 and btnIndex == 1 and Player5CD1<2 then 
 exMessageAppendToMessageArea("澶╀娇鏂瑰彂琛ㄤ簡閾佸箷婕旇锛?)
 Player5CD1=Player5CD1+1
 ExecuteAction("PLAY_SOUND_EFFECT","SOV_IronCurtain_Cast") 
 local TAR, count = ObjectFindObjects(P[8],nil,FilterALLUNIT)
 for j = 1 , count , 1 do
 ObjectLoadAttributeModifier(TAR[j], "AttributeModifier_IronCurtain", 225)
 end
 if Player5CD1>=2 then
 exCenterTopBtnSetEnableForPlayer(playerName, 1, 0); 
 exCenterTopBtnShowForPlayer(playerName, 1,'Button_PlayerPower_IronCurtain','閾佸箷婕旇\n杩涜閾佸箷婕旇,璁╁叏浣撳崟浣嶅涓婂潥涓嶅彲鎽х殑閾佸箷锛屾寔缁?5绉?宸蹭娇鐢?') 
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
 exMessageAppendToMessageArea("鎭堕瓟鏂圭珶鐒惰鏃堕棿鍋滄锛?) 
 ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Off") 
 exEnableWBScript("devilstop");
 Player2CD2=1
 exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0) 
 exCenterTopBtnShowForPlayer(playerName, btnIndex,'AUA_Timebelt','鏃剁┖绠＄悊灞€\n鍊熷姪鏈潵绉戞妧鐨勫姏閲忔椂鍋滃鏂瑰崟浣?0s(宸蹭娇鐢?') 
 end
if playerName == "Player_".. 5 and btnIndex == 2 and Player5CD2==0 then
 exMessageAppendToMessageArea("澶╀娇鏂圭珶鐒惰鏃堕棿鍋滄锛?) 
 ExecuteAction("PLAY_SOUND_EFFECT","ALL_Chronosphere_Off") 
 exEnableWBScript("angelstop");
 Player5CD2=1
 exCenterTopBtnSetEnableForPlayer(playerName,btnIndex, 0) 
 exCenterTopBtnShowForPlayer(playerName, btnIndex,'AUA_Timebelt','鏃剁┖绠＄悊灞€\n鍊熷姪鏈潵绉戞妧鐨勫姏閲忔椂鍋滃鏂瑰崟浣?0s(宸蹭娇鐢?') 
 end
 if playerName == "Player_".. 3 and btnIndex == 2 and Player3CD2<2 then
 exMessageAppendToMessageArea("鎭堕瓟鏂硅姹備簡绌哄啗鍏冨竻锛?) 
 ExecuteAction("PLAY_SOUND_EFFECT","SOV_SukhoiInterceptor_VoiceAttack") 
 ExecuteAction("PLAY_SOUND_EFFECT","CEL_NukeIncoming") 
 exEnableWBScript("devil_air");
 Player3CD2=Player3CD2+1
 if Player3CD2>=2 then
 exCenterTopBtnSetEnableForPlayer('Player_3',2, 0) 
 exCenterTopBtnShowForPlayer('Player_3',2,'Button_SovietInterceptorAircraft','绌哄啗鍏冨竻\n璇锋眰瓒呯骇鑻忛湇浼婄兢鎶佃揪鎴樺満瀵规晫鏂圭殑绌哄啗閫犳垚姣佺伃鎬х殑鏀诲嚮(宸蹭娇鐢?') 
 end
 end
 if playerName == "Player_".. 6 and btnIndex == 2 and Player6CD2<2 then
 exMessageAppendToMessageArea("澶╀娇鏂硅姹備簡绌哄啗鍏冨竻锛?) 
 ExecuteAction("PLAY_SOUND_EFFECT","SOV_SukhoiInterceptor_VoiceAttack") 
 ExecuteAction("PLAY_SOUND_EFFECT","CEL_NukeIncoming") 
 exEnableWBScript("angel_air");
 Player6CD2=Player6CD2+1
 if Player6CD2>=2 then
 exCenterTopBtnSetEnableForPlayer('Player_6',2, 0) 
 exCenterTopBtnShowForPlayer('Player_6',2,'Button_SovietInterceptorAircraft','绌哄啗鍏冨竻\n璇锋眰瓒呯骇鑻忛湇浼婄兢鎶佃揪鎴樺満瀵规晫鏂圭殑绌哄啗閫犳垚姣佺伃鎬х殑鏀诲嚮(宸蹭娇鐢?') 
 end
 end
 if playerName == "Player_".. 1 and btnIndex == 2 and Player1CD2<2 then
 exMessageAppendToMessageArea("鎭堕瓟鏂硅惤涓嬩簡杈炬懇鍏嬪埄鏂箣鍓戯紒") 
 ExecuteAction("PLAY_SOUND_EFFECT","CelestialEnergyGatling_Select")
 exEnableWBScript("devil_nemesisplay");
 Player1CD2=Player1CD2+1
 if Player1CD2>=2 then
 exCenterTopBtnSetEnableForPlayer('Player_1',2, 0) 
 exCenterTopBtnShowForPlayer('Player_1',2,'Button_CelestialPantaOrbitalStrike','杈炬懇鍏嬪埄鏂箣鍓慭n璇锋眰澶┖鐨勫崼鏄熷鏁屾柟鍚敤15绉掔殑绮惧噯鍗槦鎵撳嚮(宸蹭娇鐢?') 
 end
 end
 if playerName == "Player_".. 4 and btnIndex == 2 and Player4CD2<2 then
 exMessageAppendToMessageArea("澶╀娇鏂硅惤涓嬩簡杈炬懇鍏嬪埄鏂箣鍓戯紒") 
 ExecuteAction("PLAY_SOUND_EFFECT","CelestialEnergyGatling_Select")
 exEnableWBScript("angel_nemesisplay");
 Player4CD2=Player4CD2+1
 if Player4CD2>=2 then
 exCenterTopBtnSetEnableForPlayer('Player_4',2, 0) 
 exCenterTopBtnShowForPlayer('Player_4',2,'Button_CelestialPantaOrbitalStrike','杈炬懇鍏嬪埄鏂箣鍓慭n璇锋眰澶┖鐨勫崼鏄熷鏁屾柟鍚敤15绉掔殑绮惧噯鍗槦鎵撳嚮(宸蹭娇鐢?') 
 end
 end
 if playerName == "Player_".. 1 and btnIndex == 6 and Player1CD6==0 then 
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("鎭堕瓟$p1Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player1CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 2 and btnIndex == 6 and Player2CD6==0 then 
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("鎭堕瓟$p2Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player2CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 3 and btnIndex == 6 and Player3CD6==0 then 
  devil_surrender=0
  exEnableWBScript("PlyrCivilian/devil_surrender")
  exAddTextToPublicBoard("鎭堕瓟$p3Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_1',201,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_2',202,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_3',203,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player3CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 4 and btnIndex == 6 and Player4CD6==0 then 
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("澶╀娇$p4Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player4CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 5 and btnIndex == 6 and Player5CD6==0 then 
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("澶╀娇$p5Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player5CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_".. 6 and btnIndex == 6 and Player6CD6==0 then 
  angel_surrender=0
  exEnableWBScript("PlyrCreeps/angel_surrender")
  exAddTextToPublicBoard("澶╀娇$p6Name鍙戣捣浜嗘姇闄?,10)
  exShowLongTextDialogForPlayer('Player_4',204,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_5',205,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  exShowLongTextDialogForPlayer('Player_6',206,'                                                          姝ｅ湪鎶曠エ\n瑙勫垯:鎶曢檷澶т簬鎴樻枟鍒欎负鎴愬姛鎶曢檷,绁ㄦ暟鐩哥瓑浼氱户缁父鎴廫n鍏ㄥ眬姣忎釜浜哄彧鑳藉彂鍔ㄤ竴娆℃姇闄?,'鎶曢檷','寮冩潈','鎴樻枟')
  Player6CD6=1
  exCenterTopBtnShowForPlayer(playerName, 6,'Allied_topmenu_infantry','鎶曢檷\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙(宸蹭娇鐢?')
 end
 if playerName == "Player_1" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'..devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 elseif playerName == "Player_2" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 elseif playerName == "Player_3" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 elseif playerName == "Player_4" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
 elseif playerName == "Player_5" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
 elseif playerName == "Player_6" and btnIndex == 4 then 
 local round = exCounterGetByName("lvc")
 exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
 end
 end