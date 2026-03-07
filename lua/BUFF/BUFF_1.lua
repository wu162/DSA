
--- 浪人鬼王HP*1.5，浪人去除无限弹匣
--- 忍者岚影刺鬼王X攻速射程增加
---雅典娜攻速*1.4
---重锤计蒙伤害75%
---剃刀太刀攻击*1.2




FilterJapanSentinelVehicle=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanSentinelVehicle","JapanAntiVehicleVehicleTech3","JapanMechaX","JapanMissileMechaAdvanced","CelestialAntiVehicleVehicleTech4","AlliedAntiVehicleVehicleTech1","CelestialAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech1","SovietHeavyAntiVehicleVehicleTech2"
    }
})


function JapanSentinelVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterJapanSentinelVehicle)
    for i = 1 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GunshipBOSSAIUnitCheat",9999)
    end
end

FilterLONGRANGEANTIINFANT=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "JapanInfiltrationInfantry",
    }
})

--瑶光
function LONGRANGEANTIINFANTBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterLONGRANGEANTIINFANT)
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
        local instanceId = exObjectGetInstanceId(ObjectGetId(TAR[i]))
        -- exMessageAppendToMessageArea("AlliedAntiStructureVehicleBUFF instance id:"..instanceId)
        if instanceId ~= -234022367 then
            -- exMessageAppendToMessageArea("AlliedAntiStructureVehicleBUFF zhurong buff")
            ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_CelestialZhuRongRapidFire",9999)
        else
            -- exMessageAppendToMessageArea("AlliedAntiStructureVehicleBUFF normal buff")
            ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_MAP_RATE_OF_FIRE_Up",9999)
            ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_MAP_RATE_OF_FIRE_Up",9999)
        end
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifer_JapanEmperorsResolve_L1",9999)
        -- local rateOfFire = ObjectGetAttributeModifier(TAR[i], "RATE_OF_FIRE")
        -- exMessageAppendToMessageArea("AlliedAntiStructureVehicleBUFF rate of fire:"..rateOfFire)
    end
end

FilterDamange75Percent=CreateObjectFilter({
    Rule="ANY",

    IncludeThing = {
        "SovietSledgehammerSPG","CelestialAlmightlyShip"
    }
})
--重锤,激萌,宫女DEBUFF

function JapanAntiStructureVehicleBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterDamange75Percent)
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
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

--鬼王X



function MIDDLEENHANCEBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterMIDDLEENHANCE)
    for i = 1 , COUNTX ,1 do
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

--冰人

function ANTIGROUNDAIRCRAFTBUFF ()
    local TAR , COUNTX = ObjectFindObjects(nil, nil, FilterANTIGROUNDAIRCRAFT)
    --exMessageAppendToMessageArea("COUNTX:"..COUNTX)
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
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
    for i = 1 , COUNTX ,1 do
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_GunshipBOSSAIUnitCheat",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeMod_AlliedTeslaBoost",9999)
        ObjectLoadAttributeModifier(TAR[i], "AttributeModifier_BoxRangeUp",9999)
    end
end
