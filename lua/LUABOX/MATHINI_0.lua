function floor(num)
  -- 澶勭悊姝ｆ暟
  if num >= 0 then
      local integer = 0
      while integer + 1 <= num do
          integer = integer + 1
      end
      return integer
  -- 澶勭悊璐熸暟
  else
      local integer = 0
      while integer - 1 >= num do
          integer = integer - 1
      end
      return integer
  end
end
function RANDOMGENERATE(MAX, MIN)
  -- 澶勭悊MAX <= MIN鐨勬儏鍐?
  if MAX <= MIN then
      return MAX
  end

  local ZERODELTA = 0
if MIN < 0 then
    ZERODELTA = -MIN
end
local MININ = MIN + ZERODELTA  -- 杞崲涓洪潪璐熸暟鍧愭爣绯?
local MAXIN = MAX + ZERODELTA

  local range = MAXIN - MININ + 1
  local randomNum = 0

  -- 鐢熸垚16浣嶉殢鏈烘暟锛?-65535锛?
  for i = 1, 16 do
      randomNum = randomNum * 2 + GetRandomNumber()
      if randomNum < 0 then break end  -- 闃叉鏁板€兼孩鍑?
  end

  -- 纭繚鏁板€艰惤鍦ㄦ湁鏁堣寖鍥?
  while randomNum >= range do
      randomNum = randomNum - range
  end

  -- 鏈€缁堟暣鏁板寲杈撳嚭
  local final = floor(MININ + randomNum) + ZERODELTA
  return final
end