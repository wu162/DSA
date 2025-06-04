unitHEAVYVEHcountmin = 100
unitHEAVYVEHcountmax = 150 
HEAVYVEHSP = {}
HEAVYVEHSPCH = {}
HEAVYVEHSP[7] = {}
HEAVYVEHSP[8] = {}
HEAVYVEHSPCH[7] = {}
HEAVYVEHSPCH[8] = {}
for i = 1 , 6 , 1 do 
    HEAVYVEHSP[7][i] = GetObjectByScriptName("HEAVYVEH1"..i) ;
    ExecuteAction("SET_UNIT_REFERENCE","HEAVYVEHSP7"..i , HEAVYVEHSP[7][i])
    HEAVYVEHSPCH[7][i] = "HEAVYVEHSP7"..i
    HEAVYVEHSP[8][i] = GetObjectByScriptName("HEAVYVEH2"..i) ;
    ExecuteAction("SET_UNIT_REFERENCE","HEAVYVEHSP8"..i , HEAVYVEHSP[8][i])
    HEAVYVEHSPCH[8][i] = "HEAVYVEHSP8"..i
end
--exMessageAppendToMessageArea("鐗╀綋瀹氫箟")
HEAVYVEHTEAM = {}
HEAVYVEHTEAM[7] = {}
HEAVYVEHTEAM[8] = {}
HEAVYVEHATTACK = {}
HEAVYVEHATTACK[7] = {}
HEAVYVEHATTACK[8] = {}
for i = 1 , 6 , 1 do 
    HEAVYVEHTEAM[7][i] ="PlyrCivilian/HEAVYVEH"..i ;
    HEAVYVEHATTACK[7][i] = "PlyrCivilian/HEAVYVEHATTACK"..i
    HEAVYVEHTEAM[8][i] ="PlyrCreeps/HEAVYVEH"..i ;
    HEAVYVEHATTACK[8][i] = "PlyrCreeps/HEAVYVEHATTACK"..i
end
--exMessageAppendToMessageArea("涓崰鍧﹀厠")