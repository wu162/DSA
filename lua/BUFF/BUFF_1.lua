
--- ÀËÈË¹íÍõHP*1.5£¬ÀËÈËÈ¥³ýÎÞÏÞµ¯Ï»
--- ÈÌÕßá°Ó°´Ì¹íÍõX¹¥ËÙÉä³ÌÔö¼Ó
---ÑÅµäÄÈ¹¥ËÙ*1.8
---²¨ÄÜÖØ´¸Éä³Ì½µµÍ
---Ìêµ¶Ì«µ¶¹¥»÷*1.2




FilterJapanSentinelVehicle=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanSentinelVehicle","JapanAntiVehicleVehicleTech3","JapanMechaX","JapanMissileMechaAdvanced","CelestialAntiVehicleVehicleTech4","AlliedAntiVehicleVehicleTech1","CelestialAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech1","SovietHeavyAntiVehicleVehicleTech2"
    }
})


function JapanSentinelVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterJapanSentinelVehicle)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GunshipBOSSAIUnitCheat",9999)
    end
end

FilterLONGRANGEANTIINFANT=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanInfiltrationInfantry",
    }
})

--Ñþ¹â
function LONGRANGEANTIINFANTBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterLONGRANGEANTIINFANT)
    for i = 0 , COUNTX ,1 do
        ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(TAR[i], 10, 10, 10, 10)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_CelestialZhuRongRapidFire",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_CelestialInterceptorRapidFire",9999)
    end
end

FilterAlliedAntiStructureVehicle=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "AlliedAntiStructureVehicle",
    }
})


function AlliedAntiStructureVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterAlliedAntiStructureVehicle)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_CelestialZhuRongRapidFire",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifer_JapanEmperorsResolve_L1",9999)
    end
end

FilterJapanAntiStructureVehicle=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanAntiStructureVehicle","SovietSledgehammerSPG","CelestialAlmightlyShip"
    }
})
--ÖØ´¸,¼¤ÃÈ,¹¬Å®DEBUFF

function JapanAntiStructureVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterJapanAntiStructureVehicle)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxDamageMultDown",9999)
        -- ObjectLoadAttributeModifier(TAR[i], "HardAISinglePlayer_Bonus",9999)
    end
end

FilterJapanShip=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanAntiNavyShipTech3","JapanAntiVehicleShip"
    }
})



function JapanShipBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterJapanShip)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_CenturionUpgradeLv1",9999)
    end
end


FilterCelestialLongRangeMissileVehicle=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "CelestialLongRangeMissileVehicle"
    }
})



function CelestialLongRangeMissileVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterCelestialLongRangeMissileVehicle)
    for i = 0 , COUNTX ,1 do
        --ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedPrismAttackBoost",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
    end
end



FilterMIDDLEENHANCE=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanMechaX","CelestialAntiVehicleInfantry","JapanAntiAirVehicleTech1"
    }
})

--¹íÍõX



function MIDDLEENHANCEBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterMIDDLEENHANCE)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedPrismAttackBoost",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
    end
end



FilterANTIGROUNDAIRCRAFT=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "CelestialAttackerAircraft","AlliedSupportAircraft","SovietAntiGroundAircraft","SovietAntiGroundAttacker",
        "CelestialSupportAircraft"
    }
})

--±ùÈË

function ANTIGROUNDAIRCRAFTBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterANTIGROUNDAIRCRAFT)
    --exMessageAppendToMessageArea("COUNTX:"..COUNTX)
    for i = 0 , COUNTX ,1 do
        --ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GunshipBOSSAIUnitCheat",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedPrismAttackBoost",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
    end
end

FilterCelestialAntiInfantryInfantryAdvanced=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "SovietHeavyAntiVehicleInfantry"
    }
})

function CelestialAntiInfantryInfantryAdvancedBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterCelestialAntiInfantryInfantryAdvanced)
    --exMessageAppendToMessageArea("COUNTX:"..COUNTX)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GenericBOSSAIUnitCheat",9999)
    end
end

FilterCelestialAntiInfantryInfantryAdvancedSINGLE=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "CelestialAntiInfantryInfantry"
    }
})

function CelestialAntiInfantryInfantryAdvancedSINGLEBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterCelestialAntiInfantryInfantryAdvancedSINGLE)
    --exMessageAppendToMessageArea("COUNTX:"..COUNTX)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedPrismAttackBoost",9999)
    end
end


FilterLARGEENHANCE=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "AlliedCryoLegionnaire","CelestialBomberAircraft","SovietHeavyAntiVehicleInfantry",
        "AlliedGunshipAircraft","SovietInterceptorAircraft","CelestialAntiVehicleVehicleTech4"
    }
})


function LARGEENHANCEBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterLARGEENHANCE)
    --exMessageAppendToMessageArea("COUNTX:"..COUNTX)
    for i = 0 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GunshipBOSSAIUnitCheat",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedTeslaBoost",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
    end
end
