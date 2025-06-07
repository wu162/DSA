g_PlayerSpellBookId = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

for i = 1, 6, 1 do
    if exObjectGetInstanceId(i) == 1627485 then
        g_PlayerSpellBookId[i] = i
    end
end