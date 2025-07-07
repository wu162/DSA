
DEFAULTATTCKTEAM = {}
DEFAULTATTCKTEAM[7] = "PlyrCivilian/ATTACK"
DEFAULTATTCKTEAM[8] = "PlyrCreeps/ATTACK"


FilterJapanAntiInfantryVehicle=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "JapanAntiInfantryVehicle","JapanAntiInfantryVehicle_Enhanced"
    }
})

FilterJapanAntiAirVehicleTech1=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "JapanAntiAirVehicleTech1" , "JapanAntiAirVehicleTech1_Enhanced"
    }
})

FilterJapanMissileMechaAdvanced=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "JapanMissileMechaAdvanced","JapanMissileMechaAdvanced_Enhanced"
    }
})

FilterJapanFortressShip=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    Include="SELECTABLE",
    IncludeThing = {
        "JapanFortressShip","JapanigaFortressShip"
    }
})

FilterJapanAntiAirShip=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "JapanAntiAirShip","JapanAntiAirShip_Enhanced"
    }
})

FilterSovietScoutVehicle=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "SovietScoutVehicle"
    }
})


FilterCelestialAntiAirShip=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "CelestialAntiAirShip"
    }
})

FilterCelestialAntiAirShip=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "CelestialAntiAirShip"
    }
})

FilterCelestialAntiVehicleVehicleTech1=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "CelestialAntiVehicleVehicleTech1"
    }
})



Filterbigship=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "AlliedAntiNavyShipTech3","AlliedAntiStructureShip","CelestialAntiNavyShipTech3","CelestialAntiStructureShip","JapanAntiNavyShipTech3","SovietAntiNavyShipTech3","SovietAntiStructureShip","JapanAntiVehicleShip","CelestialAntiNavyShipTech1"
    }
})


FilterAIR=CreateObjectFilter({
    Rule="ANY",
    Relationship="ENEMIES",
    Include="SELECTABLE",
    StatusBitFlags = "AIRBORNE_TARGET",
    ExcludeThing={
        "JapanAntiInfantryVehicle","JapanMissileMechaAdvanced"
    }
})

FilterAIR2=CreateObjectFilter({
    Rule="ANY",
    Relationship="ENEMIES",
    Include="SELECTABLE",
    StatusBitFlags = "AIRBORNE_TARGET"
})

FilterLAND=CreateObjectFilter({
    Rule="ANY",
    Relationship="ENEMIES",
    Include="SELECTABLE",
    StatusBitFlagsExclude = "AIRBORNE_TARGET"
})

FilterCelestialAdvanceAircraftTech4=CreateObjectFilter({
    Rule="ANY",
    Relationship="SAME_PLAYER",
    IncludeThing = {
        "CelestialAdvanceAircraftTech4"
    }
})

FilterALLENEMYUNIT=CreateObjectFilter({
    Rule="ANY",
    Relationship="ENEMIES",
    Include="INFANTRY VEHICLE STRUCTURE AIRCRAFT"
})

----exMessageAppendToMessageArea("定义过滤器")

function JapanAntiInfantryVehicleMICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanAntiInfantryVehicle)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            local x0, y0, z0 = ObjectGetPosition(SELF[i]) ;
            local TAR, TARcount = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=500, DistType="CENTER_2D"
            }, FilterAIR)
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if TARcount > 0 and not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                --  --exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAIV_Transform" )
            elseif  TARcount == 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                -- --exMessageAppendToMessageArea("降落")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAIV_Transform" )
            end
        end
    end
end


function JapanMissileMechaAdvancedMICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanMissileMechaAdvanced)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            local x0, y0, z0 = ObjectGetPosition(SELF[i]) ;
            local TAR, TARcount = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=500, DistType="CENTER_2D"
            }, FilterAIR)
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if TARcount > 0 and not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JapanMissileMechaAdavanced_Transform" )
            elseif  TARcount == 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("降落")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JapanMissileMechaAdavanced_Transform" )
            end
        end
    end
end

function JapanAntiAirVehicleTech1MICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanAntiAirVehicleTech1)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            local x0, y0, z0 = ObjectGetPosition(SELF[i]) ;
            local TAR, TARcount = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=500, DistType="CENTER_2D"
            }, FilterAIR2)
            local TARLAND, TARcountLAND = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=400, DistType="CENTER_2D"
            }, FilterLAND)
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if  TARcountLAND > 0 and TARcount == 0 and not  EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAAVT1_Transform" )
            elseif  TARcount > 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("降落")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAAVT1_Transform" )
            end
        end
    end
end

--TARcountLAND > 0 and not  EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET")


function JapanFortressShipMICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanFortressShip)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if  not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") and EvaluateCondition("UNIT_TEST_OBJECT_PANEL_FLAGS", SELF[i] , "Selectable") then
                ----exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_ToggleJapanFortressShipTransformMode" )
            end
        end
    end
end

function JapanAntiAirShipMICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanAntiAirShip)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if  not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET")  then
                ----exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAAS_Transform" )
            end
        end
    end
end


function SovietScoutVehicleMICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterSovietScoutVehicle)
        ----exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if  not EvaluateCondition("UNIT_HAS_MODELCONDITION", SELF[i] , "USER_4")  then
                ----exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_ToggleBinaryWeapon" )
            end
        end
    end
end

function CelestialAntiAirShipMICROCONTROL ()
    --exMessageAppendToMessageArea("执行")
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterCelestialAntiAirShip)
        --exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            local x0, y0, z0 = ObjectGetPosition(SELF[i]) ;
            local TAR, TARcount = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=500, DistType="CENTER_2D"
            }, FilterAIR)
            --exMessageAppendToMessageArea("TARcount"..TARcount)
            if TARcount > 0 and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE") then
                --  --exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "CommandCelestialAntiAirVehicleTransform" )
            elseif  TARcount == 0  and not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE") then
                -- --exMessageAppendToMessageArea("降落")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "CommandCelestialAntiAirVehicleTransform" )
            end
        end
    end
end

function CelestialAntiVehicleVehicleTech1MICROCONTROL ()
    --exMessageAppendToMessageArea("执行")
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterCelestialAntiVehicleVehicleTech1)
        -- exMessageAppendToMessageArea("count"..count)
        for i = 1 , count , 1 do
            if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE") then
                --  --exMessageAppendToMessageArea("起飞")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_ToggleRangeUpdateCelestial" )
            end
        end
    end
end


function CelestialAdvanceAircraftTech4MICROCONTROL ()
    for playindex = 7 , 8 , 1 do
        local SELF, count = ObjectFindObjects(P[playindex], nil, FilterCelestialAdvanceAircraftTech4)
        ----exMessageAppendToMessageArea("count"..count)
        local targetindex = 1
        for i = 1 , count , 1 do
            local x0, y0, z0 = ObjectGetPosition(SELF[i]) ;
            local TAR, TARcount = ObjectFindObjects(P[playindex], {
                X=x0, Y=y0, Z=z0, Radius=700, DistType="CENTER_2D"
            }, FilterALLENEMYUNIT)
            -- --exMessageAppendToMessageArea("TARcount"..TARcount)
            if TARcount > 0  then
                ExecuteAction("NAMED_ATTACK_NAMED", SELF[i] , TAR[targetindex])
                targetindex= targetindex + 1 ;
                if not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE")  then
                    ----exMessageAppendToMessageArea("起飞")
                    ExecuteAction("UNIT_SET_TEAM", SELF[i] , DEFAULTATTCKTEAM[playindex])
                    ObjectLoadAttributeModifier(SELF[i], "AttributeModifier_CelestialZhuRongRapidFire",9999)
                    ObjectLoadAttributeModifier(SELF[i], "AttributeModifier_CelestialInterceptorRapidFire",9999)
                    ObjectSetWeaponSetUpdateWeaponCurrentAmmoCount(SELF[i], 1, 1, 10, 10)
                    ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_CAAT4_Transform" )
                end
            elseif  TARcount == 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE") then
                ----exMessageAppendToMessageArea("降落")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_CAAT4_Transform" )
            end
        end
    end
end
--exMessageAppendToMessageArea("定义")