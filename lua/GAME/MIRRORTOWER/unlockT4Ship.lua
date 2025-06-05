
local enableT4Ship = {
    [1] = 'AlliedAntiStructureShip',
    [2] = 'AlliedAntiStructureShip_Enhanced',
    [3] = 'CelestialAntiStructureShip',
    [4] = 'CelestialAntiStructureShip_Enhanced',
    [5] = 'SovietAntiStructureShip',
    [6] = 'SovietAntiStructureShip_Enhanced',
    [7] = 'JapanAntiStructureShip',
    [8] = 'JapanAntiStructureShip_Enhanced',
    [9] = 'JapanGigaFortressShipEgg',
}

for i = 1 , 3 , 1 do
    for j = 1, 9, 1 do
        ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING","Player_"..i , enableT4Ship[j], 1)
    end
end