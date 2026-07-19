local units, count = ObjectFindObjects(T84, nil, unitall)
local aliveUnits = {}
for i = 1, count, 1 do
    if ObjectIsAlive(units[i]) then
        tinsert(aliveUnits, units[i])
    end
end
local getRandomUnit = function(unitList)
    local index = ceil(GetRandomNumber() * getn(unitList))
    if index < 1 then
        index = 1
    end
    if index > getn(unitList) then
        index = getn(unitList)
    end
    return unitList[index]
end

local object = getRandomUnit(aliveUnits)
local object1 = getRandomUnit(aliveUnits)
local object2 = getRandomUnit(aliveUnits)
local wuti = ObjectGetId(object)
local wuti1 = ObjectGetId(object1)
local wuti2 = ObjectGetId(object2)
local x,y,z = ObjectGetPosition(wuti)
local x1,y1,z1 = ObjectGetPosition(wuti1)
local x2,y2,z2 = ObjectGetPosition(wuti2)
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCivilian/teamPlyrCivilian",{X=x,Y=y,Z=z},'0')
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCivilian/teamPlyrCivilian",{X=x1,Y=y1,Z=z1},'0')
ExecuteAction("CREATE_OBJECT","CelestialOrbitalStrikeTarget","PlyrCivilian/teamPlyrCivilian",{X=x2,Y=y2,Z=z2},'0')