-- 4 paired rows present all 8 players without writing beyond 7 engine rows.
PLYNAME = {}
for i = 1, 8, 1 do PLYNAME[i] = "$p" .. i .. "Name:" end
exScoreBoardSetVisibility(1)
function boardact()
    local round = exCounterGetByName("lvc") or 0
    exScoreBoardSetTitle(Localization.get("board.title.troop_count") .. "  " ..
        Localization.get("board.title.current_round") .. tostring(round))
    local devils, angels = g_SideSeatsOf(7) or {}, g_SideSeatsOf(8) or {}
    for row = 1, 4, 1 do
        local d, a = devils[row], angels[row]
        if d ~= nil and a ~= nil then
            exScoreBoardSetText(PLYNAME[d] .. " " .. tostring(ANYUNITCOUNT[d] or 0), row, 1)
            exScoreBoardSetText("VS", row, 2)
            exScoreBoardSetText(PLYNAME[a] .. " " .. tostring(ANYUNITCOUNT[a] or 0), row, 3)
        end
    end
end
boardact()