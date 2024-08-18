Config = {
	Lan = "en",
	Debug = false, -- Toggle Debug Mode
	Blips = true, -- Enable Blips?
	BlipNamer = false, -- Enable to Name Blips different things, disable if you already have too many blips as this will group them together
	Pedspawn = true, -- Do you want to spawn peds for main locations?
	img = "qb-inventory/html/images/", -- Set this to your inventory
	JimMenu = false, -- If using updated qb-menu icons, set this true
	JobRole = "recycle", -- Whats the job role you want to use this? "nil" for none
	EnableOpeningHours = true, -- Enable opening hours? If disabled you can always open the pawnshop.
	OpenHour = 9, -- From what hour should the pawnshop be open?
	CloseHour = 21, -- From what hour should the pawnshop be closed?
	PayAtDoor = nil, -- Set to nil stop turn this off, set to a number to enable
	DumpsterStash = true ,-- Set to true if you want to turn on the dumpster stashes

	Minigame = "ps-ui", -- Enable minigame when searching. qb-skillbar/qb-lock/ps-ui

	OutsideTele = vector4(746.75518798828, -1399.5516357422, 26.609373092651, 180.86077880859),
	InsideTele = vector4(736.95355224609, -1374.2559814453, 12.635090827942, 266.58343505859),

	Locations =  {
		['Recycle'] = {
			{ name = "Recycle Center", coords = vector4(744.68, -1401.77, 26.55, 248.73), blipTrue = true, sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
		['Trade'] ={
			{ name = "Recyclable Trader", coords = vector4(742.36309814453, -1373.9674072266, 12.631042480469, 234.4), blipTrue = false, sprite = 365, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
		['BottleBanks'] = {
			{ name = "Bottle Bank", coords = vector4(757.06, -1399.68, 26.57 , 178.1), blipTrue = true, sprite = 642, col = 2, model = `G_M_M_ChemWork_01`, scenario = "WORLD_HUMAN_CLIPBOARD", },
		},
	},
	Prices = {
		['copper'] = 10,
		['plastic'] = 10,
		['metalscrap'] = 10,
		['steel'] = 10,
		['glass'] = 10,
		['iron'] = 10,
		['rubber'] = 10,
		['aluminum'] = 10,
		['bottle'] = 5,
		['can'] = 5,
	},
	TradeTable = {
		"copper",
		"plastic",
		"metalscrap",
		"steel",
		"glass",
		"iron",
		"rubber",
		"aluminum",
		"bottle",
		"can",
	},
	DumpItems = {
		"bottle",
		"can",
		"sandwich",
	},
	ScrapItems = {
		"steel",
		"copper",
		"iron",
		"glass",
		"bottle",
		"can",
	},
	RecycleAmounts = {
		recycleMin = 10,
		recycleMax = 25,

		tenMin = 2,
		tenMax = 5,

		hundMin = 5,
		hundMax = 14,

		thouMin = 10,
		thouMax = 28,
	}
}

Loc = {}
