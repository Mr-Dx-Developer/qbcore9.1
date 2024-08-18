KloudDev.Locations = {
    ["potato"] = {
        coords = vec4(2852.95, 4627.06, 50.69, 284.01),
        zoneRadius = 65,
        prop = "prop_plant_fern_02a",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "skillCheck", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        max = 25,
        target = {
            label = "Uproot",
            icon = "fas fa-trowel"
        },
        anim = {
            scenario = "WORLD_HUMAN_GARDENER_PLANT",
            dict = nil,
            clip = nil,
            upperBody = false
        },
        item = {
            require = {
                enable = true,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "dirty_potato",
            label = "Dirty Potato",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Potato Field",
            sprite = 285,
            scale = 0.9,
            colour = 21,
        },
    },
    ["cabbage"] = {
        coords = vec4(2541.34, 4812.27, 33.73, 65.37),
        zoneRadius = 35,
        prop = "prop_veg_crop_03_cab",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "progress", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        max = 25,
        target = {
            label = "Uproot",
            icon = "fas fa-hands-holding"
        },
        anim = {
            scenario = nil,
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            clip = "machinic_loop_mechandplayer",
            upperBody = false,
        },
        item = {
            require = {
                enable = false,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "dirty_cabbage",
            label = "Dirty Cabbage",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Cabbage Field",
            sprite = 285,
            scale = 0.9,
            colour = 2,
        },
    },
    ["tomato"] = {
        coords = vec4(2238.95, 5074.01, 47.25, 220.28),
        zoneRadius = 45,
        prop = "prop_veg_crop_02",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "skillCheck", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        max = 25,
        target = {
            label = "Uproot",
            icon = "fas fa-hands-holding"
        },
        anim = {
            scenario = nil,
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            clip = "machinic_loop_mechandplayer",
            upperBody = true,
        },
        item = {
            require = {
                enable = false,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "dirty_tomato",
            label = "Dirty Tomato",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Tomato Field",
            
            sprite = 285,
            scale = 0.9,
            colour = 6,
        },
    },
    ["coffee_beans"] = {
        coords = vec4(2308.01, 5131.05, 50.5, 45.11),
        zoneRadius = 35,
        prop = "prop_veg_crop_04_leaf",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "skillCheck", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        max = 25,
        target = {
            label = "Uproot",
            icon = "fas fa-hands-holding"
        },
        anim = {
            scenario = nil,
            dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            clip = "machinic_loop_mechandplayer",
            upperBody = true,
        },
        item = {
            require = {
                enable = false,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "dirty_coffee_beans",
            label = "Dirty Coffe Beans",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Coffee Bean Field",
            
            sprite = 285,
            scale = 0.9,
            colour = 44,
        },
    },
}

KloudDev.Trees = {
    ["orange"] = {
        coords = vec4(2341.86, 5003.98, 42.53, 45.44),
        zoneType = "sphere",
        zoneRadius = 55,
        zonePoints = {
            vec3(2455.0, 4670.0, 35.0),
            vec3(2367.0, 4761.0, 35.0),
            vec3(2311.0, 4780.0, 35.0),
            vec3(2299.0, 4743.0, 35.0),
            vec3(2361.0, 4712.0, 35.0),
            vec3(2428.0, 4646.0, 35.0),
        },
        cooldown = 60,
        prop = "prop_veg_crop_orange",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "skillCheck", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        target = {
            label = "Pick Orange",
            icon = "fas fa-cannabis"
        },
        anim = {
            scenario = nil,
            dict = "missmechanic",
            clip = "work_base",
            upperBody = true
        },
        item = {
            require = {
                enable = false,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "orange",
            label = "Orange",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Orange Field",
            
            sprite = 285,
            scale = 0.9,
            colour = 47,
        },
    },
    ["orange2"] = {
        coords = vec4(2360.21, 4729.47, 34.53, 260.21),
        zoneType = "poly",
        zoneRadius = 55,
        zonePoints = {
            vec3(2455.0, 4670.0, 35.0),
            vec3(2367.0, 4761.0, 35.0),
            vec3(2311.0, 4780.0, 35.0),
            vec3(2299.0, 4743.0, 35.0),
            vec3(2361.0, 4712.0, 35.0),
            vec3(2428.0, 4646.0, 35.0),
        },
        cooldown = 60,
        prop = "prop_veg_crop_orange",
        job = false, -- false to disable, "jobname" to enable
        action = {
            type = "skillCheck", -- "progress" / "skillCheck"
            progressDuration = 5000,
            skillCheckDifficulty = {"easy", "easy", "easy", "easy"}, -- "easy", "medium", "hard"
            skillCheckInputs = {"1", "2", "3", "4"}
        },
        target = {
            label = "Pick Orange",
            icon = "fas fa-cannabis"
        },
        anim = {
            scenario = nil,
            dict = "missmechanic",
            clip = "work_base",
            upperBody = true
        },
        item = {
            require = {
                enable = false,
                item = "trowel",
                durability = {
                    subtract = true,
                    amount = 1,
                    chance = 75
                },
                breaking = {
                    enabled = true,
                    chance = 15
                }
            },
            name = "orange",
            label = "Orange",
            min = 1,
            max = 4
        },
        blip = {
            enabled = true,
            label = "Orange Field",
            
            sprite = 285,
            scale = 0.9,
            colour = 47,
        },
    },
}

KloudDev.WashLocations = {
    blip = {
        enabled = true,
        label = "Wash Crops",
        sprite = 728,
        scale = 0.9,
        colour = 4,
    },
    duration = 3000, -- per item count ex. x1 orange = 3secs, x10 orange = 30secs
    maxWash = 20,
    anim = {
        scenario = "WORLD_HUMAN_BUM_WASH", -- nil to disable
        dict = nil,
        clip = nil,
        upperBody = false
    },
    items = {
        {"dirty_potato", "potato"},
        {"dirty_cabbage", "cabbage"},
        {"dirty_tomato", "tomato"},
        {"dirty_coffee_beans", "coffee_beans"},
        --{requiredItem, resultItem}
    },
    coords = {
        vec4(2405.77, 4600.39, 30.31, 98.15),
        vec4(2397.81, 4596.51, 30.31, 134.76),
        vec4(2384.6, 4594.71, 30.38, 107.85),
        vec4(2363.49, 4593.61, 30.52, 106.54),
        vec4(2372.93, 4595.23, 30.54, 190.0),
    }
}

KloudDev.Shops = {
    ["sell"] = {
        blip = {
            enabled = true,
            label = "Crops Buyer",
            sprite = 59,
            scale = 0.9,
            colour = 2,
        },
        coords = {
            vector4(2028.18, 4978.26, 40.12, 224.48),
            vector4(2243.63, 5154.18, 56.89, 154.39)
        },
        pedModels = {
            "a_m_m_farmer_01",
            "cs_russiandrunk",
            "cs_old_man1a",
            "cs_old_man2",
            "cs_nervousron",
        },
        prices = {
            {"potato", 50},
            {"tomato", 50},
            {"orange", 50},
            {"cabbage", 50},
            {"coffee_beans", 50},
        --  {"itemName", price}
        }
    },
    ["shop"] = {
        blip = {
            enabled = true,
            label = "Farmer's Shop",
            sprite = 59,
            scale = 0.9,
            colour = 2,
        },
        coords = {
            vector4(461.93, -696.86, 26.42, 70.94),

        },
        pedModels = {
            "a_m_m_farmer_01",
            "cs_russiandrunk",
            "cs_old_man1a",
            "cs_old_man2",
            "cs_nervousron",
        },
        prices = {
            {"shovel", 100},
            {"trowel", 50},
            {"potato", 75},
            {"tomato", 75},
            {"orange", 75},
            {"cabbage", 75},
            {"coffee_beans", 75},
        --  {"itemName", price}
        }
    },
}