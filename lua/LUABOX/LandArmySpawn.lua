function LandArmySpawn()
    UNITSPST (1,step1,INFANTSP,INFANTTEAM,INFANTATTACK,INFANTSPCH)
    UNITSPST (step1+1,step2,LIGHTVEHSP,LIGHTVEHTEAM,LIGHTVEHATTACK,LIGHTVEHSPCH)
    UNITSPST (step2+1,step3,HEAVYVEHSP,HEAVYVEHTEAM,HEAVYVEHATTACK,HEAVYVEHSPCH)

    SpawnLandUnit()

    if g_DisableSeaArmy == 0 then
        UNITSPSHIP (step35+1,step4,AIRSP,SHIPTEAM,SHIPTEAMATTACK,AIRSPCH)
        SpawnSeaUnit()
    end

    UNITSPAIRST (step4+1,step5,INFANTSP,AIRTEAM,AIRATTACK,INFANTSPCH)

    SpawnGigaFortressAir()

    exEnableWBScript('SHIPNOCOACT')
    exEnableWBScript('PlyrCivilian/attackHEAVYVEHVEH__7')
    exEnableWBScript('PlyrCivilian/attackINFANT__7')
    exEnableWBScript('PlyrCivilian/attackLIGHTVEH__7')
    exEnableWBScript('PlyrCivilian/ATTACKSHIP__7')
    exEnableWBScript('PlyrCreeps/attackHEAVYVEHVEH__8')
    exEnableWBScript('PlyrCreeps/attackINFANT__8')
    exEnableWBScript('PlyrCreeps/attackLIGHTVEH__8')
    exEnableWBScript('PlyrCreeps/ATTACKSHIP__8')
    exEnableWBScript('BUFFACTONCE')
    exEnableWBScript('ShrinkMode_Trigger')
end