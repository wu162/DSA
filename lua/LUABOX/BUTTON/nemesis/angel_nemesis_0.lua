local units, count = ObjectFindObjects(T74, nil,unitall)
local object=ceil(1+GetRandomNumber()*count)
local object1=ceil(1+GetRandomNumber()*count)
local object2=ceil(1+GetRandomNumber()*count)
local wuti = ObjectGetId(units[object])
local wuti1 = ObjectGetId(units[object1])
local wuti2 = ObjectGetId(units[object2])
local x,y,z= ObjectGetPosition(wuti)
local x1,y1,z1= ObjectGetPosition(wuti1)
local x2,y2,z2= ObjectGetPosition(wuti2)
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCreeps/teamPlyrCreeps",{X=x,Y=y,Z=z},'0')
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCreeps/teamPlyrCreeps",{X=x1,Y=y1,Z=z1},'0')
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCreeps/teamPlyrCreeps",{X=x2,Y=y2,Z=z2},'0')