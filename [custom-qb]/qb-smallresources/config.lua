Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- To make this simple. Everything you need is in the config, except for discord, weapon drops, vehicle classes for cruise, hands up disabled keys, and recoil

Config.AFK = {
    ignoredGroups = {
        ['mod'] = true,
        ['admin'] = true,
        ['god'] = true
    },
    secondsUntilKick = 1800 -- AFK Kick Time Limit (in seconds)
}

Config.SeizeItems = {
    'phone',
    'tosti',
    'weapon_pistol'
}

Config.Binoculars = {
    fov_max = 70.0,
    fov_min = 5.0, -- max zoom level (smaller fov is more zoom)
    zoomspeed = 10.0, -- camera zoom speed
    speed_lr = 8.0, -- speed by which the camera pans left-right
    speed_ud = 8.0, -- speed by which the camera pans up-down
    storeBinoclarKey = 177
}

-- Whether to enable or disable dispatch services
Config.DispatchServices = {
    [1] = true, -- Police Vehicles
    [2] = true, -- Police Helicopters
    [3] = true, -- Fire Department Vehicles
    [4] = true, -- Swat Vehicles
    [5] = true, -- Ambulance Vehicles
    [6] = true, -- Police Motorcycles
    [7] = true, -- Police Backup
    [8] = true, -- Police Roadblocks
    [9] = true, -- PoliceAutomobileWaitPulledOver
    [10] = true, -- PoliceAutomobileWaitCruising
    [11] = false, -- Gang Members
    [12] = false, -- Swat Helicopters
    [13] = false, -- Police Boats
    [14] = false, -- Army Vehicles
    [15] = false, -- Biker Backup
}

-- Enable or disable the wanted level
Config.EnableWantedLevel = false

-- To Set This Up visit https://forum.cfx.re/t/how-to-updated-discord-rich-presence-custom-image/157686
Config.Discord = {
    ["IsEnabled"] = true, -- If set to true, then discord rich presence will be enabled
    ["ApplicationId"] = '', -- The discord application id
    ["IconLarge"] = '1', -- The name of the large icon
    ["IconLargeHoverText"] = 'only buy from QBCore#4011', -- The hover text of the large icon
    ["IconSmall"] = '2', -- The name of the small icon
    ["IconSmallHoverText"] = 'QBCore Store Since 2020', -- The hover text of the small icon
    ["UpdateRate"] = 60000, -- How often the player count should be updated
    ["ShowPlayerCount"] = true, -- If set to true the player count will be displayed in the rich presence
    ["MaxPlayers"] = 128 -- Maximum amount of players
}

Config.Density = {
    ['parked'] = 0.3,
    ['vehicle'] = 0.5,
    ['multiplier'] = 0.3,
    ['peds'] = 0.3,
    ['scenario'] = 0.3,
}

Config.Stun = {
    active = false,
    min = 4000,
    max = 7000
}

Config.Cruise = 'kmp/h'
Config.IdleCamera = true
Config.disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}
Config.DisableAmbience = true -- Disabled distance sirens, distance car alarms, etc
Config.HarnessUses = 20
-- Config.DamageNeeded = 100.0 -- vehiclepush 0-1000
Config.EnableProne = true -- prone isnt recomended at this time
Config.MapText = "All In RP" -- This is the name / text shown above the map

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

Config.ConsumablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["tq_banana_nut"] = math.random(20, 40),
    ["tq_chocolatecup"] = math.random(20, 40),
    ["tq_strawberrycup"] = math.random(20, 40),
    ["burgershot_bigking"] = math.random(40, 50),
    ["burgershot_bleeder"] = math.random(20, 30),
    ["burgershot_goatwrap"] = math.random(50, 60),
    ["burgershot_macaroon"] = math.random(10, 15),
    ["burgershot_patatob"] = math.random(15, 20),
    ["burgershot_patatos"] = math.random(5, 10),
    ["burgershot_shotnuggets"] = math.random(10, 15),
    ["burgershot_shotrings"] = math.random(10, 15),
    ["burgershot_thesmurfsicecream"] = math.random(1, 3),
    ["burgershot_smurfetteicecream"] = math.random(1, 3),
    ["burgershot_matchaicecream"] = math.random(1, 3),
    ["burgershot_ubeicecream"] = math.random(1, 3),
    ["burgershot_unicornicecream"] = math.random(1, 3),
    ["burgershot_vanillaicecream"] = math.random(1, 3),
    ["burgershot_chocolateicecream"] = math.random(1, 3),
    ["burgershot_strawberryicecream"] = math.random(1, 3),

}

Config.ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["tq_berry_hydrating"] = math.random(20, 40),
    ["tq_green_dream"] = math.random(20, 40),
    ["tq_island_breeze"] = math.random(20, 40),
    ["tq_just_peachy"] = math.random(20, 40),
    ["tq_watermelon_dream"] = math.random(20, 40),
    ["tq_ban_straw_juice"] = math.random(20, 40),
    ["tq_banana_juice"] = math.random(20, 40),
    ["tq_kiwi_juice"] = math.random(20, 40),
    ["tq_strawberry_juice"] = math.random(20, 40),
    ["tq_orange_juice"] = math.random(20, 40),
    ["tq_strawberrycup"] = math.random(20, 40),
    ["tq-chocolatecup"] = math.random(20, 40),
    ["tq_banana_nut"] = math.random(20, 40),
    --Burger Shot Drink

    ["burgershot_colab"] = math.random(40, 50),
    ["burgershot_colas"] = math.random(20, 30),
    ["burgershot_coffee"] = math.random(10, 20),
    
}

Config.ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["tq_cocktail"] = math.random(20, 30),
    ["tq_coconut_drink"] = math.random(30, 40),
    ["tq_island_fantasy"] = math.random(20, 40),
    ["tq_kamikaze"] = math.random(20, 40),
    ["tq_redhot_daquiri"] = math.random(20, 40),
    ["grapejuice"] = math.random(20, 40),

}



-- Custom Consumables hand bones
-- 18905 left hand
-- 57005 right hand
Config.ConsumablesCustom = {
    -- ['newitem'] = {
    --     ['progress'] = {
    --         label = 'Using Item...',
    --         time = 5000
    --     },
    --     ['animation'] = {
    --         animDict = "amb@prop_human_bbq@male@base",
    --         anim = "base",
    --         flags = 8,
    --     },
    --     ['prop'] = {
    --         model = false,
    --         bone = false,
    --         coords = false, -- vector 3 format
    --         rotation = false, -- vector 3 format
    --     },
    --     ['replenish'] = {
    --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
    --         replenish = math.random(20, 40), 
    --         isAlcohol = false, -- if you want it to add alcohol count
    --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
    --         server = false -- if the event above is a server event
    --     }
    -- }
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.FireworkTime = 5 -- seconds before it goes off

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

--Anticombatlog
Config.DrawingTime = 60*1000 --12 seconds
Config.TextColor = {r=255, g=255,b=255} -- WHITE (Player Data)
Config.AlertTextColor = {r=255, g=0, b=0} -- RED (Player Left Game)
Config.LogSystem = true
Config.UseSteam = true -- If False then use R* License
Config.LogBotName = "HCRP_Combatlog"
--Start Bandages
Config.HealingTicks = 8 -- Each tick of healing lasts 1 second. 10 ticks = 10 seconds of healing. 
Config.HealthPerTick = 8 -- How much health you get per tick. Multiply this times the number of ticks and that is how much your bandage will heal.
Config.BandageTimer = 5000 -- Time in milliseconds it takes to use a bandage (1000 = 1 second)
Config.Bandages ={
    'kittybandage',
    'swbandage',
    'shrekbandage',
    'carsbandage',
    'mousebandage',
    'avengersbandage',
    "baconbandage",
    'pokemonbandage',
    'spongebobbandage',
    'toystorybandage',
    'scoobydobandage',
    -- 'itemname', --add more useable bandage items, you will have to add them to the band aid box in the thx.lua
}
--End Bandages

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.DisableVestDrawable = false -- Set to TRUE to disable the vest equipped when using heavy armor.
Config.HolsterVariant = {130,122,3,6,8}
Config.HolsterableWeapons = {
    -- Custom Weapons -- Hand Guns
	'WEAPON_GLOCK17',
	'WEAPON_GLOCK18C',
	'WEAPON_GLOCK22',
	'WEAPON_DEAGLE',
	'WEAPON_FNX45',
	'WEAPON_M1911',
    'WEAPON_GLOCK20',
    'WEAPON_GLOCK19GEN4',
    ----------
    'WEAPON_STUNGUN',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL'
}

Config.Objects = { -- for object removal
    {coords = vector3(266.09,-349.35,44.74), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02b"},
    {coords = vector3(285.28,-355.78,45.13), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02a"},
}


-- You may add more than 2 selections and it will bring up a menu for the player to select which floor be sure to label each section though
Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = { -- up label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 20.99),
                heading = 167.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false -- set this to a string for a custom label or leave it false to keep the default

        },
        [2] = { -- down label
            ['poly'] = {
                coords = vector3(3540.74, 3675.59, 28.11),
                heading = 172.5,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = false
        },
    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            ['poly'] = {
                coords = vector3(909.49, -1589.22, 30.51),
                heading = 92.24,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Enter Coke Processing'
        },
        [2] = {
            ['poly'] = {
                coords = vector3(1088.81, -3187.57, -38.99),
                heading = 181.7,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = '[E] Leave'
        }
    },

    [3] = {
        [1] = {
            ['poly'] = {
                coords = vector4(325.53, -598.87, 43.29, 251.62),
                heading = 253.41,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'MAIN FLOOR'
        },
        [2] = {
            ['poly'] = {
                coords = vector3(338.47, -583.94, 74.17),
                heading = 254.04,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'TOP FLOOR'
        },
        [3] = {
            ['poly'] = {
                coords = vector4(319.63, -560.16, 28.74, 29.22),
                heading = 29.22,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'BOTTOM FLOOR'
        }
    },
    [4] = {
        [1] = {
            ['poly'] = {
                coords = vector4(465.22, -976.04, 30.72, 275.37),
                heading = 91.86,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'MAIN FLOOR'
        },
        [2] = {
            ['poly'] = {
                coords = vector4(465.25, -976.13, 35.06, 87.68),
                heading = 87.68,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'SECOND FLOOR'
        },
        [3] = {
            ['poly'] = {
                coords = vector4(465.23, -976.06, 39.42, 91.86),
                heading = 91.86,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'THIRD FLOOR'
        },
        [4] = {
            ['poly'] = {
                coords = vector4(467.12, -976.46, 43.7, 183.38),
                heading = 183.38,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'TOP FLOOR'
        },
        [5] = {
            ['poly'] = {
                coords = vector4(466.98, -975.17, 25.47, 184.9),
                heading = 184.9,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'GROUND FLOOR'
        }
    },
    [5] = {
        [1] = {
            ['poly'] = {
                coords = vector4(909.49, -1589.22, 30.51, 92.24),
                heading = 92.24,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'MAIN FLOOR'
        },
        [2] = {
            ['poly'] = {
                coords = vector4(1088.81, -3187.57, -38.99, 181.7),
                heading = 181.7,
                length = 2,
                width = 2
            },
            ["AllowVehicle"] = false,
            label = 'MAIN FLOOR'
        }
    }
}

Config.UseSoundEffect = true

Config.DefaultPrice = 200 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["poly"] = {
            coords = vector3(174.81, -1736.77, 28.87),
            length = 7.0,
            width = 8.8,
            heading = 359
        }
    }
}
