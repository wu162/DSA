PLYNAME = {}
PLYNAME[1] = "$p1Name:"
PLYNAME[2] = "$p2Name:"
PLYNAME[3] = "$p3Name:"
PLYNAME[4] = "$p4Name:"
PLYNAME[5] = "$p5Name:"
PLYNAME[6] = "$p6Name:"
exScoreBoardSetVisibility(1)
-- 璁剧疆鏍囬鏂囧瓧
exScoreBoardSetTitle("閮ㄩ槦鏁伴噺")
-- 璁剧疆鏌愯鏌愬垪鐨勬枃瀛?
-- row 琛? 鑼冨洿1~7
-- col 鍒? 鑼冨洿1~3
for i = 1 , 6 , 1 do 
exScoreBoardSetText(PLYNAME[i], i, 1)
end
exScoreBoardSetText('褰撳墠鍥炲悎:',7, 2)

function boardact ()
local counterValue= exCounterGetByName("lvc");
for i = 1 , 6 , 1 do 
exScoreBoardSetText("   "..ANYUNITCOUNT[i], i, 2)
end
exScoreBoardSetText(""..counterValue, 7, 3)
exScoreBoardSetText("鎭堕瓟鏀诲嚮鍗曞厓", 1, 3)
exScoreBoardSetText("鎭堕瓟鏃剁┖绠＄悊", 2, 3)
exScoreBoardSetText("鎭堕瓟绌哄啗鍙镐护", 3, 3)
exScoreBoardSetText("澶╀娇鏀诲嚮鍗曞厓", 4, 3)
exScoreBoardSetText("澶╀娇鏃剁┖绠＄悊", 5, 3)
exScoreBoardSetText("澶╀娇绌哄啗鍙镐护", 6, 3)
end