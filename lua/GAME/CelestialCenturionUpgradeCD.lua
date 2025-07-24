CelestialCenturionUpgradeUseCount = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
}

SchedulerModule.call_every_x_frame(function()
    for i = 1, 6, 1 do
        local spellbookId = g_PlayerSpellBookId[i]
        if spellbookId ~= 0 and exObjectGetSpecialCountDownFrame(spellbookId, "SpecialPower_CelestialCenturionUpgrade") >= 2220 then
            ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", GetObjectById(spellbookId), "SpecialPower_CelestialCenturionUpgrade", 8);
        end
    end

end, 15, nil)