CelestialCenturionUpgradeUseCount = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [4] = 1,
    [5] = 1,
    [6] = 1,
}
CelestialCenturionUpgradeUseCountLevelCounter = 0
CelestialCenturionMaxUseCount = 4
CelestialCenturionLv2MaxUseCount = 3

SchedulerModule.call_every_x_frame(function()
    local round = exCounterGetByName("lvc")
    if CelestialCenturionUpgradeUseCountLevelCounter ~= round then
        CelestialCenturionUpgradeUseCountLevelCounter = round
        -- 每个回合重置使用次数
        for i = 1, 6, 1 do
            local spellbookId = g_PlayerSpellBookId[i]
            if spellbookId ~= 0 and exObjectGetSpecialCountDownFrame(spellbookId, "SpecialPower_CelestialCenturionUpgrade") >= 1 then
                ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", GetObjectById(spellbookId), "SpecialPower_CelestialCenturionUpgrade", 1);

                if round == 9 then
                    exMessageAppendToMessageArea("$p" .. i .. "Name解锁千夫长/万夫长!")
                end
            end
            CelestialCenturionUpgradeUseCount[i] = 1
        end
    end

    local maxUseCount = CelestialCenturionMaxUseCount
    if round >= 9 then
        -- 能用千夫长了，就不给你那么多了
        maxUseCount = CelestialCenturionLv2MaxUseCount
    end

    for i = 1, 6, 1 do
        if CelestialCenturionUpgradeUseCount[i] < maxUseCount then
            local spellbookId = g_PlayerSpellBookId[i]
            if spellbookId ~= 0 and exObjectGetSpecialCountDownFrame(spellbookId, "SpecialPower_CelestialCenturionUpgrade") >= 200 then
                ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", GetObjectById(spellbookId), "SpecialPower_CelestialCenturionUpgrade", 1);
                CelestialCenturionUpgradeUseCount[i] = CelestialCenturionUpgradeUseCount[i] + 1
            end
        end
    end

end, 15, nil)