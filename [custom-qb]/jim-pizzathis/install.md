Thank you for your purchase <3 I hope you have fun with this script and that it brings jobs and RP to your server

If you need support I now have a discord available, it helps me keep track of issues and give better support.

https://discord.tebex.store

-------------------------------------------------------------------------------------------------

# Installation

Add the item images to your inventory script
For Example:
	`[qb]` > `qb-inventory` > `html` > `images`

THESE GO IN YOUR SHARED.LUA IN qb-core:

Under the QBShared.Items in items.lua

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
	--WINES
	["amarone"] 					= {["name"] = "amarone",  	    	 		["label"] = "Amarone",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "amarone.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["barbera"] 					= {["name"] = "barbera",  	    			["label"] = "Barbera D'Asti",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "barbera.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["dolceto"] 					= {["name"] = "dolceto",  	    	 		["label"] = "Dolcetto D'Alba",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "dolceto.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["housered"] 					= {["name"] = "housered",  	    	 		["label"] = "House Red Wine",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "housered.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["housewhite"] 					= {["name"] = "housewhite",  	    	 	["label"] = "House White Wine",		 	["weight"] = 100, 		["type"] = "item", 		["image"] = "housewhite.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["rosso"] 						= {["name"] = "rosso",  	    	 		["label"] = "Rosso Del Montalcino",	 	["weight"] = 100, 		["type"] = "item", 		["image"] = "rosso.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	--DESSERTS
	["tiramisu"] 					= {["name"] = "tiramisu",  	    	 		["label"] = "Tiramisu",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "tiramisu.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["gelato"] 						= {["name"] = "gelato",  	    	 		["label"] = "Choc and Vanilla Gelato",	["weight"] = 100, 		["type"] = "item", 		["image"] = "gelato.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["medfruits"] 					= {["name"] = "medfruits",  	    	 	["label"] = "Fresh Fruit Medly",	 	["weight"] = 100, 		["type"] = "item", 		["image"] = "medfruits.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	--PASTA
	["bolognese"] 					= {["name"] = "bolognese",  	    	 	["label"] = "Bolognese",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "bolognese.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["calamari"] 					= {["name"] = "calamari",  	    	 		["label"] = "Calamari Marinara",		["weight"] = 100, 		["type"] = "item", 		["image"] = "calamari.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["meatball"] 					= {["name"] = "meatball",  	    	 		["label"] = "Homemade Meatballs",		["weight"] = 100, 		["type"] = "item", 		["image"] = "meatball.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["alla"] 						= {["name"] = "alla",  	    	 			["label"] = "Alla Vodka",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "alla.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["pescatore"] 					= {["name"] = "pescatore",  	    		["label"] = "Pescatore",			 	["weight"] = 100, 		["type"] = "item", 		["image"] = "pescatore.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	--PIZZA SLICES
	["capricciosa"] 				= {["name"] = "capricciosa",  	    	 	["label"] = "Capriccosa",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "capricciosa.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["diavola"] 					= {["name"] = "diavola",  	    	 		["label"] = "Diavola",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "diavola.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["marinara"] 					= {["name"] = "marinara",  	    	 		["label"] = "Marinara",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "marinara.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["margherita"] 					= {["name"] = "margherita",  	    	 	["label"] = "Margherita",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "margherita.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["prosciuttio"] 				= {["name"] = "prosciuttio",  	    		["label"] = "Prosciuttio E Funghi",		["weight"] = 100, 		["type"] = "item", 		["image"] = "proscuttio.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["vegetariana"] 				= {["name"] = "vegetariana",  	    	 	["label"] = "Vegetariana",				["weight"] = 100, 		["type"] = "item", 		["image"] = "vegetariana.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	--PIZZA BOXES
	["capricciosabox"] 				= {["name"] = "capricciosabox",  	     	["label"] = "Boxed Capriccosa",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["diavolabox"] 					= {["name"] = "diavolabox",  	    		["label"] = "Boxed Diavola",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["marinarabox"] 				= {["name"] = "marinarabox",  	    		["label"] = "Boxed Marinara",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["margheritabox"] 				= {["name"] = "margheritabox",  	     	["label"] = "Boxed Margherita",	 		["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["prosciuttiobox"] 				= {["name"] = "prosciuttiobox",  	    	["label"] = "Boxed Prosciuttio E Funghi",["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["vegetarianabox"] 				= {["name"] = "vegetarianabox",  	     	["label"] = "Boxed Vegetariana",		["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzabox.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	--INGREDIENTS
	["pizzabase"] 					= {["name"] = "pizzabase",  	     		["label"] = "Pizza Base",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "base2.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["pizzadough"] 					= {["name"] = "pizzadough",  	    		["label"] = "Pizza Dough",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "pizzadough.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["mozz"] 						= {["name"] = "mozz",  	    				["label"] = "Mozzeralla",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "mozz.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["sauce"] 						= {["name"] = "sauce",  	   			  	["label"] = "Tomato Sauce",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sauce.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["salami"] 						= {["name"] = "salami",  	    			["label"] = "Salami",					["weight"] = 100, 		["type"] = "item", 		["image"] = "salami.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["ham"] 						= {["name"] = "ham",  	     				["label"] = "Ham",						["weight"] = 100, 		["type"] = "item", 		["image"] = "ham.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["squid"] 						= {["name"] = "squid",  	   			  	["label"] = "Calamari",					["weight"] = 100, 		["type"] = "item", 		["image"] = "squid.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["pizzmushrooms"] 				= {["name"] = "pizzmushrooms",  	     	["label"] = "Mushrooms",				["weight"] = 100, 		["type"] = "item", 		["image"] = "mushrooms.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["olives"] 						= {["name"] = "olives",  	   			  	["label"] = "Olives",					["weight"] = 100, 		["type"] = "item", 		["image"] = "olives.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },
	["basil"] 						= {["name"] = "basil",  	   			  	["label"] = "Basil",					["weight"] = 100, 		["type"] = "item", 		["image"] = "basil.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "", },

	["meat"] 						= {["name"] = "meat",  	     				["label"] = "Meat",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "meat.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A slab of Meat", },
	["pasta"] 						= {["name"] = "pasta",  	     			["label"] = "Bag of Pasta",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "pasta.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "A bag of Pasta", },

	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},


Under the QBShared.Jobs = {

	['pizzathis'] = {
		label = 'Pizza This',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

--------------------------------------------------------------------------------------------------

## qb-management:

	- Update to the latest github version
	- Make sure the job "henhouse" has been added to the database
	- The menu's targets should be accessible to bosses from the clock in spot

-------------------------------------------------------------------------------------------------

## Emotes
Custom emotes currently run through dpemotes, its the easier option and adds extra emotes for you to use :)

These go in your [standalone] > dpemotes > client > AnimationList.lua
At about line 1666, place these under DP.PropEmotes = {

	--Jim-PizzaThis
   ["redwine"] = {"mp_player_intdrink", "loop_bottle", "Red Wine Bottle", AnimationOptions =
   {    Prop = "prop_wine_rose", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["whitewine"] = {"mp_player_intdrink", "loop_bottle", "White Wine Bottle", AnimationOptions =
   {    Prop = "prop_wine_white", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
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
   ["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions =
   {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions =
   {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["pizza"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
   {    Prop = "v_res_tt_pizzaplate", PropBone = 18905, PropPlacement = {0.20, 0.038, 0.051, 15.0, 155.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["bowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions =
   {    Prop = "h4_prop_h4_coke_plasticbowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["pineapple"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
   {    Prop = "prop_pineapple", PropBone = 18905, PropPlacement = {0.10, 0.038, 0.03, 15.0, 50.0},
        EmoteMoving = true, EmoteLoop = true, }},
   ["foodbowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions =
   {    Prop = "prop_cs_bowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.050, 0.0, 0.0, 0.0},
        EmoteMoving = true, EmoteLoop = true, }},

---------------------------------------------------------------------------------------------------

## Jim-Consuambles item setup
- In Jim-Pizzathis `config.lua` set `JimConsumables` to true
- Add the emotes above to Jim-Consumables `config.lua` under the `Emotes = {` section
- Add these lines to Jim-Consumables `config.lua` under the `Consumables = {` section

	--Jim-Pizzathis-Alcohol
	["amarone"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
	["barbera"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
	["dolceto"] = { emote = "whitewine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
	["housered"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
	["housewhite"] = { emote = "whitewine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},
	["rosso"] = { emote = "redwine", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(20, 30), canOD = true }},

	["ambeer"] = { emote = "beer3", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
	["dusche"] = { emote = "beer1", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
	["logger"] = { emote = "beer2", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
	["pisswasser"] = { emote = "beer4", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
	["pisswasser2"] = { emote = "beer5", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},
	["pisswasser3"] = { emote = "beer6", canRun = true,  time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10, 20), canOD = true }},

	--Jim-Pizzathis-Drinks
	["ecola"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
	["ecolalight"] = { emote = "ecola", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
	["sprunk"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},
	["sprunklight"] = { emote = "sprunk", canRun = true, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10, 20), }},

	--Jim-Pizzathis-Food
	["tiramisu"] = { emote = "bowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["gelato"] = { emote = "bowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["medfruits"] = { emote = "pineapple", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},

	["bolognese"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
	["calamari"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
	["meatball"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
	["alla"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
	["pescatore"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},

	["capricciosa"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["diavola"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["marinara"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["margherita"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["prosciuttio"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
	["vegetariana"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},

--------------------------------------------------------------------------------------------------

## Changelog

### v1.6.5
	- Updated install.md
		- Included instructions to make use of Jim-Consuambles if wanted
	- Updated built-in client and server `Hasitem` events to be more accurate
	- Fix missing locales

### v1.6.4:
    - Locale support thanks to Dafke

### v1.6.3:
    - Workaround for the `HasItem()` allowing crafting when items aren't there

### v1.6.2:
	- Made the `HasItem` functions built in, so no edits to core needed
		- This allows optimizations + makes crafting menus open/load much faster
	- Fix doubled item box when getting a "prize"
	- Add item duping protection to item crafting

### v1.6.1:
	- DUI Fixes, now shows correctly for players who weren't nearby when changed
	- QBCore item changes and fixes
	- Greatly utilised custom lookEnt() function to have player face towards interaction point

### v1.6:
	- New shared file that handles all the functions
	- Fix incorrect label in item debug
	- Optimized and improved chair code
	- Optimized loading of props
		- Stupid clock-in board prop will give up trying to load after a timeout
		- If it's not there, use laptop on table

### v1.5.1:
	- Improved DUI loading
		- Should now show correctly after loading in
	- Added support for ps-progressbar

### v1.5:
	- Improved Checkmark issues causing script to break when crafting
		- This is a toggle in the config, if it causes issues(like lag) disable it
	- Added Support for Jim-Shops
	- Added support for new qb-menu icons - update qb-menu to see these
	- Added Job Garages for deliveries
	- QoL fixes
		- Improved and optimized loading of targets and props
	- Upgraded Crafting systems to be more optimised and use crafting recipes
	- Added simple support for Toys/Prizes
	- Changed Wine racks into a shop
	- Added ability to open BossMenu at target locations in "Office" and "CEO"
	- Added the ability to change Logo's and Menus textures through target locations and qb-input
		- Add custom url's in duiserver.lua for when the server/script starts, these are automatically loaded
		- Change images on the fly with targets and custom url's
		- Job lock and grade lock so it has less chance to be abused
		- Added ability to ban certain words and phrases
		- Ability to "reset" to the default in the duiserver.lua
		- Ability to clear back to ingame textures
		- Anything with an image extention works eg. png, gif, jpeg...
		- I'm learning this new system, as always let me know if there's any issues with it

### v1.4:
	- Optimizations all over
		- Now uses polyzone for auto clockout
		- Chairs are optimized and detect players already sitting
		- Runs at 0.0ms idle
	- Logo now shows up in jim-payments when charging
	- Upped distance on the chairs so you can reach the booth chairs easier

### v1.3:
	- Payment systems removed/changed in favour of support for my free payment script jim-payments: https://github.com/jimathy/jim-payments#
		- Add this script to your server and payment systems will work as normal with extra features
		- This change removes events from client.lua and server.lua
	- Added item checkmarks to qb-menu's to show if you have the required items or not
		- This adds changes to client.lua
	- QoL Fixes

### v1.2:
	- Added Tables stashes for food to be placed on the tables
	- Fixed clockin prop not loading correctly for some people. (hopefully)

### v1.1:
- Bugfixes -
    - Forgot to add dessert and soda items to shops config
    - Fixed..many..mispellings of prosciuttio
    - Fixed counters being shared with my vu script's counters
    - ecoladiet.png was named wrong, its supposed to be ecolalight
    - Added clockin at laptop outside the locker room until I work out prop issues people are having