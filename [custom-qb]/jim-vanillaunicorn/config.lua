-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false,  -- false to remove green boxes
	PrintDebug = false, -- false to remove f8 debug messages for the script

	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)
	Lan = "en", -- Pick your language here

	Core = "qb-core",
	Inv = "qb",
	Menu = "qb",
	Notify = "qb",

	JimShop = false, -- Enable this to use jim-shops for buying ingredients
	JimConsumables = false,

	--Stress
	TipCost = 3500, -- How much a Stripper Tip costs
	TipStress = 5, -- How much stress relief per tip

	Strippers = true,
	JacuzzisStress = math.random(5, 10),

	Locations = {
		{ --[[ VANILLA UNICORN ]]--
			zoneEnable = true,
			job = "vanilla",
			label = "Vanilla Unicorn",
			MLO = "gabz", -- Set to "van" for default -- Set to "gabz" for gabz vu
			zones = {
				vec2(106.45397186279, -1340.5074462891),
				vec2(72.271331787109, -1276.0433349609),
				vec2(146.02534484863, -1265.64453125),
				vec2(164.9525604248, -1292.0209960938)
			},
			autoClock = { enter = true, exit = true, }, -- Turning these on will detect if the person has the job and auto clock them on or off
			blip = vec3(111.05, -1287.96, 28.26), blipcolor = 61, blipsprite = 121,
			garage = { spawn = vec4(151.4, -1287.78, 28.68, 210.15),
				out = vec4(149.25, -1290.13, 29.23, 301.17),
				list = { "panto", "burrito3" }
			},
			--Custom DJ Booth Stuff
			Booth = {
				enableBooth = true, -- Set false if using external DJ/Music stuff.
				DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
				radius = 30, -- The radius of the sound from the booth
				coords = vec3(120.0, -1281.72, 29.48), -- Where the booth is located
				playing = false,
			},
		},
		{ 	--[[ BAHAMA MAMA MLO ]]--
			zoneEnable = true,
			job = "bahamas",
			label = "Bahama Mamas",
			MLO = "gabzbm",
			zones = {
				vec2(-1384.5277099609, -584.45465087891),
				vec2(-1415.2163085938, -604.27465820312),
				vec2(-1389.8627929688, -644.43115234375),
				vec2(-1366.185546875, -628.23389404297)
			},
			autoClock = { enter = true, exit = true, }, -- Turning these on will detect if the person has the job and auto clock them on or off
			blip = vec3(-1388.78, -585.14, 30.22), blipsprite = 121, blipcolor = 61,
			garage = { spawn = vec4(151.4, -1287.78, 28.68, 210.15),
				out = vec4(149.25, -1290.13, 29.23, 301.17),
				list = { "panto", "burrito3" }
			},
			--Custom DJ Booth Stuff
			Booth = {
				enableBooth = false, -- Set false if using external DJ/Music stuff.
				DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
				radius = 30, -- The radius of the sound from the booth
				coords = vec3(-1377.36, -607.93, 31.32), -- Where the booth is located
				playing = false,
			},
		},
	},
	DrinkItems = {
		label = "Drinks Store",
		slots = 18,
		items = {
			{ name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "midori", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "pinejuice", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "prosecco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "tequila", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "triplsec", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 17, },
			{ name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 18, },
		},
	},
	FoodItems = {
		label = "Food Fridge Store",
		slots = 14,
		items = {
			{ name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "nachos", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "potato", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "lemon", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "cubasil", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "mintleaf", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "peach", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "strawberry", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
		},
	},
}
Crafting = {
	Cocktails = {
		{ ['amarettosour'] = { ['amaretto'] = 1, ['lemon'] = 1, } },
		{ ['bellini'] = { ['prosecco'] = 1, ['peach'] = 1, } },
		{ ['cosmopolitan'] = { ['vodka'] = 1, ['orange'] = 1,	['cranberry'] = 1, ['cubasil'] = 1,	} },
		{ ['longisland'] = { ['gin'] = 1, ['tequila'] = 1, ['vodka'] = 1, ['ecola'] = 1, ['lemon'] = 1, } },
		{ ['margarita'] = { ['tequila'] = 1, ['lime'] = 1, ['orange'] = 1, } },
		{ ['pinacolada'] = { ['rum'] = 1, ['pinejuice'] = 1, } },
		{ ['sangria'] = { ['prosecco'] = 1, ['sprunk'] = 1, ['orange'] = 1, ['mintleaf'] = 1, } },
		{ ['screwdriver'] = { ['vodka'] = 1, ['orange'] = 1, } },
		{ ['strawdaquiri'] = { ['rum'] = 1, ['strawberry'] = 1,	} },
		{ ['strawmargarita'] = { ['tequila'] = 1, ['strawberry'] = 1, } },
	},
	Food = {
		{ ['vusliders'] = { ['meat'] = 1, ['lettuce'] = 1, } },
		{ ['vutacos'] = { ['meat'] = 1, ['lettuce'] = 1, } },
		{ ['nplate'] = { ['nachos'] = 1, ['cheddar'] = 1, } },
		{ ['tots'] = { ['potato'] = 1, } },
	},
	Beer = {
		{ ['ambeer'] = { } },
		{ ['dusche'] = { } },
		{ ['logger'] = { } },
		{ ['pisswasser'] = { } },
		{ ['pisswasser2'] = { } },
		{ ['pisswasser3'] = { } },
	},
}

Loc = {}