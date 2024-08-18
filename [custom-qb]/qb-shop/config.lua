Config = {}

Config.Framework = 'QB' -- ESX or QB
Config.FrameworkCore = 'qb-core' -- es_extended, qb-core, if-core, ...
Config.BlipRadius = 750

Config.Notification = function(message, type)
    -- TriggerEvent('esx:showNotification', message, type, 2500)
    TriggerEvent('QBCore:Notify', message, type, 5000)
end

Config.PayMethod = 'bank' -- money/cash, bank

Config.Items = {
    ['water_bottle'] = { -- Item
        category = "category_1", -- Category
        display = "water_bottle", -- Display Name
        price = 50, -- Price per unit
        description = "Water for Life...", -- Description
    },
	['sandwich'] = {
        category = "category_2",
        display = "sandwich",
        price = 50,
        description = "A delicious sandwich...",
    },
    ['grapejuice'] = {
        category = "category_1",
        display = "grapejuice",
        price = 50,
        description = "grapejuice...",
    },
    ['bandage'] = {
        category = "category_1",
        display = "bandage",
        price = 100,
        description = "Recover your health...",
    },
    ['tosti'] = {
        category = "category_2",
        display = "tosti",
        price = 40,
        description = "Tastieeeee..",
    },
    ['twerks_candy'] = {
        category = "category_2",
        display = "twerks_candy",
        price = 30,
        description = "Candy For you..",
    },
    ['lighter'] = {
        category = "category_3",
        display = "lighter",
        price = 25,
        description = "Gas lighter..",
    },
    ['whiskey'] = {
        category = "category_3",
        display = "whiskey",
        price = 500,
        description = "whiskey o yeah baby..",
    },
    ['beer'] = {
        category = "category_3",
        display = "beer",
        price = 300,
        description = "Russian beer...",
    },
    ['vodka'] = {
        category = "category_3",
        display = "vodka",
        price = 250,
        description = "Ah Baby Ah Vodkaaaaa..",
    },    
}

Config.Locale = {
    buyed = "You made a purchase, paid $%s.",
    nomoney = "You can't afford the purchase!",
    Interact = "Press ~INPUT_CONTEXT~ to access the Shop",
}

Config.Shops = {
    { x = 373.875,   y = 325.896,   z = 102.566, blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 2557.458,  y = 382.282,   z = 107.622, blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -3038.939, y = 585.954,   z = 6.908,   blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -3241.927, y = 1001.462,  z = 11.830,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -2191.65,  y = 4285.4,    z = 49.18,   blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1961.464,  y = 3740.672,  z = 31.343,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 2678.916,  y = 3280.671,  z = 54.241,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1729.216,  y = 6414.131,  z = 34.037,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1135.808,  y = -982.281,  z = 45.415,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 25.7,      y = -1346.7,   z = 28.4,    blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -1222.915, y = -906.983,  z = 11.326,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -1487.553, y = -379.107,  z = 39.163,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -2968.243, y = 390.910,   z = 14.043,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1166.024,  y = 2708.930,  z = 37.157,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1392.562,  y = 3604.684,  z = 33.980,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 127.830,   y = -1284.796, z = 28.280,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -1400.06, y = -602.22,  z = 30.32,  blipname = "Bahama Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -559.906,  y = 287.093,   z = 81.176,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -48.519,   y = -1757.514, z = 28.421,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1163.373,  y = -323.801,  z = 68.205,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -707.501,  y = -914.260,  z = 18.215,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -1820.523, y = 792.518,   z = 137.118, blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    --{ x = 2741.05, y = 3497.48,   z = 55.69,	 blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = 1698.388,  y = 4924.404,  z = 41.063,  blipname = "Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
    { x = -933.53,  y = -1178.06,  z = 5.0,  blipname = "Cookies Store", blipsprite = 590, blipcolor = 0, blipscale = 1.0, dist = 2.5 },
}
