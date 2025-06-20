
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

  ----exMessageAppendToMessageArea("瀹氫箟杩囨护鍣?)

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
            --  --exMessageAppendToMessageArea("璧烽")
              ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAIV_Transform" )
              elseif  TARcount == 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
             -- --exMessageAppendToMessageArea("闄嶈惤")
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
                ----exMessageAppendToMessageArea("璧烽")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JapanMissileMechaAdavanced_Transform" )
                elseif  TARcount == 0  and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("闄嶈惤")
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
                if  TARcountLAND > 0 and not  EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("璧烽")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAAVT1_Transform" )
                elseif  TARcount > 0  and TARcountLAND == 0 and EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") then
                ----exMessageAppendToMessageArea("闄嶈惤")
                ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_JAAVT1_Transform" )
                end
          end
      end
      end




      function JapanFortressShipMICROCONTROL ()
        for playindex = 7 , 8 , 1 do
          local SELF, count = ObjectFindObjects(P[playindex], nil, FilterJapanFortressShip)
          ----exMessageAppendToMessageArea("count"..count)
          for i = 1 , count , 1 do
             -- --exMessageAppendToMessageArea("TARcount"..TARcount)
                if  not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "AIRBORNE_TARGET") and EvaluateCondition("UNIT_TEST_OBJECT_PANEL_FLAGS", SELF[i] , "Selectable") then
                ----exMessageAppendToMessageArea("璧烽")
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
                ----exMessageAppendToMessageArea("璧烽")
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
                ----exMessageAppendToMessageArea("璧烽")
                  ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "Command_ToggleBinaryWeapon" )
                end
          end
      end
      end

  function CelestialAntiAirShipMICROCONTROL ()
    --exMessageAppendToMessageArea("鎵ц")
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
            --  --exMessageAppendToMessageArea("璧烽")
              ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "CommandCelestialAntiAirVehicleTransform" )
              elseif  TARcount == 0  and not EvaluateCondition("UNIT_HAS_OBJECT_STATUS", SELF[i] , "TRANSFORMATION_TOGGLE_STATE") then
             -- --exMessageAppendToMessageArea("闄嶈惤")
              ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY", SELF[i] , "CommandCelestialAntiAirVehicleTransform" )
              end
        end
    end
    end


    --exMessageAppendToMessageArea("瀹氫箟")
