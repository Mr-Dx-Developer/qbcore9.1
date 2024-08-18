Config = {}

Config.Skillmenu = "skills" -- skillmenu command
Config.Debug = false -- debug print

Config.UpdateFrequency = 3600 
Config.DeleteStats = true 
Config.MmbershipCardItem = 'fitness_subscription'
Config.GymBlip = vector3(258.45, -271.44, 53.96)
Config.PedLocations = {{coords = vector4(258.45, -271.44, 53.96, 344.32)}}
Config.ticketPrice = {
    ["fitness_subscription"] = {
        price = 2500,
        time = 30, -- in minutes
    },
}

Config.Skills = { --you can change 'Config.Skills` only on tests! Do not make changes after adding to the main server- your players will lose experience!!!
     ["Stamina"] = { -- don't touch
        ["Current"] = 20, -- Default value 
        ["RemoveAmount"] = -0.3, -- % to remove when updating,
        ["Stat"] = "MP0_STAMINA", -- GTA stat hashname
        ['icon'] = 'fas fa-walking',-- icon Menu
		["Local"]= "Stamina", --localization- translate into your language for alerts
    },

    ["Strength"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.3,
        ["Stat"] = "MP0_STRENGTH",
        ['icon'] = 'fas fa-dumbbell',
		["Local"]= "Strength",
    },

    ["LungCapacity"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_LUNG_CAPACITY",
        ['icon'] = 'fas fa-heartbeat',
		["Local"]= "Lung Capacity",
    },

    ["Shooting"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.1,
        ["Stat"] = "MP0_SHOOTING_ABILITY",
        ['icon'] = 'fas fa-bullseye',
		["Local"]= "Shooting",
    },

    ["Driving"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.5,
        ["Stat"] = "MP0_DRIVING_ABILITY",
        ['icon'] = 'fas fa-car-side',
	    ["Local"]= "Driving",
    },

    ["Wheelie"] = {
        ["Current"] = 10,
        ["RemoveAmount"] = -0.2,
        ["Stat"] = "MP0_WHEELIE_ABILITY",
        ['icon'] = 'fas fa-wheelchair',
		["Local"]= "Wheelie",
    }
}
-- SkillAddQuantity = 1-the experience gained
Config.Locations = {
    [1] = {
        coords = vector3(251.28, -266.92, 59.92), heading = 66.53,
        animation = "prop_human_muscle_chin_ups", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [3] = {
        coords = vector3(234.4, -267.47, 60.04), heading = 335.78,
        animation = "world_human_yoga", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [4] = {
        coords = vector3(255.93, -257.85, 59.91), heading = 160.78,
        animation = "world_human_muscle_free_weights", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [5] = {
        coords = vector3(236.5, -261.62, 60.07), heading = 67.92,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [6] = {
        coords = vector3(237.49, -259.19, 60.07), heading = 50.78,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [7] = {
        coords = vector3(239.21, -257.46, 60.07), heading = 46.2,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [8] = {
        coords = vector3(240.64, -256.34, 60.07), heading = 36.78,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [9] = {
        coords = vector3(242.2, -255.57, 60.07), heading = 10.78,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [10] = {
        coords = vector3(244.28, -255.19, 60.06), heading = 2.59,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [11] = {
        coords = vector3(256.45, -259.82, 59.92), heading = 69.78,
        animation = "world_human_muscle_free_weights", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [12] = {
        coords = vector3(255.38, -262.54, 59.92), heading = 72.77,
        animation = "world_human_muscle_free_weights", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [13] = {
        coords = vector3(240.37, -262.64, 59.92), heading = 336.53,
        animation = "WORLD_HUMAN_PUSH_UPS", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [14] = {
        coords = vector3(251.77, -261.61, 59.92), heading = 130.53,
        animation = "WORLD_HUMAN_PUSH_UPS", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [15] = {
        coords = vector3(246.39, -255.39, 60.06), heading = 354.15,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [16] = {
        coords = vector3(248.91, -255.88, 60.07), heading = 340.36,
        animation = "WORLD_HUMAN_JOG_STANDING", skill = "Stamina", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 3.5,
    },
    [17] = {
        coords = vector3(253.18, -256.95, 59.92), heading = 167.78,
        animation = "world_human_muscle_free_weights", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
    [18] = {
        coords = vector3(248.73, -268.38, 59.92), heading = 253.53,
        animation = "prop_human_muscle_chin_ups", skill = "Strength", SkillAddQuantity = 1,
        Text3D = "~b~E~w~ - [Start Training]", viewDistance = 2.5,
    },
}
