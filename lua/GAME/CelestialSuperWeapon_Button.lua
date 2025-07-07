CelestialSuperWeapon_Filter = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing={"CelestialSuperWeapon"}
})

SchedulerModule.call_every_x_frame(function()

    for i = 1 , 6 , 1 do
        if g_CelestialSuperWeapon_Get[i] == 0 then
            local cankao = GetObjectByScriptName("wan" .. i)
            local objects, count = ObjectFindObjects(cankao, nil, CelestialSuperWeapon_Filter)
            if count > 0 and not EvaluateCondition("UNIT_HAS_MODELCONDITION", objects[1], "STRUCTURE_UNPACKING") then
                g_CelestialSuperWeapon_Get[i] = 1
                exCenterTopBtnShowForPlayer("Player_" .. i, 3, "CelestialLightningTroop_Lv3", "士气提升(己方全体坦克小兵飞机获得18秒的1.25倍移速和伤害加成)\n冷却时间220秒")
            end
        end
    end

end, 20, nil)