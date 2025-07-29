PLYNAME = {}
PLYNAME[1] = "$p1Name:"
PLYNAME[2] = "$p2Name:"
PLYNAME[3] = "$p3Name:"
PLYNAME[4] = "$p4Name:"
PLYNAME[5] = "$p5Name:"
PLYNAME[6] = "$p6Name:"
exScoreBoardSetVisibility(1)
-- 设置标题文字
exScoreBoardSetTitle("部队数量")
-- 设置某行某列的文字
-- row 行  范围1~7
-- col 列  范围1~3
for i = 1 , 6 , 1 do
    exScoreBoardSetText(PLYNAME[i], i, 1)
end
exScoreBoardSetText('当前回合:',7, 2)

function boardact ()
    local counterValue= exCounterGetByName("lvc");
    for i = 1 , 6 , 1 do
        exScoreBoardSetText("   "..ANYUNITCOUNT[i], i, 2)
    end
    exScoreBoardSetText(""..counterValue, 7, 3)
    exScoreBoardSetText("恶魔1号", 1, 3)
    exScoreBoardSetText("恶魔2号", 2, 3)
    exScoreBoardSetText("恶魔3号", 3, 3)
    exScoreBoardSetText("天使1号", 4, 3)
    exScoreBoardSetText("天使2号", 5, 3)
    exScoreBoardSetText("天使3号", 6, 3)
end