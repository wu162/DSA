

g_CurrentRecycleType = {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
};

g_CurrentClickRecycleUnit = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
    [5] = {},
    [6] = {},
};

g_RecycleBtnsShowed = {
    [1] = {},
    [2] = {},
    [3] = {},
    [4] = {},
    [5] = {},
    [6] = {},
};

g_RecycleUnitCount = {
    [1] = 1,
    [2] = 5,
    [3] = 10,
    [4] = 20,
}

g_RecycleBtnsIndexStart = 30;

--g_Infantry = {
--    {Type = "AlliedScoutInfantry", Image = "Button_AlliedScoutInfantry_on", Name = "警犬", Money = 200},
--    {Type = "AlliedAntiInfantryInfantry", Image = "Button_AlliedAntiInfantryInfantry_on", Name = "维和步兵", Money = 200},
--    {Type = "AlliedAntiVehicleInfantry", Image = "Button_AlliedAntiVehicleInfantry_on", Name = "标枪兵", Money = 300},
--    {Type = "AlliedCryoLegionnaire", Image = "Button_AlliedCryoLegionnaire", Name = "冷冻兵", Money = 1600},
--    {Type = "SovietScoutInfantry", Image = "Button_SovietScoutInfantry_small", Name = "熊", Money = 225},
--    {Type = "SovietAntiInfantryInfantry", Image = "Button_SovietAntiInfantryInfantry_small", Name = "征召兵", Money = 100},
--    {Type = "SovietAntiVehicleInfantry", Image = "Button_SovietAntiVehicleInfantry_small", Name = "防空部队", Money = 400},
--    {Type = "SovietMortarCycle", Image = "Button_SovietMortarCycle", Name = "火炮机车", Money = 750},
--    {Type = "SovietHeavyAntiVehicleInfantry", Image = "Button_SovietHeavyAntiVehicleInfantry_small", Name = "磁爆步兵", Money = 850},
--    {Type = "JapanScoutInfantry", Image = "Button_JapanScoutInfantry", Name = "蜻蜓", Money = 300},
--    {Type = "JapanAntiInfantryInfantry", Image = "Button_JapanAntiInfantryInfantry", Name = "帝国武士", Money = 150},
--    {Type = "JapanAntiVehicleInfantry", Image = "Button_JapanAntiVehicleInfantry", Name = "坦克杀手", Money = 300},
--    {Type = "JapanInfiltrationInfantry", Image = "Button_JapanInfiltrationInfantry", Name = "忍者", Money = 850},
--    {Type = "JapanAntiVehicleInfantryTech3", Image = "Button_JapanAntiVehicleInfantryTech3", Name = "火箭天使", Money = 1000},
--    {Type = "CelestialScoutDrone", Image = "Button_CelestialScoutDrone", Name = "天眼哨机", Money = 200},
--    {Type = "CelestialAntiInfantryInfantry", Image = "Button_CelestialAntiInfantryInfantry", Name = "龙炎", Money = 225},
--    {Type = "CelestialAntiVehicleInfantry", Image = "Button_CelestialAntiVehicleEMCInfantry", Name = "破甲铁卫", Money = 500},
--    {Type = "CelestialInfiltrationInfantry", Image = "Button_CelestialInfiltrationInfantry", Name = "岚影刺", Money = 850},
--    {Type = "CelestialAntiInfantryInfantryAdvanced", Image = "Button_CelestialAntiInfantryInfantryAdvanced", Name = "迅雷天罡", Money = 1400},
--}

g_InfantryAllied = {
    {Type = "AlliedScoutInfantry", Image = "Button_AlliedScoutInfantry_on", Name = "警犬", Money = 200},
    {Type = "AlliedAntiInfantryInfantry", Image = "Button_AlliedAntiInfantryInfantry_on", Name = "维和步兵", Money = 200},
    {Type = "AlliedAntiVehicleInfantry", Image = "Button_AlliedAntiVehicleInfantry_on", Name = "标枪兵", Money = 300},
    {Type = "AlliedCryoLegionnaire", Image = "Button_AlliedCryoLegionnaire", Name = "冷冻兵", Money = 1600},
}

g_InfantrySoviet = {
    {Type = "SovietScoutInfantry", Image = "Button_SovietScoutInfantry_small", Name = "熊", Money = 225},
    {Type = "SovietAntiInfantryInfantry", Image = "Button_SovietAntiInfantryInfantry_small", Name = "征召兵", Money = 100},
    {Type = "SovietAntiVehicleInfantry", Image = "Button_SovietAntiVehicleInfantry_small", Name = "防空部队", Money = 400},
    {Type = "SovietMortarCycle", Image = "Button_SovietMortarCycle", Name = "火炮机车", Money = 750},
    {Type = "SovietHeavyAntiVehicleInfantry", Image = "Button_SovietHeavyAntiVehicleInfantry_small", Name = "磁爆步兵", Money = 850},
}

g_InfantryJapan = {
    {Type = "JapanScoutInfantry", Image = "Button_JapanScoutInfantry", Name = "蜻蜓", Money = 300},
    {Type = "JapanAntiInfantryInfantry", Image = "Button_JapanAntiInfantryInfantry", Name = "帝国武士", Money = 150},
    {Type = "JapanAntiVehicleInfantry", Image = "Button_JapanAntiVehicleInfantry", Name = "坦克杀手", Money = 300},
    {Type = "JapanArcherInfantry", Image = "Button_JapanArcherMaiden", Name = "弓箭少女", Money = 400},
    {Type = "JapanInfiltrationInfantry", Image = "Button_JapanInfiltrationInfantry", Name = "忍者", Money = 850},
    {Type = "JapanAntiVehicleInfantryTech3", Image = "Button_JapanAntiVehicleInfantryTech3", Name = "火箭天使", Money = 1000},
}

g_InfantryCelestial = {
    {Type = "CelestialScoutDrone", Image = "Button_CelestialScoutDrone", Name = "天眼哨机", Money = 200},
    {Type = "CelestialAntiInfantryInfantry", Image = "Button_CelestialAntiInfantryInfantry", Name = "龙炎", Money = 225},
    {Type = "CelestialAntiVehicleInfantry", Image = "Button_CelestialAntiVehicleEMCInfantry", Name = "破甲铁卫", Money = 500},
    {Type = "CelestialInfiltrationInfantry", Image = "Button_CelestialInfiltrationInfantry", Name = "岚影刺", Money = 850},
    {Type = "CelestialAntiInfantryInfantryAdvanced", Image = "Button_CelestialAntiInfantryInfantryAdvanced", Name = "迅雷天罡", Money = 1400},
}

--g_Vehicle = {
--    --{Type = "AlliedAntiInfantryVehicle", Image = "Button_AlliedAntiInfantryVehicle_on", Name = "ACV"},
--    {Type = "AlliedAntiAirVehicleTech1", Image = "Button_AlliedIFV_B_on", Name = "ifv", Money = 800},
--    {Type = "AlliedAntiVehicleVehicleTech1", Image = "Button_AlliedAntiVehicleVehicleTech1_on", Name = "守护者坦克", Money = 950},
--    {Type = "PrismTank", Image = "Button_PrismTank_B", Name = "光棱坦克", Money = 1400},
--    {Type = "AlliedAntiStructureVehicle", Image = "Button_AlliedAntiStructureVehicle_on", Name = "雅典娜", Money = 1800},
--    {Type = "AlliedAntiVehicleVehicleTech3", Image = "Button_AlliedAntiVehicleVehicleTech3_B", Name = "幻影坦克", Money = 1600},
--    {Type = "AlliedFutureTank", Image = "Button_AlliedFutureTank", Name = "未来坦克", Money = 3200},
--    {Type = "SovietScoutVehicle", Image = "Button_SovietScoutVehicle_small", Name = "蜘蛛", Money = 600},
--    {Type = "SovietAntiInfantryVehicle", Image = "Button_SovietAntiInfantryVehicle_small", Name = "镰刀", Money = 900},
--    {Type = "SovietAntiAirShip", Image = "Button_SovietAntiAirShip_small", Name = "牛蛙", Money = 900},
--    {Type = "SovietHeavyAntiVehicleVehicleTech2", Image = "Button_SovietRhinoTank", Name = "犀牛坦克", Money = 1100},
--    {Type = "SovietSledgehammerSPG", Image = "Button_SovietSledgehammerSPG", Name = "重锤", Money = 1500},
--    {Type = "SovietAntiStructureVehicle", Image = "Button_SovietAntiStructureVehicle_small", Name = "v4坦克", Money = 1600},
--    {Type = "SovietAntiVehicleVehicleTech3", Image = "Button_SovietAntiVehicleVehicleTech3", Name = "天启", Money = 2000},
--    {Type = "SovietAntiVehicleVehicleTech4", Image = "Button_SovietAntiVehicleVehicleTech4", Name = "联盟坦克", Money = 4500},
--    {Type = "JapanAntiInfantryVehicle", Image = "Button_JapanAntiInfantryVehicle_mecha", Name = "天狗", Money = 800},
--    {Type = "JapanAntiVehicleVehicleTech1", Image = "Button_JapanAntiVehicleVehicleTech1", Name = "海啸坦克", Money = 1400},
--    {Type = "JapanAntiAirVehicleTech1", Image = "Button_JapanAntiAirVehicleTech1_walker", Name = "vx", Money = 1200},
--    {Type = "JapanSentinelVehicle", Image = "Button_JapanSteelRonin", Name = "浪人", Money = 1400},
--    {Type = "JapanMissileMechaAdvanced", Image = "Button_JapanMissileMechaAdvanced", Name = "心神机甲", Money = 1800},
--    {Type = "JapanAntiVehicleVehicleTech3", Image = "Button_JapanAntiVehicleVehicleTech3", Name = "鬼王", Money = 2200},
--    {Type = "JapanAntiStructureVehicle", Image = "Button_JapanAntiStructureVehicle", Name = "波能坦克", Money = 1800},
--    {Type = "JapanInterceptorAircraft", Image = "Button_JapanInterceptorAircraft_sea", Name = "樱花特攻机", Money = 850},
--    {Type = "JapanMechaX", Image = "Button_RedKingOni", Name = "鬼王X", Money = 4500},
--    {Type = "CelestialAntiInfantryVehicle", Image = "Button_CelestialAntiInfantryVehicle_B", Name = "凌波战车", Money = 850},
--    {Type = "CelestialAntiAirShip", Image = "Button_CelestialAntiAirShip", Name = "磁弩", Money = 900},
--    {Type = "CelestialAntiVehicleVehicleTech1", Image = "Button_CelestialKylinMBT", Name = "麒麟坦克", Money = 1000},
--    {Type = "CelestialLongRangeMissileVehicle_B", Image = "Button_CelestialLongRangeMissileVehicle_B", Name = "清风", Money = 1400},
--    {Type = "CelestialAntiVehicleVehicleTech3", Image = "Button_CelestialAntiVehicleVehicleTech3", Name = "祝融", Money = 2000},
--    {Type = "CelestialHeavyAntiAirVehicleTech3", Image = "Button_CelestialHeavyAntiAirVehicleTech3", Name = "雷铳", Money = 2000},
--    {Type = "CelestialAntiStructureVehicle", Image = "Button_CelestialAntiStructureVehicle", Name = "白虎", Money = 1800},
--    {Type = "CelestialAntiVehicleVehicleTech4", Image = "Button_CelestialAntiVehicleVehicleTech4", Name = "金甲", Money = 4500},
--}

g_VehicleAllied = {
    --{Type = "AlliedAntiInfantryVehicle", Image = "Button_AlliedAntiInfantryVehicle_on", Name = "ACV"},
    {Type = "AlliedAntiAirVehicleTech1", Image = "Button_AlliedIFV_B_on", Name = "ifv", Money = 800},
    {Type = "AlliedAntiVehicleVehicleTech1", Image = "Button_AlliedAntiVehicleVehicleTech1_on", Name = "守护者坦克", Money = 950},
    {Type = "PrismTank", Image = "Button_PrismTank_B", Name = "光棱坦克", Money = 1400},
    {Type = "AlliedAntiStructureVehicle", Image = "Button_AlliedAntiStructureVehicle_on", Name = "雅典娜", Money = 1800},
    {Type = "AlliedAntiVehicleVehicleTech3", Image = "Button_AlliedAntiVehicleVehicleTech3_B", Name = "幻影坦克", Money = 1600},
    {Type = "AlliedFutureTank", Image = "Button_AlliedFutureTank", Name = "未来坦克", Money = 3200},
}

g_VehicleSoviet = {
    {Type = "SovietScoutVehicle", Image = "Button_SovietScoutVehicle_small", Name = "蜘蛛", Money = 600},
    {Type = "SovietAntiInfantryVehicle", Image = "Button_SovietAntiInfantryVehicle_small", Name = "镰刀", Money = 900},
    {Type = "SovietAntiAirShip", Image = "Button_SovietAntiAirShip_small", Name = "牛蛙", Money = 900},
    {Type = "SovietHeavyAntiVehicleVehicleTech2", Image = "Button_SovietRhinoTank", Name = "犀牛坦克", Money = 1100},
    {Type = "SovietSledgehammerSPG", Image = "Button_SovietSledgehammerSPG", Name = "重锤", Money = 1500},
    {Type = "SovietAntiStructureVehicle", Image = "Button_SovietAntiStructureVehicle_small", Name = "v4坦克", Money = 1600},
    {Type = "SovietAntiVehicleVehicleTech3", Image = "Button_SovietAntiVehicleVehicleTech3", Name = "天启", Money = 2000},
    {Type = "SovietAntiVehicleVehicleTech4", Image = "Button_SovietAntiVehicleVehicleTech4", Name = "联盟坦克", Money = 4500},
}

g_VehicleJapan = {
    {Type = "JapanAntiInfantryVehicle", Image = "Button_JapanAntiInfantryVehicle_mecha", Name = "天狗", Money = 800},
    {Type = "JapanAntiVehicleVehicleTech1", Image = "Button_JapanAntiVehicleVehicleTech1", Name = "海啸坦克", Money = 1400},
    {Type = "JapanAntiAirVehicleTech1", Image = "Button_JapanAntiAirVehicleTech1_walker", Name = "vx", Money = 1200},
    {Type = "JapanSentinelVehicle", Image = "Button_JapanSteelRonin", Name = "浪人", Money = 1400},
    {Type = "JapanMissileMechaAdvanced", Image = "Button_JapanMissileMechaAdvanced", Name = "心神机甲", Money = 1800},
    {Type = "JapanAntiVehicleVehicleTech3", Image = "Button_JapanAntiVehicleVehicleTech3", Name = "鬼王", Money = 2200},
    {Type = "JapanAntiStructureVehicle", Image = "Button_JapanAntiStructureVehicle", Name = "波能坦克", Money = 1800},
    {Type = "JapanInterceptorAircraft", Image = "Button_JapanInterceptorAircraft_sea", Name = "樱花特攻机", Money = 850},
    {Type = "JapanMechaX", Image = "Button_RedKingOni", Name = "鬼王X", Money = 4500},
}

g_VehicleCelestial = {
    {Type = "CelestialAntiInfantryVehicle", Image = "Button_CelestialAntiInfantryVehicle_B", Name = "凌波战车", Money = 850},
    {Type = "CelestialAntiAirShip", Image = "Button_CelestialAntiAirShip", Name = "磁弩", Money = 900},
    {Type = "CelestialAntiVehicleVehicleTech1", Image = "Button_CelestialKylinMBT", Name = "麒麟坦克", Money = 1000},
    {Type = "CelestialLongRangeMissileVehicle_B", Image = "Button_CelestialLongRangeMissileVehicle_B", Name = "清风", Money = 1400},
    {Type = "CelestialAntiVehicleVehicleTech3", Image = "Button_CelestialAntiVehicleVehicleTech3", Name = "祝融", Money = 2000},
    {Type = "CelestialHeavyAntiAirVehicleTech3", Image = "Button_CelestialHeavyAntiAirVehicleTech3", Name = "雷铳", Money = 2000},
    {Type = "CelestialAntiStructureVehicle", Image = "Button_CelestialAntiStructureVehicle", Name = "白虎", Money = 1800},
    {Type = "CelestialAntiVehicleVehicleTech4", Image = "Button_CelestialAntiVehicleVehicleTech4", Name = "金甲", Money = 4500},
}

--g_AirCraft = {
--    {Type = "AlliedAntiGroundAircraft", Image = "Button_AlliedAntiGroundAircraft_on", Name = "维和飞机", Money = 1200},
--    {Type = "AlliedFighterAircraft", Image = "Button_AlliedApolloFighterAircraft", Name = "阿波罗", Money = 1000},
--    {Type = "AlliedSupportAircraft", Image = "Button_AlliedSupportAircraft_on", Name = "冷冻飞机", Money = 1600},
--    {Type = "AlliedInterceptorAircraftTech3", Image = "Button_AlliedInterceptorAircraftTech3", Name = "阿瑞斯", Money = 1600},
--    {Type = "AlliedAntiStructureBomberAircraft", Image = "Button_AlliedBomberAircraft_on", Name = "世纪", Money = 2500},
--    {Type = "AlliedGunshipAircraft", Image = "Button_AlliedHarbingerGunship", Name = "先锋", Money = 4000},
--    {Type = "SovietAntiGroundAircraft", Image = "Button_SovietAntiGroundAircraft_small", Name = "双刃", Money = 1200},
--    {Type = "SovietFighterAircraft", Image = "Button_SovietMigFighterAircraft", Name = "米格", Money = 1000},
--    {Type = "SovietInterceptorAircraft", Image = "Button_SovietInterceptorAircraft", Name = "苏霍伊", Money = 1800},
--    {Type = "SovietTransportAircraft", Image = "Button_SovietTransportAircraft", Name = "纤夫", Money = 2000},
--    {Type = "SovietAntiGroundAttacker", Image = "Button_SovietAntiGroundAttacker", Name = "伊尔", Money = 2500},
--    {Type = "SovietBomberAircraft", Image = "Button_SovietBomberAircraft", Name = "基洛夫", Money = 3600},
--    {Type = "CelestialFighterAircraft", Image = "Button_CelestialFighterAircraft", Name = "凤凰", Money = 1000},
--    {Type = "CelestialSupportAircraft", Image = "Button_CelestialSupportAircraft", Name = "毕方", Money = 1200},
--    {Type = "CelestialAttackerAircraft", Image = "Button_CelestialAttackerAircraft", Name = "朱雀", Money = 1400},
--    {Type = "CelestialInterceptorAircraft", Image = "Button_CelestialInterceptorAircraft", Name = "重明", Money = 1600},
--    {Type = "CelestialBomberAircraft", Image = "Button_CelestialBomberAircraft", Name = "金乌", Money = 2500},
--    {Type = "CelestialAdvancedAircraftTech4", Image = "Button_CelestialAdvancedAircraftTech4", Name = "摇光", Money = 5000},
--}

g_AirCraftAllied = {
    {Type = "AlliedAntiGroundAircraft", Image = "Button_AlliedAntiGroundAircraft_on", Name = "维和飞机", Money = 1200},
    {Type = "AlliedFighterAircraft", Image = "Button_AlliedApolloFighterAircraft", Name = "阿波罗", Money = 1000},
    {Type = "AlliedSupportAircraft", Image = "Button_AlliedSupportAircraft_on", Name = "冷冻飞机", Money = 1600},
    {Type = "AlliedInterceptorAircraftTech3", Image = "Button_AlliedInterceptorAircraftTech3", Name = "阿瑞斯", Money = 1600},
    {Type = "AlliedAntiStructureBomberAircraft", Image = "Button_AlliedBomberAircraft_on", Name = "世纪", Money = 2500},
    {Type = "AlliedGunshipAircraft", Image = "Button_AlliedHarbingerGunship", Name = "先锋", Money = 4000},
}

g_AirCraftSoviet = {
    {Type = "SovietAntiGroundAircraft", Image = "Button_SovietAntiGroundAircraft_small", Name = "双刃", Money = 1200},
    {Type = "SovietFighterAircraft", Image = "Button_SovietMigFighterAircraft", Name = "米格", Money = 1000},
    {Type = "SovietInterceptorAircraft", Image = "Button_SovietInterceptorAircraft", Name = "苏霍伊", Money = 1800},
    {Type = "SovietTransportAircraft", Image = "Button_SovietTransportAircraft", Name = "纤夫", Money = 2000},
    {Type = "SovietAntiGroundAttacker", Image = "Button_SovietAntiGroundAttacker", Name = "伊尔", Money = 2500},
    {Type = "SovietBomberAircraft", Image = "Button_SovietBomberAircraft", Name = "基洛夫", Money = 3600},
}

g_AirCraftJapan = {
}

g_AirCraftCelestial = {
    {Type = "CelestialFighterAircraft", Image = "Button_CelestialFighterAircraft", Name = "凤凰", Money = 1000},
    {Type = "CelestialSupportAircraft", Image = "Button_CelestialSupportAircraft", Name = "毕方", Money = 1200},
    {Type = "CelestialAttackerAircraft", Image = "Button_CelestialAttackerAircraft", Name = "朱雀", Money = 1400},
    {Type = "CelestialInterceptorAircraft", Image = "Button_CelestialInterceptorAircraft", Name = "重明", Money = 1600},
    {Type = "CelestialBomberAircraft", Image = "Button_CelestialBomberAircraft", Name = "金乌", Money = 2500},
    {Type = "CelestialAdvancedAircraftTech4", Image = "Button_CelestialAdvancedAircraftTech4", Name = "摇光", Money = 5000},
}

--g_Ship = {
--    {Type = "AlliedAntiNavalScout", Image = "Button_AlliedAntiNavalScout_on", Name = "", Money = 750},
--    {Type = "AlliedAntiAirShip", Image = "Button_AlliedAntiAirShip_on", Name = "", Money = 900},
--    {Type = "AlliedAntiNavyShipTech1", Image = "Button_AlliedAntiNavyShipTech1_on", Name = "", Money = 1600},
--    {Type = "AlliedAntiNavyShipTech3", Image = "Button_AlliedAntiNavyShipTech3", Name = "", Money = 4000},
--    {Type = "AlliedAntiStructureShip", Image = "Button_AlliedAntiStructureShip_on", Name = "", Money = 5500},
--    {Type = "SovietAntiNavyShipTech1", Image = "Button_SovietAntiNavyShipTech1_small", Name = "", Money = 1000},
--    {Type = "SovietAntiNavyShipTech2", Image = "Button_SovietAntiNavyShipTech2_small", Name = "", Money = 2000},
--    {Type = "SovietAntiNavyShipTech3", Image = "Button_SovietAntiNavyShipTech3", Name = "", Money = 4500},
--    {Type = "SovietAntiStructureShip", Image = "Button_SovietAntiStructureShip_small", Name = "", Money = 5000},
--    {Type = "JapanNavyScoutShip", Image = "Button_JapanNavyScoutShip", Name = "", Money = 800},
--    {Type = "JapanAntiAirShip", Image = "Button_JapanAntiShipAircraft_air", Name = "", Money = 1100},
--    {Type = "JapanAntiVehicleShip", Image = "Button_JapanAntiNavyShipTech2", Name = "", Money = 2000},
--    {Type = "JapanAntiNavyShipTech3", Image = "Button_JapanAntiNavyShipTech3", Name = "", Money = 4500},
--    {Type = "JapanAntiStructureShip", Image = "Button_JapanAntiStructureShip", Name = "", Money = 6300},
--    {Type = "CelestialAntiNavyShipTech1", Image = "Button_CelestialAntiNavyShipTech1", Name = "", Money = 800},
--    {Type = "CelestialAlmightlyShip", Image = "Button_CelestialAntiNavyShipTech2", Name = "", Money = 2000},
--    {Type = "CelestialAntiNavyShipTech3", Image = "Button_CelestialAntiNavyShipTech3B", Name = "", Money = 4500},
--    {Type = "CelestialAntiStructureShip", Image = "Button_CelestialAntiStructureShipB", Name = "", Money = 5000},
--}

g_ShipAllied = {
    {Type = "AlliedAntiNavalScout", Image = "Button_AlliedAntiNavalScout_on", Name = "", Money = 750},
    {Type = "AlliedAntiAirShip", Image = "Button_AlliedAntiAirShip_on", Name = "", Money = 900},
    {Type = "AlliedAntiNavyShipTech1", Image = "Button_AlliedAntiNavyShipTech1_on", Name = "", Money = 1600},
    {Type = "AlliedAntiNavyShipTech3", Image = "Button_AlliedAntiNavyShipTech3", Name = "", Money = 4000},
    {Type = "AlliedAntiStructureShip", Image = "Button_AlliedAntiStructureShip_on", Name = "", Money = 5500},
}

g_ShipSoviet = {
    {Type = "SovietAntiNavyShipTech1", Image = "Button_SovietAntiNavyShipTech1_small", Name = "", Money = 1000},
    {Type = "SovietAntiNavyShipTech2", Image = "Button_SovietAntiNavyShipTech2_small", Name = "", Money = 2000},
    {Type = "SovietAntiNavyShipTech3", Image = "Button_SovietAntiNavyShipTech3", Name = "", Money = 4500},
    {Type = "SovietAntiStructureShip", Image = "Button_SovietAntiStructureShip_small", Name = "", Money = 5000},
}

g_ShipJapan = {
    {Type = "JapanNavyScoutShip", Image = "Button_JapanNavyScoutShip", Name = "", Money = 800},
    {Type = "JapanAntiAirShip", Image = "Button_JapanAntiShipAircraft_air", Name = "", Money = 1100},
    {Type = "JapanAntiVehicleShip", Image = "Button_JapanAntiNavyShipTech2", Name = "", Money = 2000},
    {Type = "JapanAntiNavyShipTech3", Image = "Button_JapanAntiNavyShipTech3", Name = "", Money = 4500},
    {Type = "JapanAntiStructureShip", Image = "Button_JapanAntiStructureShip", Name = "", Money = 6300},
}

g_ShipCelestial = {
    {Type = "CelestialAntiNavyShipTech1", Image = "Button_CelestialAntiNavyShipTech1", Name = "", Money = 800},
    {Type = "CelestialAlmightlyShip", Image = "Button_CelestialAntiNavyShipTech2", Name = "", Money = 2000},
    {Type = "CelestialAntiNavyShipTech3", Image = "Button_CelestialAntiNavyShipTech3B", Name = "", Money = 4500},
    {Type = "CelestialAntiStructureShip", Image = "Button_CelestialAntiStructureShipB", Name = "", Money = 5000},
}

--g_RecycleBtnsMap = {
--    [1] = g_Infantry,
--    [2] = g_Vehicle,
--    [3] = g_AirCraft,
--    [4] = g_Ship,
--}

g_RecycleBtnsMapByFaction = {
    [1] = {
        [1] = g_InfantryAllied,
        [2] = g_VehicleAllied,
        [3] = g_AirCraftAllied,
        [4] = g_ShipAllied,
    },
    [2] = {
        [1] = g_InfantrySoviet,
        [2] = g_VehicleSoviet,
        [3] = g_AirCraftSoviet,
        [4] = g_ShipSoviet,
    },
    [3] = {
        [1] = g_InfantryJapan,
        [2] = g_VehicleJapan,
        [3] = g_AirCraftJapan,
        [4] = g_ShipJapan,
    },
    [4] = {
        [1] = g_InfantryCelestial,
        [2] = g_VehicleCelestial,
        [3] = g_AirCraftCelestial,
        [4] = g_ShipCelestial,
    },
}

function createRecycleBtns()
    exCreateCustomButton({
        Index = 21,
        TextureName = "Allied_topmenu_infantry",
        Desc = "回收步兵单位",
        X = 350,
        Y = 70,
        GroupIndex = 2,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomButton({
        Index = 22,
        TextureName = "Allied_topmenu_vehicles",
        Desc = "回收坦克单位",
        X = 400,
        Y = 70,
        GroupIndex = 2,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomButton({
        Index = 23,
        TextureName = "Allied_topmenu_air",
        Desc = "回收空军单位",
        X = 450,
        Y = 70,
        GroupIndex = 2,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomButton({
        Index = 24,
        TextureName = "Allied_topmenu_navy",
        Desc = "回收海军单位",
        X = 500,
        Y = 70,
        GroupIndex = 2,
        AlignX = "left",
        AlignY = "top",
    })

    exCreateCustomButton({
        Index = 25,
        TextureName = "Allied_topmenu_groups",
        Desc = "收起下方按钮",
        X = 550,
        Y = 70,
        GroupIndex = 2,
        AlignX = "left",
        AlignY = "top",
    })

end

function RecycleUnit_Setting()
    createRecycleBtns();
end

function RecycleUnitBtnsClear(playerName)
    --local playerIndex = g_PlayerNameToIndex[playerName];
    --for i = 1, getn(g_RecycleBtnsShowed[playerIndex]) do
    --    exCustomBtnRemove(g_RecycleBtnsShowed[playerIndex][i]);
    --end

    --目前只能这样先把按钮移到一边去   但是不能超出屏幕，不然会卡住界面  所以只能摆在边角上，但注意不要响应点击
    for i = 1, 20 do
        exCreateCustomButtonForPlayer(playerName, {
            Index = g_RecycleBtnsIndexStart + i,
            TextureName = "Button_AlliedScoutInfantry_on",
            Desc = "",
            X = -100,
            Y = -100,
            GroupIndex = 3,
            AlignX = "left",
            AlignY = "top",
        })
    end
end

function RecycleTypeBtnClick(playerName, index)
    local playerIndex = g_PlayerNameToIndex[playerName];
    g_CurrentRecycleType[playerIndex] = index - 20;
    -- 关闭之前的按钮
    RecycleUnitBtnsClear(playerName);

    g_RecycleBtnsShowed[playerIndex] = {};
    -- 显示按钮  需要延迟一下，要不然会卡住退出界面
    SchedulerModule.delay_call(function(playerName1, index1)
        local playerIndex1 = g_PlayerNameToIndex[playerName1];
        local playerFaction = g_PlayerSide[playerIndex1];
        local btns = g_RecycleBtnsMapByFaction[playerFaction][index1 - 20];
        for i = 1, getn(btns) do
            local currentBtn = btns[i];
            exCreateCustomButtonForPlayer(playerName1, {
                Index = g_RecycleBtnsIndexStart + i,
                TextureName = currentBtn.Image,
                Desc = "",
                X = 350 + mod(i - 1, 6) * 50,
                Y = 125 + floor((i - 1) / 6) * 50,
                GroupIndex = 3,
                AlignX = "left",
                AlignY = "top",
            })
            tinsert(g_RecycleBtnsShowed[playerIndex1], i);
        end
    end, 4, {playerName, index})

end

function RecycleUnitBtnsClick(playerName, index)
    local playerIndex = g_PlayerNameToIndex[playerName];
    local playerFaction = g_PlayerSide[playerIndex];
    local btnMap = g_RecycleBtnsMapByFaction[playerFaction][g_CurrentRecycleType[playerIndex]];
    g_CurrentClickRecycleUnit[playerIndex] = btnMap[index - g_RecycleBtnsIndexStart];
    BtnChoiceDialogEventFunc_RecycleUnitDialog(playerName);
end

g_RecycleBtnHandlers = {
    [21] = function(playerName, index)
        RecycleTypeBtnClick(playerName, index);
    end,
    [22] = function(playerName, index)
        RecycleTypeBtnClick(playerName, index);
    end,
    [23] = function(playerName, index)
        RecycleTypeBtnClick(playerName, index);
    end,
    [24] = function(playerName, index)
        RecycleTypeBtnClick(playerName, index);
    end,
    [25] = function(playerName, index)
        RecycleUnitBtnsClear(playerName);
    end
}

