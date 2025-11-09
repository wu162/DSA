if g_GameMode ~= 4 then
    exEnableWBScript('Player_4/UNLOCK2__4')
    exEnableWBScript('Player_5/UNLOCK2__5')
    exEnableWBScript('Player_6/UNLOCK2__6')
    ExecuteAction("UNIT_KILL_ALL_IN_AREA", "PlyrCreeps", "nofire51")
end