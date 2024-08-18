

-- front office created by Pug
Config.DoorList['prison-frontoffice'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorRate = 1.0,
    doorType = 'door',
    locked = true,
    objYaw = 0.0,
    objName = -684929024,
    distance = 1,
    fixText = false,
    objCoords = vec3(1837.741943, 2592.161865, 46.039574),
}

-- front office 2 created by Pug
Config.DoorList['prison-frontoffice2'] = {
    doorType = 'door',
    objYaw = 89.999961853027,
    fixText = false,
    locked = true,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    distance = 1,
    objCoords = vec3(1831.339966, 2594.992188, 46.037910),
    objName = -684929024,
}

-- sidegate 1 created by Pug
Config.DoorList['prison-sidegate1'] = {
    locked = true,
    objName = -1156020871,
    doorType = 'door',
    objYaw = 179.99987792969,
    fixText = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objCoords = vec3(1797.760864, 2596.564941, 46.387306),
    distance = 1,
    doorRate = 1.0,
}

-- infirmaryoffice created by THX1139
Config.DoorList['prison-infirmaryoffice'] = {
    distance = 1,
    objYaw = 4.8494574002689e-05,
    doorType = 'door',
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorLabel = 'infirmary1',
    fixText = false,
    locked = true,
    doorRate = 1.0,
    objName = 2074175368,
    objCoords = vec3(1772.813354, 2570.296387, 45.744675),
}


-- infirmarysurgery created by THX1139
Config.DoorList['prison-infirmarysurgery'] = {
    distance = 1,
    doors = {
        {objName = -1624297821, objYaw = 270.0, objCoords = vec3(1767.320801, 2582.307861, 45.753448)},
        {objName = -1624297821, objYaw = 90.000007629395, objCoords = vec3(1767.320801, 2584.607178, 45.753448)}
    },
    doorType = 'double',
    locked = true,
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorLabel = 'infirmary3',
}

-- innergate created by THX1139
Config.DoorList['prison-innergate'] = {
    distance = 6,
    objYaw = 179.99998474121,
    doorType = 'sliding',
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorLabel = 'gate1',
    fixText = true,
    locked = true,
    doorRate = 1.0,
    objName = 741314661,
    objCoords = vec3(1799.608398, 2616.975342, 44.603249),
}

-- innergate2 created by THX1139
Config.DoorList['prison-innergate2'] = {
    distance = 6,
    objYaw = 90.0,
    doorType = 'sliding',
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorLabel = 'gate2',
    fixText = true,
    locked = true,
    doorRate = 1.0,
    objName = 741314661,
    objCoords = vec3(1818.542847, 2604.812500, 44.611004),
}

-- outergate created by THX1139
Config.DoorList['prison-outergate'] = {
    distance = 6,
    objYaw = 90.0,
    doorType = 'sliding',
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorLabel = 'gate3',
    fixText = true,
    locked = true,
    doorRate = 1.0,
    objName = 741314661,
    objCoords = vec3(1844.998413, 2604.812500, 44.639778),
}

-- guardtower1 created by THX1139
Config.DoorList['prison-guardtower1'] = {
    authorizedJobs = { ['police'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1821.170288, 2476.264648, 45.689148),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower1',
    doorRate = 1.0,
    objYaw = 65.000068664551,
    doorType = 'door',
}

-- guardtower2 created by THX1139
Config.DoorList['prison-guardtower2'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1759.620239, 2412.837158, 45.711662),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower2',
    doorRate = 1.0,
    objYaw = 25.000093460083,
    doorType = 'door',
}

-- guardtower3 created by THX1139
Config.DoorList['prison-guardtower3'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1658.584473, 2397.721924, 45.715256),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower3',
    doorRate = 1.0,
    objYaw = 355.00003051758,
    doorType = 'door',
}

-- guardtower4 created by THX1139
Config.DoorList['prison-guardtower4'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1543.240723, 2471.294189, 45.712013),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower4',
    doorRate = 1.0,
    objYaw = 289.99996948242,
    doorType = 'door',
}

-- -- guardtower5 created by THX1139 
-- Config.DoorList['prison-guardtower5'] = {
--     authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
--     objName = -1033001619,
--     objCoords = vec3(1537.810913, 2585.995117, 45.689148),
--     distance = 2,
--     fixText = false,
--     locked = true,
--     doorLabel = 'tower5',
--     doorRate = 1.0,
--     items = { ['tower-keys'] = 1 },
--     objYaw = 270.0,
--     doorType = 'door',

-- }

-- guardtower6 created by THX1139
Config.DoorList['prison-guardtower6'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1572.661743, 2679.191406, 45.729759),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower6',
    doorRate = 1.0,
    objYaw = 234.99996948242,
    doorType = 'door',
}

-- guardtower7 created by THX1139
Config.DoorList['prison-guardtower7'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1651.160645, 2755.436035, 45.878685),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower7',
    doorRate = 1.0,
    objYaw = 200.14155578613,
    doorType = 'door',
}

-- guardtower8 created by THX1139
Config.DoorList['prison-guardtower8'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1773.108032, 2759.699951, 45.886734),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower8',
    doorRate = 1.0,
    objYaw = 165.00006103516,
    doorType = 'door',
}

-- guardtower9 created by THX1139
Config.DoorList['prison-guardtower9'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1845.789917, 2698.620605, 45.955307),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'tower9',
    doorRate = 1.0,
    objYaw = 95.000061035156,
    doorType = 'door',
}

-- guardtowera created by THX1139
Config.DoorList['prison-guardtowera'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1033001619,
    objCoords = vec3(1820.769897, 2620.770020, 45.951263),
    distance = 2,
    fixText = false,
    locked = true,
    doorLabel = 'towera',
    doorRate = 1.0,
    objYaw = 85.000030517578,
    doorType = 'door',
}

-- stairs1 created by THX1139
Config.DoorList['prison-stairs1'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1761.397705, 2529.338135, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate1',
    doorRate = 1.0,
    objYaw = 344.50881958008,
    doorType = 'door',
}

-- stairs2 created by THX1139
Config.DoorList['prison-stairs2'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1727.015625, 2509.423584, 46.062405),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate2',
    doorRate = 1.0,
    objYaw = 255.21278381348,
    doorType = 'door',
}

-- stairs3 created by THX1139
Config.DoorList['prison-stairs3'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1712.759888, 2489.613037, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate3',
    doorRate = 1.0,
    objYaw = 313.96069335938,
    doorType = 'door',
}

-- stairs4 created by THX1139
Config.DoorList['prison-stairs4'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1673.032715, 2489.581299, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate4',
    doorRate = 1.0,
    objYaw = 224.84396362305,
    doorType = 'door',
}

-- stairs5 created by THX1139
Config.DoorList['prison-stairs5'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1653.763306, 2493.576660, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate5',
    doorRate = 1.0,
    objYaw = 275.06982421875,
    doorType = 'door',

}

-- stairs6 created by THX1139
Config.DoorList['prison-stairs6'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1623.320313, 2519.109375, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate6',
    doorRate = 1.0,
    objYaw = 185.64677429199,
    doorType = 'door',
}

-- stairs7 created by THX1139
Config.DoorList['prison-stairs7'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1618.307129, 2533.870361, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate7',
    doorRate = 1.0,
    objYaw = 225.06986999512,
    doorType = 'door',
}

-- stairs8 created by THX1139
Config.DoorList['prison-stairs8'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1618.330444, 2573.611084, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate8',
    doorRate = 1.0,
    objYaw = 134.28955078125,
    doorType = 'door',
}

-- stairs9 created by THX1139
Config.DoorList['prison-stairs9'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1668.924072, 2622.786865, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate9',
    doorRate = 1.0,
    objYaw = 89.839065551758,
    doorType = 'door',
}

-- stairs10 created by THX1139
Config.DoorList['prison-stairs10'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1696.196655, 2622.851074, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate10',
    doorRate = 1.0,
    objYaw = 89.839065551758,
    doorType = 'door',
}

-- stairs11 created by THX1139
Config.DoorList['prison-stairs11'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1678.748535, 2671.198242, 46.252197),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate11',
    doorRate = 1.0,
    objYaw = 95.529205322266,
    doorType = 'door',
}

-- stairs12 created by THX1139
Config.DoorList['prison-stairs12'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1690.991455, 2675.965332, 46.252193),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate12',
    doorRate = 1.0,
    objYaw = 135.06362915039,
    doorType = 'door',
}

-- stairs13 created by THX1139
Config.DoorList['prison-stairs13'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1730.700806, 2675.993652, 46.252193),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate13',
    doorRate = 1.0,
    objYaw = 45.372169494629,
    doorType = 'door',
}

-- stairs14 created by THX1139
Config.DoorList['prison-stairs14'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1745.708984, 2672.626709, 46.252193),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate14',
    doorRate = 1.0,
    objYaw = 99.686958312988,
    doorType = 'door',
}

-- stairs15 created by THX1139
Config.DoorList['prison-stairs15'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1778.268677, 2649.880127, 46.252193),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate15',
    doorRate = 1.0,
    objYaw = 10.288603782654,
    doorType = 'door',
}

-- stairs16 created by THX1139
Config.DoorList['prison-stairs16'] = {
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    objName = -1156020871,
    objCoords = vec3(1731.882813, 2652.749023, 46.252220),
    distance = 2,
    fixText = true,
    locked = true,
    doorLabel = 'staregate16',
    doorRate = 1.0,
    objYaw = 89.839065551758,
    doorType = 'door',
}

-- stairs17 created by THX1139
Config.DoorList['prison-stairs17'] = {
    locked = true,
    fixText = true,
    distance = 2,
    doorRate = 1.0,
    objYaw = 269.50003051758,
    objName = -1156020871,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorType = 'door',
    objCoords = vec3(1681.208374, 2564.782227, 46.252220),
}

-- stairs18 created by THX1139
Config.DoorList['prison-stairs18'] = {
    locked = true,
    fixText = true,
    distance = 2,
    doorRate = 1.0,
    objYaw = 269.50003051758,
    objName = -1156020871,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorType = 'door',
    objCoords = vec3(1708.481812, 2564.782471, 46.252220),
}

-- stairs19 created by THX1139
Config.DoorList['prison-stairs19'] = {
    locked = true,
    fixText = true,
    distance = 2,
    doorRate = 1.0,
    objYaw = 269.50003051758,
    objName = -1156020871,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorType = 'door',
    objCoords = vec3(1744.181641, 2562.525391, 46.252220),
}

-- stairs20 created by THX1139
Config.DoorList['prison-stairs20'] = {
    fixText = true,
    doorRate = 1.0,
    locked = true,
    objName = -1156020871,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0, ['corrections'] = 0 },
    doorType = 'door',
    objCoords = vec3(1653.234253, 2640.782227, 46.252197),
    distance = 2,
    objYaw = 185.06983947754,
}