unitAIRcountmin = 150
unitAIRcountmax = 200
AIRSP = {}
AIRSPCH = {}
AIRSP[7] = {}
AIRSP[8] = {}
AIRSPCH[7] = {}
AIRSPCH[8] = {}
for i = 1 , 6 , 1 do
    AIRSP[7][i] = GetObjectByScriptName("AIR1"..i) ;
    ExecuteAction("SET_UNIT_REFERENCE","AIRSP7"..i , AIRSP[7][i])
    AIRSPCH[7][i] = "AIRSP7"..i
    AIRSP[8][i] = GetObjectByScriptName("AIR2"..i) ;
    ExecuteAction("SET_UNIT_REFERENCE","AIRSP8"..i , AIRSP[8][i])
    AIRSPCH[8][i] = "AIRSP8"..i
end
--exMessageAppendToMessageArea("物体定义")
AIRTEAM = {}
AIRTEAM[7] = {}
AIRTEAM[8] = {}
AIRATTACK = {}
AIRATTACK[7] = {}
AIRATTACK[8] = {}
for i = 1 , 6 , 1 do
    AIRTEAM[7][i] ="PlyrCivilian/AIR"..i ;
    AIRATTACK[7][i] = "PlyrCivilian/AIRATTACK"..i
    AIRTEAM[8][i] ="PlyrCreeps/AIR"..i ;
    AIRATTACK[8][i] = "PlyrCreeps/AIRATTACK"..i
end
--exMessageAppendToMessageArea("中占坦克")
