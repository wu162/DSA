if g_GameMode ~= 4 then
    LIMITPOWERC = LIMITPOWERC  + 2
    exEnableWBScript('POWERFLASHON')
end
g_TowerDestroyProgress = g_TowerDestroyProgress + 1;