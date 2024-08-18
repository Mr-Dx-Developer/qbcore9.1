-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(447.85, -990.88, 31.52),
    },
    ['ambulance'] = {
        vector3(335.46, -594.52, 43.28),
    },
    ['tequilala'] = {
        vector3(0.00, 0.00, 0.00),
    },
    ['whitewidow'] = {
        vector3(0.00, 0.00, 0.00),
    },
    ['vanilla'] = {
        vector3(129.68, -1280.64, 30.33),
    },
    ['burgershot'] = {
        vector3(-1188.11, -904.54, 14.74),
    },
    ['beanmachine'] = {
        vector3(126.24, -1034.34, 30.22),
    },
    ['uwu'] = {
        vector3(-578.0, -1067.08, 27.52),
    },
    ['cardealer'] = {
        vector3(-27.47, -1108.07, 28.17),
    },
    ['mechanic'] = {
        vector3(-228.26, -1328.26, 31.93),
    },
    ['dominos'] = {
        vector3(541.36, 114.08, 96.57),
    },
    ['popeyes'] = {
        vector3(179.1, -1456.12, 29.13),
    },
    ['cookies'] = {
        vector3(-934.1, -1168.34, 5.11),
    },
    ['realestate'] = {
        vector3(-715.62, 261.22, 85.06),
    },  
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(447.85, -990.88, 31.52), length = 1.35, width = 1.45, heading = 190.13, minZ = 30.00, maxZ = 31.73 },    },
    ['ambulance'] = {
        { coords = vector3(311.5, -583.41, 44.18), length = 1.2, width = 0.6, heading = 252.47, minZ = 43.13, maxZ = 45.73 },
    },
    ['tequilala'] = {
        { coords = vector3(0.00, 0.00, 0.00), length = 0.6, width = 1.0, heading = 44.76, minZ = 81.943, maxZ = 83.74 },
    },
    ['whitewidow'] = {
        { coords = vector3(0.00, 0.00, 0.00), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 353.1},
    },
    ['vanilla'] = {
        { coords = vector3(129.68, -1280.64, 30.33), length = 2.4, width = 1.05, heading = 116.54, minZ = 30.07, maxZ = 31.67 },
    },
    ['burgershot'] = {
        { coords = vector3(-1188.11, -904.54, 14.74), length = 1.15, width = 2.6, heading = 307.28, minZ = 13.74, maxZ = 15.74 },
    },
    ['beanmachine'] = {
        { coords = vector3(126.24, -1034.34, 30.22), length = 1.15, width = 2.6, heading = 76.08, minZ = 29.74, maxZ = 31.74 },
    },
    ['uwu'] = {
        { coords = vector3(-578.0, -1067.08, 27.52), length = 1.15, width = 2.6, heading = 198.04, minZ = 26.74, maxZ = 28.74 },
    },
    ['cardealer'] = {
        { coords = vector3(-27.47, -1108.07, 28.17), length = 1.15, width = 2.6, heading = 233.61, minZ = 26.74, maxZ = 28.74 },
    },
    ['mechanic'] = {
        { coords = vector3(-228.26, -1328.26, 31.93), length = 1.15, width = 2.6, heading = 264.69, minZ = 30.74, maxZ = 32.74 },
    },
    ['dominos'] = {
        { coords = vector3(541.36, 114.08, 96.57), length = 1.15, width = 2.6, heading = 264.69, minZ = 95.74, maxZ = 97.74 },
    },
    ['popeyes'] = {
        { coords = vector3(179.1, -1456.12, 29.13), length = 1.15, width = 2.6, heading = 264.69, minZ = 28.74, maxZ = 29.74 },
    },
    ['cookies'] = {
        {coords = vector3(-934.1, -1168.34, 5.11), length = 1.15, width = 2.6, heading = 353.0, minZ = 4.11, maxZ = 5.99},
    },
    ['realestate'] = {
        {coords = vector3(-715.62, 261.22, 85.06), length = 1.15, width = 2.6, heading = 237.0, minZ = 84.11, maxZ = 86.06},
    },

}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
