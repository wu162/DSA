
g_UnitCreateEventFunc = {}

function limitCelestialBattery(createdObjId, createdObjInstanceId, ownerPlayerName)
    SchedulerModule.delay_call(function(id)
        ExecuteAction("NAMED_DELETE", GetObjectById(id));
    end, 15, {createdObjId})
end

g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForCelestialPower")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForAlliedTurbine")] = limitCelestialBattery
g_UnitCreateEventFunc[FastHash("CelestialAlliesElectricitySale_ForSovietAdvancedPower")] = limitCelestialBattery

exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialPower")
exObjectRegisterCreateEvent("CelestialElectricitySale_ForCelestialAdvancedPower")
exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialAdvancedPower")
exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForCelestialPower")
exObjectRegisterCreateEvent("CelestialElectricitySale_ForAlliedTurbine")
exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForAlliedTurbine")
exObjectRegisterCreateEvent("CelestialAlliesElectricitySale_ForSovietAdvancedPower")

function whenPlayerBuildUnit(createdObjId, createdObjInstanceId, ownerPlayerName)

end

g_UnitCreateEventFunc[FastHash("JapanNavyScoutShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanAntiVehicleVehicleTech1_Naval")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanAntiAirShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanAntiVehicleShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanInterceptorAircraft")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanAntiNavyShipTech3")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("JapanAntiStructureShip")] = whenPlayerBuildUnit

g_UnitCreateEventFunc[FastHash("AlliedAntiNavalScout")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("AlliedAntiInfantryVehicle")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("AlliedAntiAirShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("AlliedAntiNavyShipTech1")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("AlliedAntiStructureShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("AlliedAntiNavyShipTech3")] = whenPlayerBuildUnit

g_UnitCreateEventFunc[FastHash("SovietAntiNavyShipTech1")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("SovietAntiStructureShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("SovietAntiAirShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("SovietAntiNavyShipTech2")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("SovietAntiNavyShipTech3")] = whenPlayerBuildUnit

g_UnitCreateEventFunc[FastHash("CelestialAntiNavyShipTech1")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("CelestialAntiAirShip_Water")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("CelestialAlmightlyShip")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("CelestialAntiNavyShipTech3")] = whenPlayerBuildUnit
g_UnitCreateEventFunc[FastHash("CelestialAntiStructureShip")] = whenPlayerBuildUnit


function onUnitCreateEvent(createdObjId, createdObjInstanceId, ownerPlayerName)
    g_UnitCreateEventFunc[createdObjInstanceId](createdObjId, createdObjInstanceId, ownerPlayerName)
end