
-- 目前 unitall 似乎只是给剑用的
-- 这里面写什么，剑就会打什么
unitall = CreateObjectFilter({
  Rule="ANY",
  Relationship="SAME_PLAYER",
  IncludeThing={ "SovietBaseDefenseGround" },
  ExcludeThing={
    "JapanFortressShip",
    "Overlordtank",
    "JapanLightTransportVehicle",
    "AlliedNightinaleHelicopter",
    "AlliedMCV",
  },
  Include="SELECTABLE",
  -- 除了哨兵枪以外的所有建筑都被排除
  Exclude="STRUCTURE",
})