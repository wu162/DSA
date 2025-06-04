
-- 鍒濆鍖栧畨鍏ㄩ殢鏈虹储寮曠敓鎴?
function GetSafeRandomIndex()
  local max_attempts = 30
  local attempts = 0
  local target = -1

  repeat
      target = RANDOMGENERATE(15, 0)
      attempts = attempts + 1
      -- 妫€鏌ョ储寮曟湁鏁堟€у強瀵硅薄瀛樻椿鐘舵€?
      if target >= 0 and target <= 15 and SA[target] ~= nil then
          if ObjectIsAlive(SA[target]) then
              return target
          end
      end
      Sleep(5)  -- 浼樺寲绛夊緟鏃堕棿
  until attempts >= max_attempts

  return -1  -- 杩斿洖鏃犳晥绱㈠紩琛ㄧず澶辫触
end
