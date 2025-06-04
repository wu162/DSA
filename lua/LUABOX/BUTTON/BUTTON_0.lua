T84= GetObjectByScriptName('T84')
T74= GetObjectByScriptName('T74')
      BOMB = {}
      BOMBID = {}
      exCenterTopBtnsChangeVisibility(1)
      exCenterTopBtnSetHealthBarVisibility(1,1);
        exCenterTopBtnShowForPlayer('Player_1', 1,'Button_SovietTeslaMissile','灞€閮ㄦ瘉鐏鍣?鍏ㄥ眬浠呴檺涓€娆?\n鎽ф瘉涓€澶х墖鍦板尯鐨勬墍鏈夋晫鏂瑰崟浣?)
        exCenterTopBtnShowForPlayer('Player_1',2,'Button_CelestialPantaOrbitalStrike','杈炬懇鍏嬪埄鏂箣鍓?鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n璇锋眰澶┖鐨勫崼鏄熷鏁屾柟鍚敤15绉掔殑绮惧噯鍗槦鎵撳嚮')
        exCenterTopBtnShowForPlayer('Player_2', 1,'Button_PlayerPower_IronCurtain','閾佸箷婕旇(鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n杩涜閾佸箷婕旇,璁╁叏浣撳崟浣嶅涓婂潥涓嶅彲鎽х殑閾佸箷锛屾寔缁?5绉?)
        exCenterTopBtnShowForPlayer('Player_2', 2,'AUA_Timebelt','鏃剁┖绠＄悊灞€(鍏ㄥ眬浠呴檺涓€娆?\n鍊熷姪鏈潵绉戞妧鐨勫姏閲忔椂鍋滃鏂瑰崟浣?0s')
        exCenterTopBtnShowForPlayer('Player_3', 1,'CEL_DragonShipLand','榫欒澶╀笅(鍏ㄥ眬浠呴檺涓€娆?\n鍙敜鍥炲悎鏁板噺涓夌殑榫欒埞鏁伴噺浜庝富宸ㄧ偖浣嶇疆,涓婇檺涓嶅緱瓒呰繃涓夎墭')
        exCenterTopBtnShowForPlayer('Player_3', 2,'Button_SovietInterceptorAircraft','绌哄啗鍏冨竻(鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n璇锋眰瓒呯骇鑻忛湇浼婄兢鎶佃揪鎴樺満瀵规晫鏂圭殑绌哄啗閫犳垚姣佺伃鎬х殑鏀诲嚮') 
        exCenterTopBtnShowForPlayer('Player_4', 1,'Button_SovietTeslaMissile','灞€閮ㄦ瘉鐏鍣?鍏ㄥ眬浠呴檺涓€娆?\n鎽ф瘉涓€澶х墖鍦板尯鐨勬墍鏈夋晫鏂瑰崟浣?)
        exCenterTopBtnShowForPlayer('Player_4',2,'Button_CelestialPantaOrbitalStrike','杈炬懇鍏嬪埄鏂箣鍓?鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n璇锋眰澶┖鐨勫崼鏄熷鏁屾柟鍚敤15绉掔殑绮惧噯鍗槦鎵撳嚮')  
        exCenterTopBtnShowForPlayer('Player_5', 1,'Button_PlayerPower_IronCurtain','閾佸箷婕旇(鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n杩涜閾佸箷婕旇,璁╁叏浣撳崟浣嶅涓婂潥涓嶅彲鎽х殑閾佸箷鎸佺画15绉?)
        exCenterTopBtnShowForPlayer('Player_5', 2,'AUA_Timebelt','鏃剁┖绠＄悊灞€(鍏ㄥ眬浠呴檺涓€娆?\n鍊熷姪鏈潵绉戞妧鐨勫姏閲忔椂鍋滃鏂瑰崟浣?0s')
        exCenterTopBtnShowForPlayer('Player_6', 1,'CEL_DragonShipLand','榫欒澶╀笅(鍏ㄥ眬浠呴檺涓€娆?\n鍙敜鍥炲悎鏁板噺涓夌殑榫欒埞鏁伴噺浜庝富宸ㄧ偖浣嶇疆,涓婇檺涓嶅緱瓒呰繃涓夎墭')
        exCenterTopBtnShowForPlayer('Player_6', 2,'Button_SovietInterceptorAircraft','绌哄啗鍏冨竻(鍏ㄥ眬鍙娇鐢ㄤ袱娆?\n璇锋眰瓒呯骇鑻忛湇浼婄兢鎶佃揪鎴樺満瀵规晫鏂圭殑绌哄啗閫犳垚姣佺伃鎬х殑鏀诲嚮') 
      for i = 1 , 6 , 1 do
        exCenterTopBtnShowForPlayer('Player_'..i, 4,'Button_PlayerPower_FreeTrade','浜ゆ槗甯傚満\n璐拱鐞嗚储椤圭洰鎴栬€呭畾鍚戣浆绉昏祫閲?)
        exCenterTopBtnShowForPlayer('Player_'..i, 6,'Allied_topmenu_infantry','鎶曢檷(涓€浜轰粎鑳戒娇鐢ㄤ竴娆?\n鍙紑涓€娆′弗鑲冪殑浼氳璇曞浘缁撴潫娓告垙')
        BOMB[i] = GetObjectByScriptName("BOMB"..i) ;
        local objectId = ObjectGetId(BOMB[i])
        BOMBID[i] = objectId
      end
      
      FilterMCVC=CreateObjectFilter({
          Rule="ANY",
          Relationship="SAME_PLAYER",
          IncludeThing = {
          "CelestialMCV"
          }
        })
      
        FilterALLUNIT=CreateObjectFilter({
          Rule="ANY",
          Relationship="SAME_PLAYER",
          Include="SELECTABLE"--exMessageAppendToMessageArea
        })