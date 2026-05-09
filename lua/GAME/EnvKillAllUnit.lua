unitallEnv = CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing={'AlliedAC130GunshipAircraft',"AlliedAntiAirShip","AlliedAntiAirVehicleTech1","AlliedAntiGroundAircraft","AlliedAntiInfantryInfantry","AlliedAntiInfantryVehicle","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiNavyShipTech3","AlliedAntiStructureBomberAircraft","AlliedAntiStructureShip","AlliedAntiStructureVehicle","AlliedAntiVehicleInfantry","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedBomberAircraft","AlliedAntiInfantryVehicle_Ground","AlliedCommandoTech1","AlliedCryoLegionnaire","AlliedEngineer","AlliedFighterAircraft","AlliedFutureTank","AlliedGunshipAircraft","AlliedInfiltrationInfantry","AlliedInterceptorAircraft","AlliedMiner","PrismTank","AlliedScoutInfantry","AlliedSupportAircraft","AlliedPrismTank_Enhanced",
                  "CelestialAdvanceAircraftTech4","celestiallongrangemissilevehicle_b","CelestialConstructionYard","CelestialAlmightlyShip","CelestialAlmightlyShip_AA","CelestialAntiAirShip","CelestialFighterAircraft","CelestialSupportAircraft","CelestialAttackerAircraft","CelestialAntiAirShip_Enhanced_Water","CelestialAntiInfantryInfantry","CelestialAntiInfantryInfantryAdvanced","CelestialAntiInfantryVehicle","CelestialAntiInfantryVehicle_B","CelestialAntiInfantryVehicle_Dropped","CelestialAntiInfantryVehicle_Water","CelestialAirDrop_Land","CelestialAntiNavyShipTech1","CelestialAntiNavyShipTech3","CelestialAntiStructureShip","CelestialAntiStructureVehicle","CelestialAntiVehicleInfantry","CelestialAntiVehicleVehicleTech1","CelestialAntiVehicleVehicleTech3","CelestialAntiVehicleVehicleTech4","CelestialBomberAircraft","CelestialDF41","CelestialEngineer","CelestialHeavyAntiAirVehicleTech3","CelestialHJ-10","CelestialInfiltrationInfantry","CelestialInterceptorAircraft","CelestialMCV","CelestialScoutDrone",
                  "JapanAntiAirShip","JapanAntiAirVehicleTech1","JapanAntiInfantryInfantry","JapanAntiInfantryVehicle","JapanAntiStructureShip","JapanAntiStructureVehicle","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","japanantinavyshiptech3","JapanAntiVehicleShip","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanArcherInfantry","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanInterceptorAircraft","JapanInterceptorAircraft_Ground","JapanKamikazeInfantry","JapanMechaX","JapanMissileMechaAdvanced","JapanMiner","JapanNavyScoutShip","JapanScoutInfantry","JapanSentinelVehicle","SovietMortarCycle",
                  "SovietAntiAirShip","SovietAntiAirShip_Ground","SovietAntiGroundAircraft","SovietAntiGroundAttacker","SovietAntiInfantryInfantry","SovietAntiInfantryVehicle","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiNavyShipTech3","SovietAntiStructureShip","SovietAntiStructureVehicle","SovietAntiVehicleInfantry","SovietAntiVehicleVehicleTech2","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietAntiVehicleVehicleTech4","SovietBomberAircraft","SovietCommandoTech1","SovietEngineer","SovietFighterAircraft","SovietHeavyAntiVehicleInfantry","SovietHeavyAntiVehicleVehicleTech2","SovietInterceptorAircraft","SovietMiner","SovietScoutInfantry","SovietScoutVehicle","SovietSledgehammerSPG","SovietSPG","SovietSurveyor","SovietTeslaAirAssault","SovietTransportAircraft",
                  "AlliedBattleFortress", "SovietHeavyMortarVehicle",
                  "AlliedAirForceDispatchVehicle", "CelestialAntiAirVehicleTech3", "JapanAntiAirVehicleTech3", "SovietElectronicRadarTruck",
    },--某一类型
})

RoundLuaManager.CallOnEveryRoundBegin(function(list)
    local level = exCounterGetByName("lvc")
    if level ~= nil and g_GameMode == 1 then
        if level == 8 then
            exAddTextToPublicBoard(Localization.get("env_kill_all_unit.warning_next_round"), 15)
        end
        if level == 9 then
            exAddTextToPublicBoard(Localization.get("env_kill_all_unit.execute"), 10)
            local units, count = ObjectFindObjects(T74, nil,unitallEnv);
            for i = 1 , count , 1 do
                ExecuteAction("NAMED_DELETE", units[i]);
            end

            local units2, count2 = ObjectFindObjects(T84, nil,unitallEnv);
            for i = 1 , count2 , 1 do
                ExecuteAction("NAMED_DELETE", units2[i]);
            end
        end

    end
end, {  })