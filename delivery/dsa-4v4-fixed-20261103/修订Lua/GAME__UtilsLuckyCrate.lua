if not g_SuperSpeedModifier then
g_SuperSpeedModifier = exAttributeModifierCreate({ SPEED = 8.0 }, 1)
end
function PlayerEngineerBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
SchedulerModule.delay_call(function(id)
if ObjectIsAlive(id) then
ObjectLoadAttributeModifier(GetObjectById(id), g_SuperSpeedModifier)
end
end, 1, {createdObjId})
end
g_PlayerEngineerTypes = {
"AlliedEngineer",
"SovietEngineer",
"JapanEngineer",
"CelestialEngineer",
}
for i = 1, getn(g_PlayerEngineerTypes), 1 do
local engineerType = g_PlayerEngineerTypes[i]
exObjectRegisterCreateEvent(engineerType)
g_UnitCreateEventFunc[FastHash(engineerType)] = PlayerEngineerBorn
end
function SetPlayerEngineerProductionAvailability(enable)
local availability = 0
if enable and enable ~= 0 then
availability = 1
end
for i = 1, 8, 1 do
local playerName = "Player_" .. i
for j = 1, getn(g_PlayerEngineerTypes), 1 do
ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, g_PlayerEngineerTypes[j], availability)
end
end
end
function TryEnableLuckyCrateIfAllowed()
local previous = SetWorldBuilderThisPlayer(1)
SetPlayerEngineerProductionAvailability(g_LuckyCrateMode)
local EnableLuckyCrateImplementation = function(enable)
if not enable or enable == 0 then
return
end
if g_LuckyCreateEnableComplete then
return
end
g_LuckyCreateEnableComplete = 1
ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", "SpecialPower_LuckyUnitCrate", "<All Human Players>")
ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", "SpecialPower_LuckyUnitCrateX10", "<All Human Players>")
for i = 1, 8, 1 do
local playerName = "Player_" .. i
local isHuman = EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", playerName, "Human")
if isHuman then
local p = exWaypointGetPos(format("Player_%d_Start", i))
local offsetX = 200
local position = { X = p[1] + offsetX, Y = p[2], Z = p[3] }
local nextObjectId = GetNextObjectId()
if g_PureDrawScriptCreatedUnitIds then
g_PureDrawScriptCreatedUnitIds[nextObjectId] = true
end
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",
"",
"JapanEngineer",
format("%s/crate", playerName),
position,
0
)
TextDoActionLocalizedOnce("NAMED_SHOW_INFOBOX", GetObjectById(nextObjectId), "SCRIPT:CrateEnabled", 120, "")
end
end
end
EnableLuckyCrateImplementation(g_LuckyCrateMode)
SetWorldBuilderThisPlayer(previous)
end
exObjectRegisterCreateEvent("JapanFortressShip")
exObjectRegisterCreateEvent("JapanGigaFortress_Land")
function CountAsFortressShipEgg(createdObjId, createdObjInstanceId, ownerPlayerName)
return UnitCountFunc(createdObjId, FastHash("JapanGigaFortressShipEgg"), ownerPlayerName)
end
g_UnitCreateEventFunc[FastHash("JapanFortressShip")] = CountAsFortressShipEgg
g_UnitCreateEventFunc[FastHash("JapanGigaFortress_Land")] = CountAsFortressShipEgg
g_PureDrawConfig = {
ProductionQuota = 5,
RefreshRounds = 3,
CustomDrawChance = 0.50,
AirdropCheckFrames = 15 * 60,
AirdropUnitScanFrames = 15 * 5,
AirdropUnitScanInterval = 2,
AirdropChance = 0.05,
TierWeights = { 37, 50, 10, 3 },
}
g_PureDrawBuildableUnitPool = {
[1] = {
{ Type = "AlliedScoutInfantry", CustomDrawCount = 5 },
{ Type = "AlliedAntiInfantryInfantry", CustomDrawCount = 5 },
{ Type = "AlliedAntiVehicleInfantry", CustomDrawCount = 5 },
{ Type = "SovietScoutInfantry", CustomDrawCount = 5 },
{ Type = "SovietAntiInfantryInfantry", CustomDrawCount = 5 },
{ Type = "SovietAntiVehicleInfantry", CustomDrawCount = 5 },
{ Type = "SovietMortarCycle", CustomDrawCount = 4, ProductionUnlockRound = 1 },
{ Type = "JapanScoutInfantry", CustomDrawCount = 5 },
{ Type = "JapanAntiInfantryInfantry", CustomDrawCount = 5 },
{ Type = "JapanAntiVehicleInfantry", CustomDrawCount = 5 },
{ Type = "JapanArcherInfantry", CustomDrawCount = 5 },
{ Type = "CelestialScoutDrone", CustomDrawCount = 5 },
{ Type = "CelestialAntiInfantryInfantry", CustomDrawCount = 5 },
{ Type = "CelestialAntiVehicleInfantry", CustomDrawCount = 5 },
{ Type = "AlliedAntiInfantryVehicle_Ground", CustomDrawCount = 4 },
{ Type = "AlliedAntiAirVehicleTech1", CustomDrawCount = 4 },
{ Type = "SovietScoutVehicle", CustomDrawCount = 5 },
{ Type = "SovietAntiInfantryVehicle", CustomDrawCount = 3 },
{ Type = "SovietAntiAirShip", CustomDrawCount = 3 },
{ Type = "JapanAntiInfantryVehicle", CustomDrawCount = 4 },
{ Type = "CelestialAntiInfantryVehicle_B", CustomDrawCount = 3 },
{ Type = "CelestialAntiAirShip", CustomDrawCount = 3 },
{ Type = "AlliedAntiGroundAircraft", CustomDrawCount = 2 },
{ Type = "AlliedFighterAircraft", CustomDrawCount = 3 },
{ Type = "SovietAntiGroundAircraft", CustomDrawCount = 2 },
{ Type = "SovietFighterAircraft", CustomDrawCount = 3 },
{ Type = "CelestialFighterAircraft", CustomDrawCount = 3 },
{ Type = "CelestialSupportAircraft", CustomDrawCount = 2 },
{ Type = "AlliedAntiNavalScout", CustomDrawCount = 4, Sea = true },
{ Type = "AlliedAntiInfantryVehicle", CustomDrawCount = 4, Sea = true },
{ Type = "AlliedAntiAirShip", CustomDrawCount = 3, Sea = true },
{ Type = "SovietAntiNavyShipTech1", CustomDrawCount = 3, NoNavyProductionUnlockRound = 3 },
{ Type = "JapanNavyScoutShip", CustomDrawCount = 4, Sea = true },
{ Type = "CelestialAntiNavyShipTech1", CustomDrawCount = 4, Sea = true },
},
[2] = {
{ Type = "SovietHeavyAntiVehicleInfantry", CustomDrawCount = 3 },
{ Type = "JapanInfiltrationInfantry", CustomDrawCount = 3 },
{ Type = "CelestialInfiltrationInfantry", CustomDrawCount = 3 },
{ Type = "AlliedAntiVehicleVehicleTech1", CustomDrawCount = 3 },
{ Type = "prismtank", CustomDrawCount = 2 },
{ Type = "SovietHeavyAntiVehicleVehicleTech2", CustomDrawCount = 2 },
{ Type = "SovietSledgehammerSPG", CustomDrawCount = 2 },
{ Type = "JapanSentinelVehicle", CustomDrawCount = 2 },
{ Type = "CelestialAntiVehicleVehicleTech1", CustomDrawCount = 3 },
{ Type = "CelestialLongRangeMissileVehicle_B", CustomDrawCount = 2 },
{ Type = "JapanAntiVehicleVehicleTech1", CustomDrawCount = 2 },
{ Type = "JapanAntiAirVehicleTech1", CustomDrawCount = 2 },
{ Type = "AlliedSupportAircraft", CustomDrawCount = 2 },
{ Type = "CelestialAttackerAircraft", CustomDrawCount = 2 },
{ Type = "AlliedAntiNavyShipTech1", Sea = true },
{ Type = "SovietAntiNavyShipTech2", Sea = true },
{ Type = "JapanAntiVehicleShip", Sea = true },
{ Type = "CelestialAlmightlyShip", Sea = true },
{ Type = "JapanAntiAirShip", CustomDrawCount = 2, Sea = true },
},
[3] = {
{ Type = "AlliedCryoLegionnaire", CustomDrawCount = 2 },
{ Type = "CelestialAntiInfantryInfantryAdvanced", CustomDrawCount = 2 },
{ Type = "AlliedCommandoTech1" },
{ Type = "SovietCommandoTech1" },
{ Type = "JapanAntiVehicleInfantryTech3", CustomDrawCount = 3 },
{ Type = "JapanCommandoTech1" },
{ Type = "JapanMissileMechaAdvanced", CustomDrawCount = 2 },
{ Type = "AlliedAntiStructureVehicle" },
{ Type = "AlliedAntiVehicleVehicleTech3", CustomDrawCount = 2 },
{ Type = "SovietAntiStructureVehicle" },
{ Type = "SovietAntiVehicleVehicleTech3" },
{ Type = "JapanAntiVehicleVehicleTech3" },
{ Type = "JapanAntiStructureVehicle" },
{ Type = "CelestialAntiVehicleVehicleTech3" },
{ Type = "CelestialHeavyAntiAirVehicleTech3" },
{ Type = "CelestialAntiStructureVehicle" },
{ Type = "AlliedInterceptorAircraft", CustomDrawCount = 2 },
{ Type = "AlliedAntiStructureBomberAircraft" },
{ Type = "AlliedBomberAircraft" },
{ Type = "SovietInterceptorAircraft", CustomDrawCount = 2 },
{ Type = "SovietAntiGroundAttacker" },
{ Type = "SovietTransportAircraft" },
{ Type = "CelestialInterceptorAircraft", CustomDrawCount = 2 },
{ Type = "CelestialBomberAircraft" },
{ Type = "JapanInterceptorAircraft", CustomDrawCount = 3 },
{ Type = "AlliedAntiNavyShipTech3", Sea = true },
{ Type = "SovietAntiNavyShipTech3", Sea = true },
{ Type = "JapanAntiNavyShipTech3", Sea = true },
{ Type = "CelestialAntiNavyShipTech3", Sea = true },
},
[4] = {
{ Type = "AlliedFutureTank" },
{ Type = "AlliedBattleFortress" },
{ Type = "SovietAntiVehicleVehicleTech4" },
{ Type = "JapanMechaX" },
{ Type = "CelestialAntiVehicleVehicleTech4" },
{ Type = "AlliedGunshipAircraft" },
{ Type = "SovietBomberAircraft" },
{ Type = "CelestialAdvanceAircraftTech4", IsYaoguang = true,
LockPlayerProduction = true },
{ Type = "JapanGigaFortressShipEgg", Sea = true, IsBigShip = true,
LockPlayerProduction = true },
{ Type = "AlliedAntiStructureShip", Sea = true, IsBigShip = true },
{ Type = "SovietAntiStructureShip", Sea = true, IsBigShip = true },
{ Type = "JapanAntiStructureShip", Sea = true, IsBigShip = true },
{ Type = "CelestialAntiStructureShip", Sea = true, IsBigShip = true },
},
}
g_PureDrawProductionAliases = {
["AlliedAntiAirShip"] = { "AlliedAntiAirShip_Enhanced" },
["AlliedAntiInfantryVehicle"] = { "AlliedAntiInfantryVehicle_Ground", "AlliedAntiInfantryVehicle_Transport" },
["AlliedAntiInfantryVehicle_Ground"] = { "AlliedAntiInfantryVehicle" },
["AlliedAntiNavyShipTech1"] = { "AlliedAntiNavyShipTech1_Enhanced" },
["AlliedAntiNavyShipTech3"] = { "AlliedAntiNavyShipTech3_Enhanced" },
["AlliedAntiStructureBomberAircraft"] = { "AlliedAntiStructureBomberAircraft_Enhanced" },
["AlliedAntiStructureShip"] = { "AlliedAntiStructureShip_Enhanced" },
["AlliedAntiStructureVehicle"] = { "AlliedAntiStructureVehicle_Enhanced" },
["AlliedAntiVehicleVehicleTech1"] = { "AlliedAntiVehicleVehicleTech1_Enhanced" },
["AlliedAntiVehicleVehicleTech3"] = { "AlliedAntiVehicleVehicleTech3_Enhanced" },
["AlliedFighterAircraft"] = { "AlliedFighterAircraft_Enhanced", "AlliedFighterAircraft_WithTrailSomke" },
["AlliedGunshipAircraft"] = { "AlliedAC130GunshipAircraft", "AlliedGunshipAircraft_Enhanced" },
["AlliedInterceptorAircraft"] = { "AlliedInterceptorAircraft_Enhanced" },
["AlliedSupportAircraft"] = { "AlliedSupportAircraft_Enhanced" },
["CelestialAdvanceAircraftTech4"] = { "CelestialAdvanceAircraftTech4_Enhanced" },
["CelestialAlmightlyShip"] = { "CelestialAlmightlyShip_AA", "CelestialAlmightlyShip_Enhanced", "CelestialAlmightlyShip_FireWork", "CelestialAlmightlyShip_Old" },
["CelestialAntiAirShip"] = { "CelestialAntiAirVehicle", "CelestialAntiAirShip_Enhanced", "CelestialAntiAirShip_Enhanced_Water", "CelestialAntiAirShip_Water" },
["CelestialAntiInfantryVehicle_B"] = { "CelestialAntiInfantryVehicle" },
["CelestialAntiNavyShipTech3"] = { "CelestialAntiNavyShipTech3_EMC", "CelestialAntiNavyShipTech3_Enhanced", "CelestialAntiNavyShipTech3_Firework", "CelestialAntiNavyShipTech3_Old" },
["CelestialAntiStructureShip"] = { "CelestialAntiStructureShip_Enhanced", "CelestialAntiStructureShip_Firework", "CelestialAntiStructureShip_Firework_2024A", "CelestialAntiStructureShip_Firework_2024B", "CelestialAntiStructureShip_Firework_2024C", "CelestialAntiStructureShip_Firework_2024D", "CelestialAntiStructureShip_Old" },
["CelestialAntiStructureVehicle"] = { "CelestialAntiStructureVehicle_Enhanced" },
["CelestialAntiVehicleInfantry"] = { "CelestialAntiVehicleInfantry_EMC" },
["CelestialAntiVehicleVehicleTech1"] = { "CelestialAntiVehicleVehicleTech1_EMC" },
["CelestialAntiVehicleVehicleTech3"] = { "CelestialAntiVehicleVehicleTech3_EMC" },
["CelestialAntiVehicleVehicleTech4"] = { "CelestialAntiVehicleVehicleTech4_Enhanced", "CelestialAntiVehicleVehicleTech4_S01" },
["CelestialBomberAircraft"] = { "CelestialBomberAircraft_Enhanced" },
["CelestialFighterAircraft"] = { "CelestialFighterAircraft_WithBlueTrailSomke", "CelestialFighterAircraft_WithRedTrailSomke", "CelestialFighterAircraft_WithTrailSomke", "CelestialFighterAircraft_WithWhiteTrailSomke" },
["CelestialInfiltrationInfantry"] = { "CelestialInfiltrationInfantry_02", "CelestialInfiltrationInfantry_03", "CelestialInfiltrationInfantry_EMC" },
["CelestialInterceptorAircraft"] = { "CelestialInterceptorAircraft_Enhanced" },
["CelestialLongRangeMissileVehicle_B"] = { "CelestialLongRangeMissileVehicle" },
["JapanAntiAirShip"] = { "JapanAntiAirShip_Enhanced" },
["JapanAntiAirVehicleTech1"] = { "JapanAntiAirVehicleTech1_Enhanced", "JapanAntiAirVehicleTech1_Enhanced_Water" },
["JapanAntiInfantryVehicle"] = { "JapanAntiInfantryVehicle_Enhanced", "JapanAntiInfantryVehicle_Enhanced_Water" },
["JapanAntiNavyShipTech3"] = { "JapanAntiNavyShipTech3_Enhanced" },
["JapanAntiStructureShip"] = { "JapanAntiStructureShip_Enhanced" },
["JapanAntiStructureVehicle"] = { "JapanAntiStructureVehicle_Enhanced" },
["JapanAntiVehicleInfantry"] = { "JapanAntiVehicleInfantry_Ambush" },
["JapanAntiVehicleShip"] = { "JapanAntiVehicleShip_Enhanced" },
["JapanAntiVehicleVehicleTech1"] = { "JapanAntiVehicleVehicleTech1_Naval" },
["JapanAntiVehicleVehicleTech3"] = { "JapanAntiVehicleVehicleTech3_Movie" },
["JapanInterceptorAircraft"] = { "JapanInterceptorAircraft_Ground", "JapanInterceptorAircraft_WarfactoryWater" },
["JapanMechaX"] = { "JapanKingOniXMecha_Enhanced" },
["JapanMissileMechaAdvanced"] = { "JapanMissileMechaAdvanced_Enhanced", "JapanMissileMechaAdvanced_Enhanced_Water" },
["SovietAntiAirShip"] = { "SovietAntiAirShip_Ground" },
["SovietAntiGroundAircraft"] = { "SovietAntiGroundAircraft_Enhanced" },
["SovietAntiGroundAttacker"] = { "SovietAntiGroundAttacker_Enhanced" },
["SovietAntiNavyShipTech1"] = { "SovietAntiNavyShipTech1_AirAssault", "SovietAntiNavyShipTech1_Enhanced" },
["SovietAntiNavyShipTech2"] = { "SovietAntiNavyShipTech2_Enhanced" },
["SovietAntiStructureShip"] = { "SovietAntiStructureShip_Enhanced" },
["SovietAntiStructureVehicle"] = { "SovietAntiStructureVehicle_Enhanced" },
["SovietAntiVehicleVehicleTech3"] = { "SovietAntiVehicleVehicleTech3_Enhanced", "SovietAntiVehicleVehicleTech3_WOT" },
["SovietAntiVehicleVehicleTech4"] = { "SovietAntiVehicleVehicleTech4_Enhanced" },
["SovietBomberAircraft"] = { "SovietBomberAircraft_Movie" },
["SovietFighterAircraft"] = { "SovietFighterAircraft_Enhanced" },
["SovietHeavyAntiVehicleInfantry"] = { "SovietHeavyAntiVehicleInfantry_Enhanced" },
["SovietHeavyAntiVehicleVehicleTech2"] = { "SovietHeavyAntiVehicleVehicleTech2_Enhanced" },
["SovietInterceptorAircraft"] = { "SovietInterceptorAircraft_Enhanced" },
["SovietSledgehammerSPG"] = { "SovietSledgehammerSPG_Enhanced" },
["SovietTransportAircraft"] = { "SovietTransportAircraft_HeavyCannon" },
["prismtank"] = { "AlliedPrismTank_Enhanced" },
}
g_PureDrawBuildableUnitSet = {}
g_PureDrawUnitInfoByHash = {}
g_PureDrawQuota = { 0, 0, 0, 0, 0, 0 }
g_PureDrawTrackedCrates = {}
g_PureDrawTrackedCrateList = {}
g_PureDrawAirdropCrateIds = {}
g_PureDrawActiveAirdropPoints = {}
g_PureDrawScriptCreatedUnitIds = {}
g_PureDrawKnownPlayerUnitIds = {}
g_PureDrawKnownPlayerUnitSerial = 0
g_PureDrawPendingNativeResultIds = {}
g_PureDrawProducedUnitIds = {}
g_PureDrawLastRound = -1
g_PureDrawT4ShipUnlocked = { false, false, false, false, false, false }
g_PureDrawRegisteredProductionHashes = {}
g_PureDrawAirdropSerial = 0
g_PureDrawCustomSpawnSerial = 0
g_PureDrawAlwaysKnownUnitHashes = {}
g_PureDrawObservedPlayerUnitHashes = {}
g_PureDrawAlwaysKnownUnitTypes = {
"AlliedEngineer", "SovietEngineer", "JapanEngineer", "CelestialEngineer",
}
g_AppendTargetNames(g_PureDrawAlwaysKnownUnitTypes, "MCV")
for i = 1, getn(g_PureDrawAlwaysKnownUnitTypes), 1 do
local unitHash = FastHash(g_PureDrawAlwaysKnownUnitTypes[i])
g_PureDrawAlwaysKnownUnitHashes[unitHash] = true
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
end
g_PureDrawNativeEngineerHashes = {
[FastHash("AlliedEngineer")] = true,
[FastHash("SovietEngineer")] = true,
[FastHash("JapanEngineer")] = true,
[FastHash("CelestialEngineer")] = true,
}
g_PureDrawAirdropFormations = {
{
{ 0, 0 },
{ 140, 0 },
{ 107.24, 89.99 },
{ 24.30, 137.87 },
{ -70, 121.24 },
{ -131.56, 47.88 },
{ -131.56, -47.88 },
{ -70, -121.24 },
{ 24.30, -137.87 },
{ 107.24, -89.99 },
},
{
{ -180, -160 }, { -180, -80 }, { -180, 0 }, { -180, 80 }, { -180, 160 },
{ 180, -160 }, { 180, -80 }, { 180, 0 }, { 180, 80 }, { 180, 160 },
},
{
{ 0, -210 },
{ -70, -140 }, { 70, -140 },
{ -140, -70 }, { 140, -70 },
{ -140, 70 }, { 140, 70 },
{ -70, 140 }, { 70, 140 },
{ 0, 210 },
},
{
{ 0, -210 },
{ 52.90, -72.81 },
{ 199.72, -64.89 },
{ 85.60, 27.81 },
{ 123.43, 169.89 },
{ 0, 90 },
{ -123.43, 169.89 },
{ -85.60, 27.81 },
{ -199.72, -64.89 },
{ -52.90, -72.81 },
},
{
{ -200, -200 }, { -100, -100 },
{ 100, 100 }, { 200, 200 },
{ -200, 200 }, { -100, 100 },
{ 100, -100 }, { 200, -200 },
{ -35, 0 }, { 35, 0 },
},
{
{ 210, 0 }, { 105, 181.87 }, { -105, 181.87 },
{ -210, 0 }, { -105, -181.87 }, { 105, -181.87 },
{ 0, -85 }, { 85, 0 }, { 0, 85 }, { -85, 0 },
},
{
{ 0, -210 }, { 123.43, -169.89 },
{ 199.72, -64.89 }, { 199.72, 64.89 },
{ 123.43, 169.89 }, { 0, 210 },
{ -123.43, 169.89 }, { -199.72, 64.89 },
{ -199.72, -64.89 }, { -123.43, -169.89 },
},
{
{ 0, -210 }, { 199.72, -64.89 }, { 123.43, 169.89 },
{ -123.43, 169.89 }, { -199.72, -64.89 },
{ 79.03, -108.92 }, { 128.39, 41.72 }, { 0, 135 },
{ -128.39, 41.72 }, { -79.03, -108.92 },
},
}
for tier = 1, 4, 1 do
local pool = g_PureDrawBuildableUnitPool[tier]
for i = 1, getn(pool), 1 do
local info = pool[i]
info.Tier = tier
g_PureDrawBuildableUnitSet[info.Type] = true
g_PureDrawBuildableUnitSet[FastHash(info.Type)] = true
g_PureDrawUnitInfoByHash[FastHash(info.Type)] = info
local aliases = g_PureDrawProductionAliases[info.Type]
if aliases ~= nil then
for aliasIndex = 1, getn(aliases), 1 do
local aliasType = aliases[aliasIndex]
g_PureDrawBuildableUnitSet[aliasType] = true
g_PureDrawBuildableUnitSet[FastHash(aliasType)] = true
g_PureDrawUnitInfoByHash[FastHash(aliasType)] = info
end
end
end
end
function PureDrawIsHumanPlayer(playerIndex)
return EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", "Player_" .. playerIndex, "Human")
end
function PureDrawGetQuotaDisplayDirection(playerIndex)
local playerPosition = exWaypointGetPos(format("Player_%d_Start", playerIndex))
local startXTotal = 0
for i = 1, 8, 1 do
local startPosition = exWaypointGetPos(format("Player_%d_Start", i))
startXTotal = startXTotal + startPosition[1]
end
if playerPosition[1] < startXTotal / 6 then
return 1
end
return -1
end
function PureDrawSpawnQuotaWall(playerIndex, slot)
if not PureDrawIsHumanPlayer(playerIndex) then
return
end
local p = exWaypointGetPos(format("Player_%d_Start", playerIndex))
local direction = PureDrawGetQuotaDisplayDirection(playerIndex)
local name = format("PureDrawQuota_%d_%d", playerIndex, slot)
ExecuteAction("NAMED_DELETE", name)
ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", name, "AlliedWallPiece",
"PlyrCreeps/teamPlyrCreeps", "toupiaodian" .. playerIndex)
local wall = GetObjectByScriptName(name)
if wall ~= nil then
ObjectSetPosition(wall,
p[1] + direction * 260,
p[2] + (slot - 3) * 38,
p[3])
ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", wall, "Indestructible", true)
end
end
function PureDrawCreateQuotaDisplay(playerIndex)
for slot = 1, g_PureDrawConfig.ProductionQuota, 1 do
ExecuteAction("NAMED_DELETE", format("PureDrawQuota_%d_%d", playerIndex, slot))
if slot <= g_PureDrawQuota[playerIndex] then
PureDrawSpawnQuotaWall(playerIndex, slot)
end
end
if not PureDrawIsHumanPlayer(playerIndex) then
return
end
local p = exWaypointGetPos(format("Player_%d_Start", playerIndex))
local direction = PureDrawGetQuotaDisplayDirection(playerIndex)
local labelName = format("PureDrawQuotaLabel_%d", playerIndex)
ExecuteAction("NAMED_DELETE", labelName)
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", labelName, "MultiplayerBeacon",
format("Player_%d/teamPlayer_%d", playerIndex, playerIndex), {
X = p[1] + direction * 320,
Y = p[2],
Z = p[3],
}, 0)
TextDoActionLocalizedOnce("NAMED_SHOW_INFOBOX", labelName, "SCRIPT:PureDrawQuota", 0, "")
end
function PureDrawCanEnableUnit(playerIndex, info)
if info.LockPlayerProduction then
return false
end
if info.Type == "CelestialAntiInfantryInfantryAdvanced"
and EvaluateCondition("PLAYER_HAS_OBJECT_COMPARISON",
"Player_" .. playerIndex, "==", 0, "CelestialTechStructure") then
return false
end
if BanModeIsNameBanned(info.Type) == 1 then
return false
end
local round = exCounterGetByName("lvc") or 0
if info.ProductionUnlockRound ~= nil and round < info.ProductionUnlockRound then
return false
end
if g_DisableSeaArmy == 1 and info.NoNavyProductionUnlockRound ~= nil
and round < info.NoNavyProductionUnlockRound then
return false
end
if info.IsBigShip then
if not g_PureDrawT4ShipUnlocked[playerIndex] then
return false
end
if info.Type ~= "JapanGigaFortressShipEgg"
and exCounterGetByName("bigshiplimit" .. playerIndex) >= 2 then
return false
end
end
if info.IsYaoguang and GetPlayerYaoguangCount ~= nil and YAOGUANG_LIMIT ~= nil
and GetPlayerYaoguangCount(playerIndex) >= YAOGUANG_LIMIT then
return false
end
return true
end
function PureDrawSetPlayerBuildability(playerIndex, enable)
local playerName = "Player_" .. playerIndex
for tier = 1, 4, 1 do
local pool = g_PureDrawBuildableUnitPool[tier]
for i = 1, getn(pool), 1 do
local info = pool[i]
local availability = false
if enable and PureDrawCanEnableUnit(playerIndex, info) then
availability = true
end
ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, info.Type, availability)
local aliases = g_PureDrawProductionAliases[info.Type]
if aliases ~= nil then
for aliasIndex = 1, getn(aliases), 1 do
ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", playerName, aliases[aliasIndex], availability)
end
end
end
end
end
function PureDrawReapplyExhaustedQuotaAfterProduction(playerIndex)
if g_DrawMode ~= 2 or (g_PureDrawQuota[playerIndex] or 0) > 0 then
return
end
PureDrawSetPlayerBuildability(playerIndex, false)
end
function PureDrawRefreshQuota(playerIndex)
g_PureDrawQuota[playerIndex] = g_PureDrawConfig.ProductionQuota
PureDrawSetPlayerBuildability(playerIndex, true)
PureDrawCreateQuotaDisplay(playerIndex)
if PureDrawIsHumanPlayer(playerIndex) then
exAddTextToPublicBoardForPlayer("Player_" .. playerIndex,
Localization.get("pure_draw.quota.refreshed", g_PureDrawQuota[playerIndex]), 8)
end
end
function PureDrawGetBuildCost(createdObjInstanceId)
local info = g_PureDrawUnitInfoByHash[createdObjInstanceId]
if info == nil then
return 0
end
for faction = 1, 4, 1 do
for category = 1, 4, 1 do
local units = g_RecycleBtnsMapByFaction[faction][category]
for i = 1, getn(units), 1 do
if units[i].Type == info.Type then
return units[i].Money or 0
end
end
end
end
return 0
end
function PureDrawTryConsumeProductionQuota(createdObjId, createdObjInstanceId,
playerIndex, ownerPlayerName, retriesLeft)
if not ObjectIsAlive(createdObjId) or g_DrawMode ~= 2 then
return
end
local producer = ObjectGetProducerObject(createdObjId)
if producer == nil then
if retriesLeft > 0 then
SchedulerModule.delay_call(PureDrawTryConsumeProductionQuota, 1, {
createdObjId, createdObjInstanceId, playerIndex, ownerPlayerName, retriesLeft - 1
})
return
end
if createdObjInstanceId ~= FastHash("JapanMechaX")
and createdObjInstanceId ~= FastHash("JapanKingOniXMecha_Enhanced") then
return
end
end
local oldQuota = g_PureDrawQuota[playerIndex] or 0
if oldQuota <= 0 then
PureDrawSetPlayerBuildability(playerIndex, false)
SchedulerModule.delay_call(PureDrawReapplyExhaustedQuotaAfterProduction, 1, { playerIndex })
if PureDrawRemoveKnownPlayerUnit ~= nil then
PureDrawRemoveKnownPlayerUnit(createdObjId)
end
ExecuteAction("NAMED_DELETE", GetObjectById(createdObjId))
exAddTextToPublicBoardForPlayer(ownerPlayerName,
Localization.get("pure_draw.quota.exceeded"), 6)
return
end
g_PureDrawProducedUnitIds[createdObjId] = true
g_PureDrawQuota[playerIndex] = oldQuota - 1
ExecuteAction("NAMED_DELETE", format("PureDrawQuota_%d_%d", playerIndex, oldQuota))
exAddTextToPublicBoardForPlayer(ownerPlayerName,
Localization.get("pure_draw.quota.remaining", g_PureDrawQuota[playerIndex]), 5)
if g_PureDrawQuota[playerIndex] <= 0 then
PureDrawSetPlayerBuildability(playerIndex, false)
SchedulerModule.delay_call(PureDrawReapplyExhaustedQuotaAfterProduction, 1, { playerIndex })
end
end
function PureDrawRegisterKnownPlayerUnit(unitId, instanceId)
if unitId == nil then
return
end
local known = g_PureDrawKnownPlayerUnitIds[unitId]
if known ~= nil then
if instanceId ~= nil then
known.InstanceId = instanceId
end
return
end
g_PureDrawKnownPlayerUnitSerial = g_PureDrawKnownPlayerUnitSerial + 1
g_PureDrawKnownPlayerUnitIds[unitId] = {
Serial = g_PureDrawKnownPlayerUnitSerial,
InstanceId = instanceId,
}
g_PureDrawPendingNativeResultIds[unitId] = nil
end
function PureDrawRemoveKnownPlayerUnit(unitId)
if unitId == nil then
return
end
g_PureDrawKnownPlayerUnitIds[unitId] = nil
g_PureDrawPendingNativeResultIds[unitId] = nil
g_PureDrawScriptCreatedUnitIds[unitId] = nil
end
function PureDrawIsKnownPlayerUnit(unitId)
return g_PureDrawKnownPlayerUnitIds[unitId] ~= nil
end
function PureDrawInitializeKnownPlayerUnits()
if g_PureDrawKnownPlayerUnitFilter == nil then
g_PureDrawKnownPlayerUnitFilter = CreateObjectFilter({
Relationship = "SAME_PLAYER",
Include = "SELECTABLE",
Exclude = "STRUCTURE",
ExcludeThing = { "LuckyUnitCrateSeed", "UnitCrateNew", "UnitCrate" },
})
end
for playerIndex = 1, 8, 1 do
local units, count = ObjectFindObjects(P[playerIndex], nil,
g_PureDrawKnownPlayerUnitFilter)
for i = 1, count, 1 do
local unitId = ObjectGetId(units[i])
PureDrawRegisterKnownPlayerUnit(unitId, ObjectGetInstanceId(unitId))
end
end
end
function PureDrawOnAnyRegisteredUnitBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
if g_DrawMode ~= 2 or g_PlayerNameToIndex[ownerPlayerName] == nil then
return
end
if not g_PureDrawObservedPlayerUnitHashes[createdObjInstanceId] then
return
end
local createdUnit = GetObjectById(createdObjId)
if createdUnit == nil or not ObjectIsAlive(createdUnit) then
return
end
if PureDrawIsKnownPlayerUnit(createdObjId) then
return
end
local isScriptCreated = g_PureDrawScriptCreatedUnitIds[createdObjId]
local hasProducer = ObjectGetProducerObject(createdObjId) ~= nil
if g_PureDrawNativeEngineerHashes[createdObjInstanceId]
and not isScriptCreated and not hasProducer then
if not g_PureDrawPendingNativeResultIds[createdObjId] then
g_PureDrawPendingNativeResultIds[createdObjId] = true
SchedulerModule.delay_call(PureDrawObserveUnknownPlayerUnit, 1,
{ createdObjId, createdObjInstanceId, ownerPlayerName, 45 })
end
return
end
if g_PureDrawAlwaysKnownUnitHashes[createdObjInstanceId]
or isScriptCreated or hasProducer then
PureDrawRegisterKnownPlayerUnit(createdObjId, createdObjInstanceId)
return
end
if not g_PureDrawPendingNativeResultIds[createdObjId] then
g_PureDrawPendingNativeResultIds[createdObjId] = true
SchedulerModule.delay_call(PureDrawObserveUnknownPlayerUnit, 1,
{ createdObjId, createdObjInstanceId, ownerPlayerName, 45 })
end
end
function PureDrawOnBuildableUnitBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
local playerIndex = g_PlayerNameToIndex[ownerPlayerName]
if g_DrawMode ~= 2 or playerIndex == nil then
return
end
if g_PureDrawScriptCreatedUnitIds[createdObjId] then
g_PureDrawScriptCreatedUnitIds[createdObjId] = nil
PureDrawRegisterKnownPlayerUnit(createdObjId, createdObjInstanceId)
return
end
local producer = ObjectGetProducerObject(createdObjId)
if producer == nil then
if createdObjInstanceId ~= FastHash("JapanMechaX")
and createdObjInstanceId ~= FastHash("JapanKingOniXMecha_Enhanced") then
return
end
end
PureDrawTryConsumeProductionQuota(createdObjId, createdObjInstanceId,
playerIndex, ownerPlayerName, 3)
end
function PureDrawFindConsumedTrackedCrate(x, y, z, candidateFrame)
if x == nil or y == nil then
return nil
end
local nearestId, nearestDistanceSquared = nil, 1e9
for i = 1, getn(g_PureDrawTrackedCrateList), 1 do
local tid = g_PureDrawTrackedCrateList[i]
local state = g_PureDrawTrackedCrates[tid]
if state ~= nil and state.DestroyedFrame ~= nil and not state.Matched then
local dx = x - state.X
local dy = y - state.Y
local distanceSquared = dx * dx + dy * dy
local frameDistance = candidateFrame - state.DestroyedFrame
if frameDistance >= -3 and frameDistance <= 60
and distanceSquared < nearestDistanceSquared then
nearestDistanceSquared = distanceSquared
nearestId = tid
end
end
end
if nearestDistanceSquared <= 220 * 220 then
return nearestId, nearestDistanceSquared
end
return nil, nil
end
function PureDrawIsSameNativeBatchType(state, instanceId)
if state.BatchInstanceId == instanceId then
return true
end
local batchInfo = g_PureDrawUnitInfoByHash[state.BatchInstanceId]
if batchInfo ~= nil and g_PureDrawUnitInfoByHash[instanceId] == batchInfo then
return true
end
if state.BatchUnitIndex ~= nil and g_UnitNameToUnitIndex[instanceId] == state.BatchUnitIndex then
return true
end
return false
end
function PureDrawFindActiveNativeBatch(x, y, z, playerName, instanceId)
local nearestId, nearestDistanceSquared = nil, 1e9
local now = GetFrame()
for i = 1, getn(g_PureDrawTrackedCrateList), 1 do
local tid = g_PureDrawTrackedCrateList[i]
local state = g_PureDrawTrackedCrates[tid]
if state ~= nil and state.Matched and state.BatchUntilFrame ~= nil
and now <= state.BatchUntilFrame and state.BatchPlayer == playerName
and PureDrawIsSameNativeBatchType(state, instanceId) then
local dx = x - state.X
local dy = y - state.Y
local distanceSquared = dx * dx + dy * dy
if distanceSquared < nearestDistanceSquared then
nearestDistanceSquared = distanceSquared
nearestId = tid
end
end
end
if nearestDistanceSquared <= 260 * 260 then
return nearestId, nearestDistanceSquared
end
return nil, nil
end
for tier = 1, 4, 1 do
local pool = g_PureDrawBuildableUnitPool[tier]
for i = 1, getn(pool), 1 do
local unitHash = FastHash(pool[i].Type)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredProductionHashes[unitHash] then
RegisterUnitCreateCallback(pool[i].Type, PureDrawOnBuildableUnitBorn)
g_PureDrawRegisteredProductionHashes[unitHash] = true
end
local aliases = g_PureDrawProductionAliases[pool[i].Type]
if aliases ~= nil then
for aliasIndex = 1, getn(aliases), 1 do
local aliasHash = FastHash(aliases[aliasIndex])
g_PureDrawObservedPlayerUnitHashes[aliasHash] = true
if not g_PureDrawRegisteredProductionHashes[aliasHash] then
RegisterUnitCreateCallback(aliases[aliasIndex], PureDrawOnBuildableUnitBorn)
g_PureDrawRegisteredProductionHashes[aliasHash] = true
end
end
end
end
end
function PureDrawChooseWeightedUnit()
local roll = GetRandomNumber() * 100
local cumulative = 0
local selectedTier = 4
for tier = 1, 4, 1 do
cumulative = cumulative + g_PureDrawConfig.TierWeights[tier]
if roll < cumulative then
selectedTier = tier
break
end
end
local source = g_PureDrawBuildableUnitPool[selectedTier]
local eligible = {}
for i = 1, getn(source), 1 do
if BanModeIsNameBanned(source[i].Type) == 0 then
tinsert(eligible, source[i])
end
end
local index = floor(GetRandomNumber() * getn(eligible)) + 1
if index > getn(eligible) then
index = getn(eligible)
end
return eligible[index]
end
function PureDrawSpawnCustomUnit(playerName, x, y, z)
local info = PureDrawChooseWeightedUnit()
if info == nil then
return
end
local spawnCount = info.CustomDrawCount or 1
for spawnIndex = 1, spawnCount, 1 do
g_PureDrawCustomSpawnSerial = g_PureDrawCustomSpawnSerial + 1
local unitName = format("PureDrawCustom_%d", g_PureDrawCustomSpawnSerial)
local nextObjectId = GetNextObjectId()
g_PureDrawScriptCreatedUnitIds[nextObjectId] = true
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", unitName, info.Type,
format("%s/team%s", playerName, playerName), { X = x, Y = y, Z = z }, 0)
local unit = GetObjectByScriptName(unitName)
if ObjectIsAlive(unit) then
local actualId = ObjectGetId(unit)
if actualId ~= nextObjectId then
g_PureDrawScriptCreatedUnitIds[nextObjectId] = nil
g_PureDrawScriptCreatedUnitIds[actualId] = true
end
else
g_PureDrawScriptCreatedUnitIds[nextObjectId] = nil
end
end
end
g_PureDrawCollectorFilter = CreateObjectFilter({
Include = "SELECTABLE",
Exclude = "STRUCTURE",
ExcludeThing = {
"LuckyUnitCrateSeed",
"UnitCrateNew",
"UnitCrate",
},
})
function PureDrawFindCollector(x, y, z, radius)
local units, count = ObjectFindObjects(nil, {
X = x, Y = y, Z = z, Radius = radius or 80, DistType = "CENTER_2D"
}, g_PureDrawCollectorFilter)
for i = 1, count, 1 do
local playerName = ObjectPlayerScriptName(units[i])
if g_PlayerNameToIndex[playerName] ~= nil then
return playerName
end
end
return nil
end
function PureDrawDeleteNativeResultNear(x, y, z, playerName, batchInstanceId, batchUnitIndex)
if g_PureDrawNativeResultFilter == nil then
local nativeTypes = {}
for crateType = 1, 4, 1 do
local source = g_CrateUnitsTemplate[crateType]
for i = 1, getn(source), 1 do
tinsert(nativeTypes, source[i].Type)
end
end
for i = 1, getn(g_GroundCrateUnits), 1 do
tinsert(nativeTypes, g_GroundCrateUnits[i])
end
for i = 1, getn(g_AirCrateUnits), 1 do
tinsert(nativeTypes, g_AirCrateUnits[i])
end
for i = 1, getn(g_SeaCrateUnits), 1 do
tinsert(nativeTypes, g_SeaCrateUnits[i])
end
for i = 1, getn(g_PlayerEngineerTypes), 1 do
tinsert(nativeTypes, g_PlayerEngineerTypes[i])
end
for tier = 1, 4, 1 do
local source = g_PureDrawBuildableUnitPool[tier]
for i = 1, getn(source), 1 do
local unitType = source[i].Type
tinsert(nativeTypes, unitType)
local aliases = g_PureDrawProductionAliases[unitType]
if aliases ~= nil then
for aliasIndex = 1, getn(aliases), 1 do
tinsert(nativeTypes, aliases[aliasIndex])
end
end
end
end
g_PureDrawNativeResultFilter = CreateObjectFilter({
Rule = "ANY",
IncludeThing = nativeTypes,
})
end
local units, count = ObjectFindObjects(nil, {
X = x, Y = y, Z = z, Radius = 260, DistType = "CENTER_2D"
}, g_PureDrawNativeResultFilter)
for i = 1, count, 1 do
local unit = units[i]
local matchesPlayer = playerName == nil
or ObjectPlayerScriptName(unit) == playerName
local isUnproduced = ObjectGetProducerObject(unit) == nil
local unitId = ObjectGetId(unit)
local isUnknown = not PureDrawIsKnownPlayerUnit(unitId)
local instanceId = ObjectGetInstanceId(unitId)
local matchesBatchType = instanceId == batchInstanceId
or (batchUnitIndex ~= nil
and g_UnitNameToUnitIndex[instanceId] == batchUnitIndex)
or (g_PureDrawUnitInfoByHash[batchInstanceId] ~= nil
and g_PureDrawUnitInfoByHash[instanceId]
== g_PureDrawUnitInfoByHash[batchInstanceId])
if matchesPlayer and isUnproduced and isUnknown and matchesBatchType then
PureDrawRemoveKnownPlayerUnit(unitId)
ExecuteAction("NAMED_DELETE", unit)
end
end
end
function PureDrawRemoveTrackedCrate(id)
local state = g_PureDrawTrackedCrates[id]
if state == nil then
return
end
g_PureDrawTrackedCrates[id] = nil
local listIndex = state.ListIndex
if listIndex ~= nil and listIndex >= 1
and listIndex <= getn(g_PureDrawTrackedCrateList) then
local lastId = g_PureDrawTrackedCrateList[getn(g_PureDrawTrackedCrateList)]
g_PureDrawTrackedCrateList[listIndex] = lastId
g_PureDrawTrackedCrateList[getn(g_PureDrawTrackedCrateList)] = nil
if lastId ~= id and g_PureDrawTrackedCrates[lastId] ~= nil then
g_PureDrawTrackedCrates[lastId].ListIndex = listIndex
end
end
end
function PureDrawTrackCustomCrate(id)
local state = g_PureDrawTrackedCrates[id]
if state == nil then
return
end
local collectorPlayerName = PureDrawFindCollector(state.X, state.Y, state.Z, 65)
if collectorPlayerName ~= nil then
state.DestroyedFrame = GetFrame()
end
SchedulerModule.delay_call(PureDrawTrackCustomCrate, 1, { id })
end
function PureDrawIsNearAirdropPoint(unitId)
local x, y, z = ObjectGetPosition(unitId)
local detectRadius = 220
for pointIndex = 1, getn(g_PureDrawActiveAirdropPoints), 1 do
local point = g_PureDrawActiveAirdropPoints[pointIndex]
local dx = x - point[1]
local dy = y - point[2]
if dx * dx + dy * dy <= detectRadius * detectRadius then
return true
end
end
return false
end
function PureDrawOnNativeCrateResultBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
PureDrawOnAnyRegisteredUnitBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
end
function PureDrawObserveUnknownPlayerUnit(createdObjId, instanceId, playerName, retriesLeft)
if g_DrawMode ~= 2 or PureDrawIsKnownPlayerUnit(createdObjId) then
g_PureDrawPendingNativeResultIds[createdObjId] = nil
return
end
local createdUnit = GetObjectById(createdObjId)
if createdUnit == nil or not ObjectIsAlive(createdUnit) then
g_PureDrawPendingNativeResultIds[createdObjId] = nil
return
end
if ObjectGetProducerObject(createdObjId) ~= nil
or g_PureDrawScriptCreatedUnitIds[createdObjId]
or (g_PureDrawAlwaysKnownUnitHashes[instanceId]
and not g_PureDrawNativeEngineerHashes[instanceId]) then
PureDrawRegisterKnownPlayerUnit(createdObjId, instanceId)
return
end
local forceCustomDraw = g_PureDrawNativeEngineerHashes[instanceId] == true
local x, y, z = ObjectGetPosition(createdObjId)
local activeBatchId, activeBatchDistance = PureDrawFindActiveNativeBatch(x, y, z,
playerName, instanceId)
local consumedCrateId, consumedCrateDistance =
PureDrawFindConsumedTrackedCrate(x, y, z, GetFrame())
if activeBatchId ~= nil and (consumedCrateId == nil
or activeBatchDistance <= consumedCrateDistance) then
local activeState = g_PureDrawTrackedCrates[activeBatchId]
if activeState.UseCustomDraw or forceCustomDraw then
g_PureDrawPendingNativeResultIds[createdObjId] = nil
PureDrawRemoveKnownPlayerUnit(createdObjId)
ExecuteAction("NAMED_DELETE", createdUnit)
else
PureDrawRegisterKnownPlayerUnit(createdObjId, instanceId)
end
return
end
if consumedCrateId ~= nil then
g_PureDrawPendingNativeResultIds[createdObjId] = nil
local state = g_PureDrawTrackedCrates[consumedCrateId]
state.Matched = true
state.BatchPlayer = playerName
state.BatchInstanceId = instanceId
state.BatchUnitIndex = g_UnitNameToUnitIndex[instanceId]
state.BatchUntilFrame = GetFrame() + 18
if state.UseCustomDraw or forceCustomDraw then
SchedulerModule.delay_call(PureDrawInterceptNativeResult, 2,
{ createdObjId, playerName, state.X, state.Y, state.Z,
consumedCrateId, instanceId, state.BatchUnitIndex, 8 })
else
PureDrawRegisterKnownPlayerUnit(createdObjId, instanceId)
SchedulerModule.delay_call(PureDrawFinishNativePassThrough, 18,
{ consumedCrateId })
end
return
end
if retriesLeft > 0 then
SchedulerModule.delay_call(PureDrawObserveUnknownPlayerUnit, 1,
{ createdObjId, instanceId, playerName, retriesLeft - 1 })
return
end
PureDrawRegisterKnownPlayerUnit(createdObjId, instanceId)
end
function PureDrawFinishNativePassThrough(crateId)
PureDrawRemoveTrackedCrate(crateId)
end
function PureDrawInterceptNativeResult(createdObjId, playerName, x, y, z,
crateId, batchInstanceId, batchUnitIndex, passesLeft)
local state = g_PureDrawTrackedCrates[crateId]
if state == nil then
return
end
PureDrawDeleteNativeResultNear(x, y, z, playerName,
batchInstanceId, batchUnitIndex)
if ObjectIsAlive(createdObjId) then
PureDrawRemoveKnownPlayerUnit(createdObjId)
ExecuteAction("NAMED_DELETE", GetObjectById(createdObjId))
end
if not state.CustomResultSpawned then
state.CustomResultSpawned = true
PureDrawSpawnCustomUnit(playerName, x, y, z)
end
if passesLeft > 0 and GetFrame() <= state.BatchUntilFrame then
SchedulerModule.delay_call(PureDrawInterceptNativeResult, 2,
{ createdObjId, playerName, x, y, z, crateId,
batchInstanceId, batchUnitIndex, passesLeft - 1 })
return
end
PureDrawRemoveTrackedCrate(crateId)
end
function PureDrawJoinAIAttackTeam(unitId)
if not ObjectIsAlive(unitId) then
return
end
local unit = GetObjectById(unitId)
local actualOwnerPlayerName = ObjectPlayerScriptName(unit)
if actualOwnerPlayerName ~= "PlyrCivilian"
and actualOwnerPlayerName ~= "PlyrCreeps" then
return
end
local sideIndex = 7
if actualOwnerPlayerName == "PlyrCreeps" then
sideIndex = 8
end
local currentTeam = ObjectTeamName(unit)
local attackTeam = actualOwnerPlayerName .. "/ATTACK"
if currentTeam ~= attackTeam and currentTeam ~= "ATTACK" then
ExecuteAction("UNIT_SET_TEAM", unit, attackTeam)
if LEVELUP and LEVELUg_GetSideScanAnchor(sideIndex) then
local levelCount = LEVELUg_GetSideScanAnchor(sideIndex)
for i = 1, levelCount, 1 do
ExecuteAction("UNIT_GAIN_LEVEL", unit, 1)
end
end
end
end
g_PureDrawSeenAIUnitIds = {}
g_PureDrawJoinedAIUnitIds = {}
g_PureDrawAIUnitScanFilter = nil
g_PureDrawAirdropAIScanUntilFrame = 0
g_PureDrawAirdropAIScanActive = nil
function PureDrawTryJoinAirdropAIUnit(unitId)
if g_PureDrawJoinedAIUnitIds[unitId] or not ObjectIsAlive(unitId) then
return
end
local unit = GetObjectById(unitId)
local ownerPlayerName = ObjectPlayerScriptName(unit)
if ownerPlayerName ~= "PlyrCivilian" and ownerPlayerName ~= "PlyrCreeps" then
return
end
if not PureDrawIsNearAirdropPoint(unitId) then
return
end
g_PureDrawJoinedAIUnitIds[unitId] = true
PureDrawJoinAIAttackTeam(unitId)
end
function PureDrawOnAIUnitBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
if g_DrawMode ~= 2 then
return
end
if ownerPlayerName ~= "PlyrCivilian" and ownerPlayerName ~= "PlyrCreeps" then
return
end
SchedulerModule.delay_call(PureDrawTryJoinAirdropAIUnit, 2, { createdObjId })
end
function PureDrawInitializeAIUnitScanFilter()
if g_PureDrawAIUnitScanFilter == nil then
g_PureDrawAIUnitScanFilter = CreateObjectFilter({
Relationship = "SAME_PLAYER",
Include = "SELECTABLE",
Exclude = "STRUCTURE",
ExcludeThing = {
"LuckyUnitCrateSeed",
"UnitCrateNew",
"UnitCrate",
},
})
end
end
function PureDrawScanNewAIUnitsNearAirdrops(markOnly)
PureDrawInitializeAIUnitScanFilter()
for sideIndex = 7, 8, 1 do
local units, count = ObjectFindObjects(g_GetSideScanAnchor(sideIndex), nil,
g_PureDrawAIUnitScanFilter)
for i = 1, count, 1 do
local unit = units[i]
local unitId = ObjectGetId(unit)
if not g_PureDrawSeenAIUnitIds[unitId] then
g_PureDrawSeenAIUnitIds[unitId] = true
if not markOnly and not g_PureDrawJoinedAIUnitIds[unitId] then
PureDrawTryJoinAirdropAIUnit(unitId)
end
end
end
end
end
function PureDrawContinueAirdropAIUnitScan()
if g_DrawMode ~= 2 or GetFrame() > g_PureDrawAirdropAIScanUntilFrame then
g_PureDrawAirdropAIScanActive = nil
return
end
PureDrawScanNewAIUnitsNearAirdrops(nil)
SchedulerModule.delay_call(PureDrawContinueAirdropAIUnitScan,
g_PureDrawConfig.AirdropUnitScanInterval, {})
end
function PureDrawStartAirdropAIUnitScan()
g_PureDrawAirdropAIScanUntilFrame = GetFrame()
+ g_PureDrawConfig.AirdropUnitScanFrames
if g_PureDrawAirdropAIScanActive then
return
end
g_PureDrawAirdropAIScanActive = true
PureDrawScanNewAIUnitsNearAirdrops(true)
SchedulerModule.delay_call(PureDrawContinueAirdropAIUnitScan,
g_PureDrawConfig.AirdropUnitScanInterval, {})
end
g_PureDrawRegisteredAIUnitHashes = {}
for unitIndex = 1, unitcountmax, 1 do
local unitType = UNITLIST[unitIndex]
local unitHash = FastHash(unitType)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredAIUnitHashes[unitHash] then
RegisterUnitCreateCallback(unitType, PureDrawOnAIUnitBorn)
g_PureDrawRegisteredAIUnitHashes[unitHash] = true
end
end
function PureDrawOnCrateSeedBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
local x, y, z = ObjectGetPosition(createdObjId)
local isAirdrop = g_PureDrawAirdropCrateIds[createdObjId] == true
local trackCrate = g_DrawMode == 2 and not isAirdrop
if trackCrate then
local roll = GetRandomNumber()
local listIndex = getn(g_PureDrawTrackedCrateList) + 1
g_PureDrawTrackedCrateList[listIndex] = createdObjId
g_PureDrawTrackedCrates[createdObjId] = {
X = x,
Y = y,
Z = z,
Owner = ownerPlayerName,
ListIndex = listIndex,
UseCustomDraw = roll < g_PureDrawConfig.CustomDrawChance,
Matched = false,
}
end
if not isAirdrop then
SchedulerModule.delay_call(NoCreatesInCenter, 1, { createdObjId })
end
if trackCrate then
SchedulerModule.delay_call(PureDrawTrackCustomCrate, 2, { createdObjId })
end
end
function PureDrawOnPhysicalCrateBorn(createdObjId, createdObjInstanceId, ownerPlayerName)
local x, y, z = ObjectGetPosition(createdObjId)
local isAirdrop = g_PureDrawAirdropCrateIds[createdObjId] == true
local trackCrate = g_DrawMode == 2 and not isAirdrop
if trackCrate then
local roll = GetRandomNumber()
local listIndex = getn(g_PureDrawTrackedCrateList) + 1
g_PureDrawTrackedCrateList[listIndex] = createdObjId
g_PureDrawTrackedCrates[createdObjId] = {
X = x,
Y = y,
Z = z,
Owner = ownerPlayerName,
ListIndex = listIndex,
UseCustomDraw = roll < g_PureDrawConfig.CustomDrawChance,
Matched = false,
}
end
if not isAirdrop then
SchedulerModule.delay_call(NoCreatesInCenter, 1, { createdObjId })
end
if trackCrate then
SchedulerModule.delay_call(PureDrawTrackCustomCrate, 2, { createdObjId })
end
end
function PureDrawChooseNativeAllowedUnit()
local pool = {}
for crateType = 1, 4, 1 do
if BanModeRecycleCategoryEnabled(crateType) == 1 then
local source = g_CrateUnitsTemplate[crateType]
for i = 1, getn(source), 1 do
tinsert(pool, source[i])
end
end
end
if getn(pool) == 0 then
return nil
end
local index = floor(GetRandomNumber() * getn(pool)) + 1
if index > getn(pool) then
index = getn(pool)
end
return pool[index]
end
function PureDrawReplaceNativeBannedResult(createdObjId, createdObjInstanceId, ownerPlayerName, banType)
if g_DrawMode ~= 2 or g_PlayerNameToIndex[ownerPlayerName] == nil then
return
end
if BanModeIsTypeBanned(banType) ~= 1 then
return
end
SchedulerModule.delay_call(PureDrawApplyNativeBannedReplace, 1,
{ createdObjId, ownerPlayerName })
end
function PureDrawReplaceNativeInfantryResult(id, instId, owner)
PureDrawReplaceNativeBannedResult(id, instId, owner, "infantry")
end
function PureDrawReplaceNativeVehicleResult(id, instId, owner)
PureDrawReplaceNativeBannedResult(id, instId, owner, "vehicle")
end
function PureDrawReplaceNativeAircraftResult(id, instId, owner)
PureDrawReplaceNativeBannedResult(id, instId, owner, "aircraft")
end
function PureDrawReplaceNativeNavyResult(id, instId, owner)
PureDrawReplaceNativeBannedResult(id, instId, owner, "navy")
end
function PureDrawApplyNativeBannedReplace(id, playerName)
if not ObjectIsAlive(id) or ObjectGetProducerObject(id) ~= nil then
return
end
local unit = GetObjectById(id)
local x, y, z = ObjectGetPosition(unit)
local info = PureDrawChooseNativeAllowedUnit()
if info == nil then
return
end
ExecuteAction("NAMED_DELETE", unit)
local nextObjectId = GetNextObjectId()
g_PureDrawScriptCreatedUnitIds[nextObjectId] = true
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", "", info.Type,
format("%s/team%s", playerName, playerName), { X = x, Y = y, Z = z }, 0)
end
g_PureDrawNativeCrateHandlers = {
infantry = PureDrawReplaceNativeInfantryResult,
vehicle = PureDrawReplaceNativeVehicleResult,
aircraft = PureDrawReplaceNativeAircraftResult,
navy = PureDrawReplaceNativeNavyResult,
}
function PureDrawRegisterNativeCrateBans(list)
for i = 1, getn(list), 1 do
local unitType = list[i]
local types = BanModeGetNameTypes(unitType)
if types ~= nil then
for t = 1, getn(types), 1 do
RegisterUnitCreateCallback(unitType, g_PureDrawNativeCrateHandlers[types[t]])
end
end
end
end
PureDrawRegisterNativeCrateBans(g_GroundCrateUnits)
PureDrawRegisterNativeCrateBans(g_AirCrateUnits)
PureDrawRegisterNativeCrateBans(g_SeaCrateUnits)
function PureDrawFindAirdropOwnerTeam()
for playerIndex = 1, 8, 1 do
local playerName = "Player_" .. playerIndex
if EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", playerName, "Human") then
return playerName .. "/crate"
end
end
return nil
end
function PureDrawRegisterAirdropPoint(x, y)
for pointIndex = 1, getn(g_PureDrawActiveAirdropPoints), 1 do
local point = g_PureDrawActiveAirdropPoints[pointIndex]
if point[1] == x and point[2] == y then
return
end
end
tinsert(g_PureDrawActiveAirdropPoints, { x, y })
end
function PureDrawSpawnAirdropCrate(serial, i, ownerTeam,
centerX, centerY, centerZ, offsetX, offsetY)
local crateName = format("PureDrawAirdrop_%d_%d", serial, i)
local nextObjectId = GetNextObjectId()
g_PureDrawAirdropCrateIds[nextObjectId] = true
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", crateName, "LuckyUnitCrateSeed",
ownerTeam, {
X = centerX + offsetX,
Y = centerY + offsetY,
Z = centerZ,
}, 0)
local crate = GetObjectByScriptName(crateName)
if ObjectIsAlive(crate) then
local actualId = ObjectGetId(crate)
g_PureDrawAirdropCrateIds[actualId] = true
PureDrawRegisterAirdropPoint(centerX + offsetX, centerY + offsetY)
ExecuteAction("OBJECT_CREATE_RADAR_EVENT", crate, "Information")
return true
end
return false
end
function PureDrawSpawnAirdrop()
local leftTower = GetObjectByScriptName("T74")
local rightTower = GetObjectByScriptName("T84")
if not ObjectIsAlive(leftTower) or not ObjectIsAlive(rightTower) then
return
end
local lx, ly, lz = ObjectGetPosition(leftTower)
local rx, ry, rz = ObjectGetPosition(rightTower)
local centerX = 3547.06
local centerY = 3055.49
local centerZ = (lz + rz) / 2
local ownerTeam = PureDrawFindAirdropOwnerTeam()
if ownerTeam == nil then
return
end
g_PureDrawAirdropSerial = g_PureDrawAirdropSerial + 1
local formationCount = getn(g_PureDrawAirdropFormations)
local formationIndex = floor(GetRandomNumber() * formationCount) + 1
if formationIndex > formationCount then
formationIndex = formationCount
end
local formation = g_PureDrawAirdropFormations[formationIndex]
local spawnedCount = 0
for i = 1, getn(formation), 1 do
local offset = formation[i]
if PureDrawSpawnAirdropCrate(g_PureDrawAirdropSerial, i, ownerTeam,
centerX, centerY, centerZ, offset[1], offset[2]) then
spawnedCount = spawnedCount + 1
end
end
if spawnedCount > 0 then
PureDrawStartAirdropAIUnitScan()
exAddTextToPublicBoard(Localization.get("pure_draw.airdrop"), 12)
end
end
function PureDrawAirdropCheck()
if g_DrawMode == 2 then
local roll = GetRandomNumber()
if roll < g_PureDrawConfig.AirdropChance then
PureDrawSpawnAirdrop()
end
end
SchedulerModule.delay_call(PureDrawAirdropCheck, g_PureDrawConfig.AirdropCheckFrames, {})
end
function PureDrawOnRoundBeginRefreshQuota()
if g_DrawMode ~= 2 then
return
end
local round = exCounterGetByName("lvc")
if round == nil or round <= 0 or round == g_PureDrawLastRound then
return
end
g_PureDrawLastRound = round
if mod(round, g_PureDrawConfig.RefreshRounds) == 0 then
for playerIndex = 1, 8, 1 do
PureDrawRefreshQuota(playerIndex)
end
end
end
function PureDrawRegisterRoundBeginRefresh()
if g_PureDrawRoundBeginRefreshRegistered or RoundLuaManager == nil then
return
end
RoundLuaManager.CallOnEveryRoundBegin(PureDrawOnRoundBeginRefreshQuota, {})
g_PureDrawRoundBeginRefreshRegistered = true
end
function PureDrawReapplyPlayerQuota(playerIndex)
if g_DrawMode ~= 2 then
return
end
PureDrawSetPlayerBuildability(playerIndex, (g_PureDrawQuota[playerIndex] or 0) > 0)
end
function PureLuckyCrateMode_Setting()
if g_PureDrawInitialized then
return
end
g_PureDrawInitialized = true
PureDrawRegisterRoundBeginRefresh()
PureDrawInitializeKnownPlayerUnits()
TryEnableLuckyCrateIfAllowed()
if g_PureDrawNavalYardFilter == nil then
g_PureDrawNavalYardFilter = CreateObjectFilter({
Rule = "ANY",
IncludeThing = {
"AlliedNavalYard", "SovietNavalYard", "JapanNavalYard", "CelestialNavalYard"
}
})
end
local yards, yardCount = ObjectFindObjects(nil, nil, g_PureDrawNavalYardFilter)
for yardIndex = 1, yardCount, 1 do
local yardOwner = ObjectPlayerScriptName(yards[yardIndex])
if g_PlayerNameToIndex[yardOwner] ~= nil then
ExecuteAction("NAMED_DELETE", yards[yardIndex])
end
end
for playerIndex = 1, 8, 1 do
PureDrawRefreshQuota(playerIndex)
end
SchedulerModule.delay_call(PureDrawBackupSpawnTransports, 5, {})
SchedulerModule.delay_call(PureDrawAirdropCheck, g_PureDrawConfig.AirdropCheckFrames, {})
end
SchedulerModule.delay_call(function()
local crateFilter = CreateObjectFilter({ IncludeThing = { "GenericCrateSpawner" } })
local units, count = ObjectFindObjects(nil, nil, crateFilter)
if count <= 0 then
return
end
for j = 1, count, 1 do
ExecuteAction("NAMED_DELETE", units[j])
end
if g_DrawMode == nil or g_DrawMode == 0 then
g_DrawMode = 1
g_LuckyCrateMode = 1
end
if not g_HextechCountManuallySet then
g_HextechCount = 3
if BtnChoiceDialogEventFunc_ApplyHostHextechSetting ~= nil then
BtnChoiceDialogEventFunc_ApplyHostHextechSetting()
end
end
end, 1, {})
SchedulerModule.delay_call(function()
local crateFilter = CreateObjectFilter({
IncludeThing = {
"GenericCrateSpawner",
"UnitCrateNew",
"ShroudCrate",
"MoneyCrateMP",
}
})
local units, count = ObjectFindObjects(nil, nil, crateFilter)
for j = 1, count, 1 do
ExecuteAction("NAMED_DELETE", units[j])
end
end, 45, {})
function PureDrawGetOutpostSideName(outpost)
local ownerName = ObjectPlayerScriptName(outpost)
if ownerName == "PlyrCivilian" or ownerName == "PlyrCreeps" then
return ownerName
end
local teamName = ObjectTeamName(outpost)
if teamName ~= nil then
if strfind(teamName, "PlyrCivilian") ~= nil then
return "PlyrCivilian"
end
if strfind(teamName, "PlyrCreeps") ~= nil then
return "PlyrCreeps"
end
end
return nil
end
function PureDrawGetOutpostDropPosition(sideName, playerIndex)
if not g_CelestialOutpostsFilter then
g_CelestialOutpostsFilter = CreateObjectFilter({ IncludeThing = { "CelestialOutpost" } })
end
local outposts, count = ObjectFindObjects(nil, nil, g_CelestialOutpostsFilter)
if count <= 0 then
return nil
end
local candidates = {}
for i = 1, count, 1 do
local ownerSide = PureDrawGetOutpostSideName(outposts[i])
if ownerSide ~= nil and (sideName == nil or ownerSide == sideName) then
tinsert(candidates, outposts[i])
end
end
if getn(candidates) == 0 then
if sideName == nil then
return nil
end
local start = exWaypointGetPos(format("Player_%d_Start", playerIndex))
local bestDistance = nil
for i = 1, count, 1 do
local ox, oy = ObjectGetPosition(outposts[i])
local dx = ox - start[1]
local dy = oy - start[2]
local distance = dx * dx + dy * dy
if bestDistance == nil or distance < bestDistance then
bestDistance = distance
candidates[1] = outposts[i]
end
end
end
local total = getn(candidates)
if total == 0 then
return nil
end
local index = ceil(GetRandomNumber() * total)
if index < 1 then
index = 1
end
if index > total then
index = total
end
local outpost = candidates[index]
local dropSide = sideName
if dropSide == nil then
dropSide = PureDrawGetOutpostSideName(outpost)
end
local RandomInRange = function(min, max)
local sign = 1
if GetRandomNumber() < 0.5 then
sign = -1
end
return (min + (GetRandomNumber() * (max - min))) * sign
end
local offsetX = RandomInRange(50, 200)
local offsetY = RandomInRange(50, 150)
if dropSide == "PlyrCreeps" and offsetY < 0 then
offsetY = -offsetY
elseif dropSide == "PlyrCivilian" and offsetY > 0 then
offsetY = -offsetY
end
local x, y, z = ObjectGetPosition(outpost)
return { X = x + offsetX, Y = y + offsetY, Z = z }
end
function NoCreatesInCenter(id)
if not ObjectIsAlive(id) then
return
end
if g_PureDrawAirdropCrateIds[id] then
return
end
local crate = GetObjectById(id)
local isCrateInCenter = false
if EvaluateCondition("NAMED_INSIDE_AREA", crate, "SHOW7")
and EvaluateCondition("NAMED_INSIDE_AREA", crate, "SHOW8") then
isCrateInCenter = true
end
if not isCrateInCenter then
return
end
local position = PureDrawGetOutpostDropPosition()
if position == nil then
return
end
ObjectSetPosition(crate, position.X, position.Y, position.Z)
local trackedState = g_PureDrawTrackedCrates[id]
if trackedState ~= nil then
trackedState.X = position.X
trackedState.Y = position.Y
trackedState.Z = position.Z
end
ExecuteAction("OBJECT_CREATE_RADAR_EVENT", crate, "Information")
if g_LastWarningFrame ~= nil and g_LastWarningFrame + 30 > GetFrame() then
else
g_LastWarningFrame = GetFrame()
exMessageAppendToMessageArea(Localization.get("error.crate_in_battlefield"))
end
end
g_AIBannedTypes = {
"CelestialTransportUAV",
}
g_AppendTargetNames(g_AIBannedTypes, "Transport")
g_PureDrawReservedTransportIds = {}
g_PureDrawReservedTransportFilter = nil
g_PureDrawReservedTransportType = "JapanLightTransportVehicle"
function PureDrawBackupSpawnTransports()
local start = exCounterGetByName("start")
if start == nil or start <= 0 then
SchedulerModule.delay_call(PureDrawBackupSpawnTransports, 30, {})
return
end
if g_PureDrawReservedTransportFilter == nil then
g_PureDrawReservedTransportFilter = CreateObjectFilter({
Rule = "ANY",
IncludeThing = { g_PureDrawReservedTransportType }
})
end
local units, count = ObjectFindObjects(nil, nil, g_PureDrawReservedTransportFilter)
for i = 1, count, 1 do
local unit = units[i]
if ObjectIsAlive(unit) then
g_PureDrawReservedTransportIds[ObjectGetId(unit)] = true
end
end
SchedulerModule.delay_call(NoMCVInCenter, 30, {})
end
function IsPureDrawReservedTransport(unit)
if unit == nil then
return false
end
return g_PureDrawReservedTransportIds[ObjectGetId(unit)] == true
end
g_DragonShipSkillTeamNames = {
["PlyrCivilian/ATTACK"] = true,
["PlyrCreeps/ATTACK"] = true,
["ATTACK"] = true,
}
function IsSkillDragonShip(unit)
if unit == nil then
return false
end
local teamName = ObjectTeamName(unit)
return g_DragonShipSkillTeamNames[teamName] == true
end
function NoMCVInCenter()
if not g_CelestialOutpostsFilter then
g_CelestialOutpostsFilter = CreateObjectFilter({ IncludeThing = { "CelestialOutpost" } })
end
local mcvFilter = CreateObjectFilter({
Rule = "ANY",
IncludeThing = g_MCVTypes
})
local mcvs, mcvCount = ObjectFindObjects(nil, nil, mcvFilter)
for i = 1, mcvCount, 1 do
local mcv = mcvs[i]
if ObjectIsAlive(mcv) then
local isMCVInCenter = false
if EvaluateCondition("NAMED_INSIDE_AREA", mcv, "SHOW7")
and EvaluateCondition("NAMED_INSIDE_AREA", mcv, "SHOW8") then
isMCVInCenter = true
end
if isMCVInCenter then
local ownerPlayerName = ObjectPlayerScriptName(mcv)
local playerIndex = g_PlayerNameToIndex[ownerPlayerName]
if playerIndex == nil and not IsSkillDragonShip(mcv) then
ExecuteAction("NAMED_KILL", mcv)
end
end
end
end
local bannedFilter = CreateObjectFilter({
Rule = "ANY",
IncludeThing = g_AIBannedTypes
})
local bannedUnits, bannedCount = ObjectFindObjects(nil, nil, bannedFilter)
for i = 1, bannedCount, 1 do
local unit = bannedUnits[i]
if ObjectIsAlive(unit) then
if IsPureDrawReservedTransport(unit) then
else
local ownerPlayerName = ObjectPlayerScriptName(unit)
local playerIndex = g_PlayerNameToIndex[ownerPlayerName]
if playerIndex == nil then
ExecuteAction("NAMED_KILL", unit)
end
end
end
end
SchedulerModule.delay_call(NoMCVInCenter, 30, {})
end
RegisterUnitCreateCallback("LuckyUnitCrateSeed", PureDrawOnCrateSeedBorn)
RegisterUnitCreateCallback("UnitCrateNew", PureDrawOnPhysicalCrateBorn)
RegisterUnitCreateCallback("UnitCrate", PureDrawOnPhysicalCrateBorn)
g_PureDrawRegisteredNativeCrateHashes = {}
for crateType = 1, 4, 1 do
local source = g_CrateUnitsTemplate[crateType]
for i = 1, getn(source), 1 do
local unitType = source[i].Type
local unitHash = FastHash(unitType)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredNativeCrateHashes[unitHash] then
RegisterUnitCreateCallback(unitType, PureDrawOnNativeCrateResultBorn)
g_PureDrawRegisteredNativeCrateHashes[unitHash] = true
end
end
end
for i = 1, getn(g_GroundCrateUnits), 1 do
local unitType = g_GroundCrateUnits[i]
local unitHash = FastHash(unitType)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredNativeCrateHashes[unitHash] then
RegisterUnitCreateCallback(unitType, PureDrawOnNativeCrateResultBorn)
g_PureDrawRegisteredNativeCrateHashes[unitHash] = true
end
end
for i = 1, getn(g_AirCrateUnits), 1 do
local unitType = g_AirCrateUnits[i]
local unitHash = FastHash(unitType)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredNativeCrateHashes[unitHash] then
RegisterUnitCreateCallback(unitType, PureDrawOnNativeCrateResultBorn)
g_PureDrawRegisteredNativeCrateHashes[unitHash] = true
end
end
for i = 1, getn(g_SeaCrateUnits), 1 do
local unitType = g_SeaCrateUnits[i]
local unitHash = FastHash(unitType)
g_PureDrawObservedPlayerUnitHashes[unitHash] = true
if not g_PureDrawRegisteredNativeCrateHashes[unitHash] then
RegisterUnitCreateCallback(unitType, PureDrawOnNativeCrateResultBorn)
g_PureDrawRegisteredNativeCrateHashes[unitHash] = true
end
end