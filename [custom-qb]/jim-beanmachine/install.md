Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

-------------------------------------------------------------------------------------------------

# INSTALLATION

Check the `Config.lua` for the settings you need to change

To enable or disable a location, toggle `zoneEnable` in their Locations table

## Inventory Images
Add the item images to your inventory script

`[qb]` > `qb-inventory` > `html` > `images`

## Items.lua

Under the QBShared.Items = {

	--Jim-BeanMachine
	["beancoffee"] 					= {["name"] = "beancoffee",  	    		["label"] = "Coffe Beans",				["weight"] = 100, 		["type"] = "item", 		["image"] = "beancoffee.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["beandonut"] 					= {["name"] = "beandonut",  	    		["label"] = "Donut",					["weight"] = 100, 		["type"] = "item", 		["image"] = "popdonut.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["rhinohorn"] 					= {["name"] = "rhinohorn",  	    		["label"] = "Rhino Horn",				["weight"] = 100, 		["type"] = "item", 		["image"] = "rhinohorn.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["oystershell"] 				= {["name"] = "oystershell",  	    		["label"] = "Oyster Shell",				["weight"] = 100, 		["type"] = "item", 		["image"] = "oyster.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "" },
	["watermelon"] 					= {["name"] = "watermelon",  	    		["label"] = "WaterMelon Slice",			["weight"] = 100, 		["type"] = "item", 		["image"] = "watermelon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30), ['thirst'] = math.random(20, 30) },

	["bigfruit"] 					= {["name"] = "bigfruit",  	    	 		["label"] = "The Big Fruit",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "bigfruit.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["highnoon"] 					= {["name"] = "highnoon",  	    	 		["label"] = "Highnoon",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "highnoon.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["speedball"] 					= {["name"] = "speedball",  	    	 	["label"] = "The SpeedBall",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "speedball.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["gunkaccino"] 					= {["name"] = "gunkaccino",  	    	 	["label"] = "The Gunkaccino",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "gunkaccino.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["bratte"] 						= {["name"] = "bratte",  	    	 		["label"] = "The Bratte",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "bratte.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["flusher"] 					= {["name"] = "flusher",  	    	 		["label"] = "The Flusher",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "flusher.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecocoffee"] 					= {["name"] = "ecocoffee",  	    	 	["label"] = "The Eco-ffee",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecoffee.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["caffeagra"] 					= {["name"] = "caffeagra",  	    	 	["label"] = "Caffeagra",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "caffeagra.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(10, 20) },
	["cheesecake"] 					= {["name"] = "cheesecake",  	    		["label"] = "Cheese Cake",				["weight"] = 100, 		["type"] = "item", 		["image"] = "cheesecake.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["sugar"] 						= {["name"] = "sugar",  			     	["label"] = "Sugar",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(10, 20) },
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["milk"] 						= {["name"] = "milk",						["label"] = "Milk",						["weight"] = 300,		["type"] = "item",		["image"] = "burger-milk.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Carton of Milk", ['thirst'] = math.random(10, 20) },
	["chickenbreast"] 				= {["name"] = "chickenbreast",  	    	["label"] = "Chicken Breast",			["weight"] = 100, 		["type"] = "item", 		["image"] = "chickenbreast.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(10, 20) },

	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

## Jobs
Under the QBShared.Jobs = {

	['beanmachine'] = {
		label = 'Bean Machine',
		defaultDuty = true,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},


## Payment Systems
The payment system that is being used is my free script, jim-payments

This system supports receipts being handed out to wokers who are clocked in and working
They can then trade this in at the bank for rewards

Grab it at: https://github.com/jimathy/jim-payments

# qb-management:

	Update to the latest github version
	Make sure the job "beanmachine" has been added to the database
	The menu's targets should be accessible to bosses at clockin areas

## Emotes
Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {


	["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
	{ Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
	["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
	{ Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
	["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Crisps", AnimationOptions =
	{ Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["bmcoffee1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee2", AnimationOptions =
	{ Prop = 'prop_fib_coffee', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["bmcoffee2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions =
	{ Prop = 'ng_proc_coffee_01a', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["bmcoffee3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions =
	{ Prop = 'v_club_vu_coffeecup', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0},
	   EmoteLoop = true, EmoteMoving = true, }},
	["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions =
	{ Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    ["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions =
    { Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
       EmoteMoving = true, EmoteLoop = true, }},

--------------------------------------------------------------------------------------------------

## Jim-Consumables item setup - (Optional) - (https://github.com/jimathy/jim-consumables)
- Support for new `Jim-Consumables` automated adding of items and emotes
- Start `jim-consumables` BEFORE this script and set `Config.JimConsumables` to `true` for it to work
- In Jim-Beanmachine's `config.lua` set `JimConsumables` to true
- Restart/Ensure Jim-Beanmachine

- Restart Jim-Consumables

--------------------------------------------------------------------------------------------------

## Changelog

### v1.4.4:
	- Add "Multi-Craft" option in the config.lua
	- Split-Stack item exploit fix
	- Optional: Support for new `Jim-Consumables` automated item adding events
		- (Start `jim-consumables` BEFORE this script and set `Config.JimConsumables` to `true` for it to work)
		- (https://github.com/jimathy/jim-consumables)
	- Change/Add support for creating jobGarages in (https://github.com/jimathy/jim-jobgarage)

### v1.4.3
	- Added image icons to ox_lib menus
	- Added Version Update check

### v1.4.2
	- Improved `OX_Lib` Context support (better layout for ingredients)
	- Improved `OX_Inv` support
	- Added `OX_Lib` Progressbar suppport
	- *Basic* `OX_Lib` notification support (Set `Config.Notify = "ox"`)
	- Improved script stopping/restarting events
	- Added more options to blip creation
	- Locale fixes
	- Updated shared functions to give more info and be more optimized
	- Merged built-in eating events into one optimized event
	- Fix emote references for jim-consumables and built in events ("bmcoffee1" not "bmcoffee")

### v1.4.1
	- Add support for OX Lib's Context menu
	- Updated emote code in built-in consumable events

### v1.4
	- Support for changing Core name
	- Support added for OX_Target
	- Support added for OX_Inventory
	- Added autoClock variable to locations config
		- This helps define if leaving or entering the zone clocks in or out

### v1.3.4
	- Updated install.md
        - Included instructions to make use of Jim-Consuambles if wanted
	- Add de.lua locale
	- Updated built-in client and server Hasitem events to be more accurate
	- Support for different job roles at each location
	- Fix for built in job garages letting anyone grab a vehicle

### v1.3.3
	- Locale support thanks to Dafke

### v1.3.2
    - Workaround for the `HasItem()` allowing crafting when items aren't there

### v1.3.1
	- Made the `HasItem` functions built in, so no edits to core needed
		- This allows optimizations + makes crafting menus open/load much faster
	- Add item duping protection to item crafting

### v1.3
	- New Location supported, the free MLO - https://www.gta5-mods.com/maps/mlo-bean-machine-fivem-sp
	- Rewrote the locations and how they are handled in the client to allow easier additions of new locations
	- Rewrote the chair code to be more optimzed and handle multiple locations better
	- Rewrote the garage.lua to support new functions
	- Added shared function file to optimize code and improve loading of props and blips
	- Made use of new custom lookEnt() event to make player look towards points of interactions.

### v1.2.1
	- Added support ps-progressbar

### v1.2
	- Added Support for Crafting CheckMarks
		- This is a toggle in the config, if it causes issues(like lag) disable it
	- Added Support for Jim-Shops
	- Added Support for new qb-menu icons
	- Added Job Garages for deliveries to both default locations
	- QoL fixes
		- Improved and optimized loading of targets and props
	- UncleJust changes
		- Slushie machine prop now added to separate the Soda's and Slushie targets
		- Added Prepared Food Stash to the fridge
	- Gabz Changes
		- Added Prepared Food Stash to the Donut Counter
	- Upgraded Crafting systems to be more optimised
	- Changed "Donut" menu to be a shop instead of just grabbing them
	- Added simple support for Toys/Prizes
	- BossMenu is now accessible from the same areas as clock in targets

### v1.1.1
	- Fixed typo breaking coffee menu
	- Fixed type making "crisps" unusable

### v1.1
	- Fix for item check callback
	- Added support for grabbing images from inventory script
		- You need to set your inventory image folder link in the config if not using qb-inventory

### v1.0.2
	- Added config option for zones
		- zoneEable, enables or disables the chosen zone and its map blip
	- Added Debug messages to server.lua
		- helps..debug..any issues with the script
	- Missed chocolate completely from the list
		- Even the item check in client.lua was missing it.
	- Added more Custom Emotes
		- Didn't know there were acutal extra BM Coffee Props