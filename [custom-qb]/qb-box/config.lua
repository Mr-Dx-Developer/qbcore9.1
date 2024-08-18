Config = {                                                        -- CHANGE ITEMS HERE TO HAVE WHAT ITEMS YOU WANT!!! --
    -- ['Prices'] = {
    --     ['smallBox'] = 100, -- price of small box
    --     ['mediumBox'] = 500, -- price of medium box
    --     ['bigBox'] = 1000, -- price of big box
    --     ['expenciveBox'] = 3000, -- price expencive box
    -- },
    -- ['ShopPed'] = {
    --     ['PedModel'] = `ig_gustavo`, -- shop ped model
    --     ['PedLoc'] = vector4(-601.78, -1122.13, 21.32, 277.49), -- shop ped loc 
    --     ['PedTarget'] = vector3(-601.78, -1122.13, 22.32), -- shop ped target loc
    -- },
    ['Rewards'] = {
        ['smallBox'] = {
            ['Money1'] = math.random(200, 1000), -- amount of money
            ['Money2'] = math.random(100, 500), -- amount of money
            ['Item1'] = 'phone', -- item name
            ['ShitItem1'] = 'sandwich', -- item name
        },
        ['mediumBox'] = {
            ['Money1'] = math.random(1000, 3500), -- amount of money
            ['Money2'] = math.random(500, 1500), -- amount of money
            ['Item1'] = 'phone', -- item name
            ['Item2'] = 'crypto_stick', -- item name
            ['ShitItem1'] = 'sandwich', -- item name
            ['ShitItem2'] = 'water_bottle', -- item name
        },
        ['bigBox'] = {
            ['Money1'] = math.random(500, 3000), -- amount of money
            ['Money2'] = math.random(200, 2000), -- amount of money
            ['Money3'] = math.random(200, 1000), -- amount of money
            ['Item1'] = 'phone', -- item name
            ['Item2'] = 'radio', -- item name
            ['Item3'] = 'radio', -- item name
            ['ShitItem1'] = 'sandwich', -- item name
            ['ShitItem2'] = 'water_bottle', -- item name
            ['ShitItem3'] = 'weapon_ball', -- item name
        },
        ['expenciveBox'] = {
            ['Money1'] = math.random(1500, 3200), -- amount of money
            ['Money2'] = math.random(200, 3500), -- amount of money
            ['Money3'] = math.random(500, 3100), -- amount of money
            ['Money4'] = math.random(200, 3000), -- amount of money
            ['Item1'] = 'phone', -- item name
            ['Item2'] = 'crypto_stick', -- item name
            ['Item3'] = 'wearon_pistol_mk2', -- item name
            ['Item4'] = 'radio', -- item name
            ['ShitItem1'] = 'sandwich', -- item name
            ['ShitItem2'] = 'crypto_stick', -- item name
            ['ShitItem3'] = 'weapon_ball', -- item name
            ['ShitItem4'] = 'water_bottle', -- item name
        },
    },
}