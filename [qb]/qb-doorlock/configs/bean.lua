

-- b1 created by isakh
Config.DoorList['bean-b1'] = {
    objYaw = 340.00003051758,
    objCoords = vec3(128.213394, -1029.455322, 29.261801),
    locked = false,
    objName = 494354570,
    distance = 2,
    fixText = false,
    doorType = 'door',
    doorRate = 1.0,
    doorLabel = 'b1',
    authorizedJobs = { ['beanmachine'] = 0 },
}

-- b2 created by isakh
Config.DoorList['bean-b2'] = {
    authorizedJobs = { ['beanmachine'] = 0 },
    distance = 2,
    locked = true,
    doors = {
        {objName = -747011272, objYaw = 69.999992370605, objCoords = vec3(115.375694, -1037.655029, 29.348320)},
        {objName = -1182160879, objYaw = 250.00004577637, objCoords = vec3(114.562912, -1039.888184, 29.348320)}
    },
    doorRate = 1.0,
    doorLabel = 'b2',
    doorType = 'double',
}