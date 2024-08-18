print("^2Jim^7-^2Tequilala ^7v^41^7.^46^7.^43 ^7- ^2Tequi-la-la Job Script by Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Lan = "en",
	Debug = false, -- false to remove green boxes
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	JimShop = false, -- Enable this to use jim-shops for buying ingredients
	CheckMarks = true, -- If true this will show the player if they have the correct items to be able to craft the items

	useDLC = true, -- enable to use 'The Contract' DLC Stage instrument replacements

	Locations = {
		{
			zoneEnable = true,
			job = "tequilala",
			label = "Tequi-la-la",
			zones = {
				vector2(-570.06134033203, 268.52590942383),
				vector2(-542.37615966797, 266.3408203125),
				vector2(-540.90472412109, 302.59301757812),
				vector2(-583.25329589844, 298.62518310547)
			},
			blip = vector3(-556.89, 285.47, 82.17),
			blipcolor = 1,
			--Custom DJ Booth Stuff
			Booth = {
				enableBooth = false, -- Set false if using external DJ/Music stuff.
				DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
				radius = 30, -- The radius of the sound from the booth
				coords = vector3(-549.68, 282.64, 82.98), -- Where the booth is located
				playing = false,
			},
		},
	},
	MLO = "base",	-- Set to "base" if you use Base Game interior
					-- Set to "hass" if you use Hassarics MLO
	DrinkItems = {
		label = "Drinks Store",
		slots = 17,
		items = {
			{ name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "schnapps", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "scotch", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "icream", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "curaco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 17, },
		},
	},
}
Crafting = {
	Cocktails = {
		{ ['b52'] = { ['coffee'] = 1,	['icream'] = 1,	['orange'] = 1,	} },
		{ ['brussian'] = { ['coffee'] = 1, ['vodka'] = 1, } },
		{ ['bkamikaze'] = { ['curaco'] = 1, ['lime'] = 1, ['vodka'] = 1, } },
		{ ['cappucc'] = { ['coffee'] = 1,	['chocolate'] = 1,	} },
		{ ['ccookie'] = { ['amaretto'] = 1, ['cranberry'] = 1, } },
		{ ['iflag'] = { ['icream'] = 1, ['orange'] = 1, } },
		{ ['kamikaze'] = { ['vodka'] = 1, ['orange'] = 1, ['lime'] = 1, } },
		{ ['sbullet'] = { ['gin'] = 1, ['lime'] = 1, ['scotch'] = 1, } },
		{ ['voodoo'] = { ['coffee'] = 1, ['rum'] = 1, } },
		{ ['woowoo'] = { ['cranberry'] = 1, ['schnapps'] = 1, ['vodka'] = 1, } },
	},
	Beer = {
		{ ['ambeer'] = {} },
		{ ['dusche'] = {} },
		{ ['logger'] = {} },
		{ ['pisswasser'] = {} },
		{ ['pisswasser2'] = {} },
		{ ['pisswasser3'] = {} },
	},
}

Loc = {}