Config = {
	Debug = false,
	Lan = "en", -- Pick your language here
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	JimConsumables = false, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, -- If true shops will open in jim-shops
	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items
	Notify = "qb",

		--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "bento"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},
	Locations = {
		{	zoneEnable = true,
			job = "pizzathis", -- Set this to the required job
			label = "J&J Pizzeria", -- Set this to the required job
			zones = {
				vector2(776.45977783203, -734.53753662109),
				vector2(815.66552734375, -733.91662597656),
				vector2(819.54748535156, -747.50708007812),
				vector2(827.40344238281, -760.18341064453),
				vector2(829.70361328125, -769.6220703125),
				vector2(830.78997802734, -775.21801757812),
				vector2(776.12048339844, -774.75408935547)
			},
			blip = vector3(806.97, -759.59, 26.78),
			blipcolor = 43,
			garage = { spawn = vector4(791.12, -720.16, 27.45, 90.18),
			out = vector4(793.93, -717.42, 28.09, 180.56),
			list = { "panto", } },
		},
	},
	DrinkItems = {
		label = "Drinks Store",
		slots = 5,
		items = {
			{ name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
		}
	},
	WineItems = {
		label = "Wine Store",
		slots = 6,
		items = {
			{ name = "amarone", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "barbera", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "dolceto", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "housered", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "housewhite", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "rosso", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
		}
	},

	FoodItems = {
		label = "Food Fridge Store",
		slots = 7,
		items = {
			{ name = "sauce", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "pasta", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "olives", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "basil", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "mozz", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "pizzmushrooms", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "tiramisu", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "gelato", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "medfruits", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
		}
	},
	FreezerItems = {
		label = "Freezer Store",
		slots = 2,
		items = {
			{ name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "squid", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
		}
	},
}
Crafting = {
	Beer = {
		{ ['ambeer'] = { } },
		{ ['dusche'] = { } },
		{ ['logger'] = { } },
		{ ['pisswasser'] = { } },
		{ ['pisswasser2'] = { } },
		{ ['pisswasser3'] = { } },
	},
	Base = {
		{ ['pizzabase'] = { ['pizzadough'] = 1, ['sauce'] = 1, } },
	},
	Oven = {
		{ ['bolognese'] = { ['meat'] = 1, ['sauce'] = 1, } },
		{ ['calamari'] = { ['squid'] = 1, ['sauce'] = 1, } },
		{ ['meatball'] = { ['meat'] = 1, ['pasta'] = 1, } },
		{ ['alla'] = { ['ham'] = 1, ['pasta'] = 1, ['vodka'] = 1, } },
		{ ['pescatore'] = { ['squid'] = 1, } },
	},
	PizzaOven = {
		{ ['margheritabox'] = { ['pizzabase'] = 1, ['mozz'] = 1, } },
		{ ['marinarabox'] = { ['pizzabase'] = 1, ['basil'] = 1, } },
		{ ['prosciuttiobox'] = { ['pizzabase'] = 1, ['mozz'] = 1, ['ham'] = 1, ['pizzmushrooms'] = 1, } },
		{ ['diavolabox'] = { ['pizzabase'] = 1, ['mozz'] = 1, ['salami'] = 1, ['basil'] = 1, } },
		{ ['capricciosabox'] = { ['pizzabase'] = 1, ['ham'] = 1, ['pizzmushrooms'] = 1, ['olives'] = 1, } },
		{ ['vegetarianabox'] = { ['pizzabase'] = 1, ['mozz'] = 1, ['lettuce'] = 1, ['basil'] = 1, } },
	},
	ChoppingBoard = {
		{ ['salami'] = { ['meat'] = 1, } },
		{ ['ham'] = { ['meat'] = 1, } },
	},
}

Loc = {}