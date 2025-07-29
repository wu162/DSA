FilterLIST = {}
UNITLIST = {}
UNITCOUNT = {}
P = {}
ANYUNITCOUNT = {}
--unitcountmax = 200
for i = 1 , 8 , 1 do
    P[i] = GetObjectByScriptName("P"..i) ;
    ANYUNITCOUNT[i] = 0 ;
end
UNITLIST [1] = "SovietCommandoTech1"
UNITLIST [2] = "JapanCommandoTech1"
UNITLIST [3] = "AlliedCommandoTech1"
UNITLIST [4] = "AlliedCryoLegionnaire"
UNITLIST [5] = "AlliedAntiInfantryInfantry"
UNITLIST [6] = "CelestialAntiInfantryInfantryAdvanced"
UNITLIST [7] = "CelestialAntiInfantryInfantry"
UNITLIST [8] = "CelestialAntiVehicleInfantry"
UNITLIST [9] = "AlliedScoutInfantry"
UNITLIST [10] = "CelestialInfiltrationInfantry"
local index = 10
index = index + 1 ;
UNITLIST [index] = "AlliedRangerInfantry"
index = index + 1 ;
UNITLIST [index] = "JapanAntiInfantryInfantry"
index = index + 1 ;
UNITLIST [index] = "JapanAntiVehicleInfantry"
index = index + 1 ;
UNITLIST [index] = "JapanArcherInfantry"
index = index + 1 ;
UNITLIST [index] = "SovietAntiInfantryInfantry"
index = index + 1 ;
UNITLIST [index] = "SovietAntiVehicleInfantry"
index = index + 1 ;
UNITLIST [index] = "SovietHeavyAntiVehicleInfantry"
index = index + 1 ;
UNITLIST [index] = "JapanInfiltrationInfantry"
index = index + 1 ;
UNITLIST [index] = "SovietScoutInfantry"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiVehicleInfantry"
index = index + 1 ;
UNITLIST [index] = "CelestialInfiltrationInfantry"
index = index + 1 ;
--exMessageAppendToMessageArea("indexINFANT"..index)
step1 = index-1 ;
--index = 51
--UNITLIST [index] = "AlliedAntiAirVehicleTech1"
--index = index + 1 ;
UNITLIST [index] = "AlliedAntiInfantryVehicle"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiVehicleVehicleTech1"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiVehicleVehicleTech3"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiAirShip"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiAirVehicle"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiInfantryVehicle"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiInfantryVehicle_B"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiVehicleVehicleTech1"
index = index + 1 ;
UNITLIST [index] = "CelestialLongRangeMissileVehicle"
index = index + 1 ;
UNITLIST [index] = "JapanAntiInfantryVehicle"
index = index + 1 ;
UNITLIST [index] = "JapanAntiAirVehicleTech1"
index = index + 1 ;
UNITLIST [index] = "JapanAntiVehicleVehicleTech1"
index = index + 1 ;
UNITLIST [index] = "JapanSentinelVehicle"
index = index + 1 ;
-- UNITLIST [index] = "SovietAntiAirShip"
-- index = index + 1 ;
UNITLIST [index] = "SovietAntiInfantryVehicle"
index = index + 1 ;
UNITLIST [index] = "SovietAntiVehicleVehicleTech1"
index = index + 1 ;
UNITLIST [index] = "SovietAntiVehicleVehicleTech2"
index = index + 1 ;
UNITLIST [index] = "SovietHeavyAntiVehicleVehicleTech2"
index = index + 1 ;
UNITLIST [index] = "SovietSledgehammerSPG"
index = index + 1 ;
UNITLIST [index] = "SovietScoutVehicle"
index = index + 1 ;
UNITLIST [index] = "SovietAntiStructureVehicle"
index = index + 1 ;
UNITLIST [index] = "JapanAntiStructureVehicle"
index = index + 1 ;
UNITLIST [index] = "JapanMissileMechaAdvanced"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiStructureVehicle"
index = index + 1 ;
UNITLIST [index] = "CelestialLongRangeMissileVehicle_B"
index = index + 1 ;
UNITLIST [index] = "SovietMortarCycle"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiStructureVehicle"
index = index + 1 ;
UNITLIST [index] = "prismtank"
index = index + 1 ;
--exMessageAppendToMessageArea("indexLIGHTVEH"..index)
step2 = index-1
--index = 101
UNITLIST [index] = "AlliedFutureTank"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiVehicleVehicleTech3"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiVehicleVehicleTech4"
index = index + 1 ;
UNITLIST [index] = "CelestialHeavyAntiAirVehicleTech3"
index = index + 1 ;
UNITLIST [index] = "JapanAntiVehicleVehicleTech3"
index = index + 1 ;
UNITLIST [index] = "JapanMechaX"
index = index + 1 ;
UNITLIST [index] = "SovietAntiVehicleVehicleTech3"
index = index + 1 ;
UNITLIST [index] = "SovietAntiVehicleVehicleTech4"
index = index + 1 ;
UNITLIST [index] = "SovietGrinderVehicle"
index = index + 1 ;
UNITLIST [index] = "Overlordtank"
index = index + 1 ;
--exMessageAppendToMessageArea("indexHEAVYVEH"..index)
step3 = index-1
--index = 151
UNITLIST [index] = "JapanScoutInfantry"
index = index + 1 ;
UNITLIST [index] = "CelestialScoutDrone"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiGroundAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedAC130GunshipAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiStructureBomberAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedBomberAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedGunshipAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedInterceptorAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedNightinaleHelicopter"
index = index + 1 ;
UNITLIST [index] = "AlliedSupportAircraft"
index = index + 1 ;
UNITLIST [index] = "AlliedFighterAircraft"
index = index + 1 ;
-- UNITLIST [index] = "CelestialAdvanceAircraftTech4"
-- index = index + 1 ;
UNITLIST [index] = "CelestialBomberAircraft"
index = index + 1 ;
UNITLIST [index] = "CelestialFighterAircraft"
index = index + 1 ;
UNITLIST [index] = "CelestialAttackerAircraft"
index = index + 1 ;
UNITLIST [index] = "CelestialInterceptorAircraft"
index = index + 1 ;
UNITLIST [index] = "JapanAntiVehicleInfantryTech3"
index = index + 1 ;
UNITLIST [index] = "JapanInterceptorAircraft"
index = index + 1 ;
UNITLIST [index] = "JapanAntiAirShip"
index = index + 1 ;
UNITLIST [index] = "SovietAntiGroundAircraft"
index = index + 1 ;
UNITLIST [index] = "SovietAntiGroundAttacker"
index = index + 1 ;
UNITLIST [index] = "SovietFighterAircraft"
index = index + 1 ;
UNITLIST [index] = "SovietTransportAircraft"
index = index + 1 ;
UNITLIST [index] = "SovietInterceptorAircraft"
index = index + 1 ;
UNITLIST [index] = "CelestialSupportAircraft"
index = index + 1 ;
UNITLIST [index] = "CelestialAdvanceAircraftTech4"
index = index + 1 ;
step35 = index-1
UNITLIST [index] = "JapanAntiStructureShip"
index = index + 1 ;
UNITLIST [index] = "SovietAntiStructureShip"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiStructureShip"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiStructureShip"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiAirShip"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiNavalScout"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiNavyShipTech3"
index = index + 1 ;
UNITLIST [index] = "CelestialAlmightlyShip"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiNavyShipTech1"
index = index + 1 ;
UNITLIST [index] = "CelestialAntiNavyShipTech3"
index = index + 1 ;
UNITLIST [index] = "JapanAntiVehicleShip"
index = index + 1 ;
UNITLIST [index] = "JapanNavyScoutShip"
index = index + 1 ;
UNITLIST [index] = "JapanAntiNavyShipTech3"
index = index + 1 ;
UNITLIST [index] = "SovietAntiNavyShipTech2"
index = index + 1 ;
UNITLIST [index] = "SovietAntiNavyShipTech3"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiNavyShipTech1"
index = index + 1 ;
UNITLIST [index] = "SovietAntiNavyShipTech1"
index = index + 1 ;
--UNITLIST [index] = "JapanFortressShip"
--index = index + 1 ;
--UNITLIST [index] = "JapanGigaFortressShip"
--index = index + 1 ;
--exMessageAppendToMessageArea("indexAIR"..index)
step4 = index-1
UNITLIST [index] = "SovietBomberAircraft"
index = index + 1 ;
step5= index-1
UNITLIST [index] = "SovietAntiAirShip"
index = index + 1 ;
UNITLIST [index] = "AlliedAntiAirVehicleTech1"
index = index + 1 ;
step6= index-1
unitcountmax = index-1
-----------------------------------------
for playindex = 1 , 6 , 1 do
    UNITCOUNT[playindex] = {}
    for unitindex = 1 , unitcountmax , 1 do
        UNITCOUNT[playindex][unitindex] = 0 ;
    end
end
--exMessageAppendToMessageArea("二维数组完毕")
----------------------------------------------
for i = 1 , unitcountmax , 1 do
    FilterLIST[i]=CreateObjectFilter({
        Rule="ANY",
        Relationship="SAME_PLAYER",
        IncludeThing = {
            UNITLIST[i],
        },
    })
end
--exMessageAppendToMessageArea("过滤器完毕")
----------------------------------------------------------------
function unitgetcountanddelet (playindex)
    --exMessageAppendToMessageArea("unitgetcountanddelet")
    for unitindex = 1 , unitcountmax , 1 do
        local TAR, count = ObjectFindObjects(P[playindex], nil, FilterLIST[unitindex])

        if count > 0 then

            --exMessageAppendToMessageArea("count:"..count)

            ANYUNITCOUNT[playindex] = ANYUNITCOUNT[playindex] + count ;
            UNITCOUNT[playindex][unitindex] = UNITCOUNT[playindex][unitindex] + count
            --exMessageAppendToMessageArea("ID:".. UNITLIST[unitindex])
            --exMessageAppendToMessageArea("GET:".. UNITCOUNT[playindex][unitindex])
            for i = 1 , count , 1  do
                ExecuteAction("NAMED_DELETE",TAR[i])
            end
        end
    end
    --exMessageAppendToMessageArea("unitgetcountanddeletdone")
end
--exMessageAppendToMessageArea("定义函数1完毕")
-------------------------------------------------------------------------------
function unitgenerate ()
    ----exMessageAppendToMessageArea("unitgenerate")
    for playindex = 1 , 6 , 1 do
        if  EvaluateCondition("PLAYER_HAS_OBJECT_COMPARISON", "Player_"..playindex, 4 , 0 , "allunit") then
            unitgetcountanddelet (playindex)
            --exMessageAppendToMessageArea("unitgeneratedone")
        end
    end
end
--exMessageAppendToMessageArea("定义函数2完毕")

CAIRTECH4limitc = {}
bigshiplimitc = {}

function bigshiplimit()
    --exMessageAppendToMessageArea("ACT")
    for i = 1 , 6 , 1 do
        bigshiplimitc[i] = UNITCOUNT[i][step35+4] +  UNITCOUNT[i][step35+1] +  UNITCOUNT[i][step35+2] +  UNITCOUNT[i][step35+3]
        CAIRTECH4limitc[i] = UNITCOUNT[i][step35]
        --exMessageAppendToMessageArea(" bigshiplimitc[i]".. bigshiplimitc[i])
        exCounterSetByName("bigshiplimit"..i,  bigshiplimitc[i]);
        exCounterSetByName("CAIRTECH4limit"..i,  CAIRTECH4limitc[i]);
    end
end
