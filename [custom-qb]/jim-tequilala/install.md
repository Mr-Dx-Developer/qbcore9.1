Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.gg/xKgQZ6wZvS

Update v1.6.3:
	- Locale support thanks to Dafke

Update v1.6.2:
    - Workaround for the HasItem() allowing crafting when items aren't there

Update v1.6.1:
	- QoL changes to the code
	- Add item duping protection to item crafting

Update v1.6:
	- Add built in native "HasItem" event to help optimize the crafting
	- Change to server side item removal events

Update v1.5:
	- Fixed warning print demanding the wrong job
	- New shared file that handles all the functions
	- Optimized and improved chair code
	- Optimized loading of props
	- Built in DJ Booth Fixes
	- Updated debug prints

Update v1.4:
	- Improved Checkmark issues causing script to break when crafting
		- This is a toggle in the config, if it causes issues(like lag) disable it
	- Added Support for Jim-Shops
	- Added support for new qb-menu icons
	- QoL fixes
		- Improved and optimized loading of targets and props
	- Upgraded Crafting systems to be more optimised
	- Added qb-management bossmenu target location
	- Moved Clock in from board to laptop on bottom bar
		- This should stop issues with board prop not loading
	- Change emotes in the install.md that require the contract dlc
	- Added built-in custom DJ Booth to the stage
		- Target the closest amp to the drum kit
		- You can disable this easily in the config
		- Requires xSound - https://github.com/Xogy/xsound

Update v1.3:
	- Big rewrite, if you don't notice a change then I've done a good job
		- More optimized using improved coding

Update v1.2.2:
	- Fixed alcohol not giving effect

Update v1.2:
	- Added useDLC config option to enable prop replacements using DLC props
	- Optimization Update
		- Now runs at 0.00ms idle

Update v1.1:
	- Payment systems removed/changed in favour of support for my free payment script jim-payments: https://github.com/jimathy/jim-payments#
		- Add this script to your server and payment systems will work as normal with extra features
		- This change removes events from client.lua and server.lua
	- Added item checkmarks to qb-menu's to show if you have the required items or not
		- This adds changes to client.lua
	- QoL Fixes

-------------------------------------------------------------------------------------------------

INSTALLATION

Add the item images to your inventory script

[qb] > qb-inventory > html > images

-------------------------------------------------------------------------------------------------

THESE GO IN YOUR SHARED.LUA IN qb-core:

THIS USES ITEMS FROM VANILLAUNICORN PIZZATHIS AND HENHOUSE, DOUBLE CHECK YOU DON'T HAVE THEM ALREADY

Under the QBShared.Items = {
	--Cocktails
	["b52"] 		 				= {["name"] = "b52",  	     				["label"] = "B-52",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "b52.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "B-52 Cocktail", ['thirst'] = math.random(20, 30) },
	["brussian"] 		 			= {["name"] = "brussian",  	     			["label"] = "Black Russian",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "brussian.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Black Russian Cocktail", ['thirst'] = math.random(20, 30) },
	["bkamikaze"] 				 	= {["name"] = "bkamikaze",  	     		["label"] = "Blue Kamikaze",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "bkamikaze.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Blue Kamikaze Cocktail", ['thirst'] = math.random(20, 30) },
	["cappucc"] 				 	= {["name"] = "cappucc",  	     			["label"] = "Cappuccinotini",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cappucc.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cappuccinotini Cocktail", ['thirst'] = math.random(20, 30) },
	["ccookie"] 				 	= {["name"] = "ccookie",  	     			["label"] = "Cranberry Cookie",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "ccookie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cranberry Cookie Cocktail", ['thirst'] = math.random(20, 30) },
	["iflag"] 				 		= {["name"] = "iflag",  	     			["label"] = "Irish Flag",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "iflag.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Irish Flag Cocktail", ['thirst'] = math.random(20, 30) },
	["kamikaze"] 				 	= {["name"] = "kamikaze",  	     			["label"] = "Kamikaze",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "kamikaze.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Kamikase Cocktail", ['thirst'] = math.random(20, 30) },
	["sbullet"] 		 			= {["name"] = "sbullet",  	     			["label"] = "Silver Bullet",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "sbullet.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Silver Bullet Cocktail", ['thirst'] = math.random(20, 30) },
	["voodoo"] 		 				= {["name"] = "voodoo",  	     			["label"] = "Voodoo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "voodoo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Voodoo Cocktail", ['thirst'] = math.random(20, 30) },
	["woowoo"] 		 				= {["name"] = "woowoo",  	     			["label"] = "Woo Woo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "woowoo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Woowoo Cocktail", ['thirst'] = math.random(20, 30) },

	--Drink Ingredients
	["orange"] 				 		= {["name"] = "orange",  	     			["label"] = "Orange",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "orange.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "An Orange." },
	["lime"] 				 		= {["name"] = "lime",  	     				["label"] = "Lime",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "lime.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A Lime." },
	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Chocolate Bar", ['hunger'] = math.random(20, 30) },

	["cranberry"] 				 	= {["name"] = "cranberry",  	     		["label"] = "Cranberry Juice",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "cranberry.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Cranberry Juice", ['thirst'] = math.random(20, 30) },
	["schnapps"] 				 	= {["name"] = "schnapps",  	     			["label"] = "Peach Schnapps",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "schnapps.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Peach Schnapps", ['thirst'] = math.random(20, 30) },
	["gin"] 					 	= {["name"] = "gin",  	     				["label"] = "Gin",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "gin.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Gin", ['thirst'] = math.random(20, 30) },
	["scotch"] 					 	= {["name"] = "scotch",  	     			["label"] = "Scotch",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "scotch.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Scotch", ['thirst'] = math.random(20, 30) },
	["rum"] 					 	= {["name"] = "rum",  	     				["label"] = "Rum",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "rum.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Rum", ['thirst'] = math.random(20, 30) },
	["icream"] 					 	= {["name"] = "icream",  	     			["label"] = "Irish Cream",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "icream.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Irish Cream Liquer", ['thirst'] = math.random(20, 30) },
	["amaretto"] 					= {["name"] = "amaretto",  	     			["label"] = "Amaretto",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "amaretto.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Amaretto", ['thirst'] = math.random(20, 30) },
	["curaco"] 						= {["name"] = "curaco",  	     			["label"] = "Curaco",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "curaco.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "A bottle of Curaco", ['thirst'] = math.random(20, 30) },

	--BEERS
	["ambeer"] 						= {["name"] = "ambeer",  	    	 		["label"] = "AM Beer",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ambeer.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["dusche"] 						= {["name"] = "dusche",  	    	 		["label"] = "Dusche Gold",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "dusche.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["logger"] 						= {["name"] = "logger",  	    	 		["label"] = "Logger Beer",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "logger.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser"] 					= {["name"] = "pisswasser",  	    	 	["label"] = "Pißwasser",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser1.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser2"] 				= {["name"] = "pisswasser2",  	    	 	["label"] = "Pißwasser Stout",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser2.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["pisswasser3"] 				= {["name"] = "pisswasser3",  	    	 	["label"] = "Pißwasser Pale Ale",		["weight"] = 100, 		["type"] = "item", 		["image"] = "pisswaser3.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },

	--SODA
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

	["crisps"] 						= {["name"] = "crisps",  	    			["label"] = "Crisps",					["weight"] = 100, 		["type"] = "item", 		["image"] = "chips.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },


Under the QBShared.Jobs = {

	['tequilala'] = {
		label = 'Tequilala',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},


-------------------------------------------------------------------------------------------------

Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)
THESE REQUIRE THE LATEST DLC

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {

	--Jim-Tequilala
	["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
	{    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
		EmoteMoving = true, EmoteLoop = true }},
	["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
	{    Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
	["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
	{    Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
	["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
	{    Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
	["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
	{   Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},


   ["guitarelectric3"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 3", AnimationOptions =
   {   Prop = 'prop_el_guitar_02', PropBone = 24818, PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true, EmoteLoop = true }},
   ["guitarelectric4"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 4", AnimationOptions =
   {   Prop = 'vw_prop_casino_art_guitar_01a', PropBone = 24818, PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true, EmoteLoop = true }},
   ["guitarelectric5"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitar Electric 5", AnimationOptions =
   {   Prop = 'sf_prop_sf_el_guitar_02a', PropBone = 24818, PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
       EmoteMoving = true, EmoteLoop = true }},

   ["drummer"] = {"anim@scripted@freemode_npc@fix_astu_prod_drums@", "art_ig2_drums_p1", "Drummer", AnimationOptions =
   {
       Prop = 'sf_prop_sf_drum_stick_01a',
       PropBone = 60309,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
       SecondProp = 'sf_prop_sf_drum_stick_01a',
       SecondPropBone = 28422,
       SecondPropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	   EmoteMoving = false,
       EmoteLoop = true
   }},
   ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
   {   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
       EmoteLoop = true, EmoteMoving = true, }},
   ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
   {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
   {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
   {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
   {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
   {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
   {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
   {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
   {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},


---------------------------------------------------------------------------------------------------


Within the config.lua of qb-bossmenu
This adds the boss menu location to the laptop on the bottom floor bar (there isn't any kind of office)

	['tequilala'] = vector3(-561.27, 289.53, 82.18),