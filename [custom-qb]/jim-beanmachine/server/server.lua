local QBCore = exports[Config.Core]:GetCoreObject()

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	for k, v in pairs(Crafting) do for i = 1, #v do
			for l, b in pairs(v[i]) do if not QBCore.Shared.Items[l] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..l.."'") end
				for j, c in pairs(b) do if not QBCore.Shared.Items[j] then print("Crafting: Missing Item from QBCore.Shared.Items: '"..j.."'") end end end end end
	for i = 1, #Config.FoodItems.items do
		if not QBCore.Shared.Items[Config.FoodItems.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.FoodItems.items[i].name.."'") end
	end
	for i = 1, #Config.DesertItems.items do
		if not QBCore.Shared.Items[Config.DesertItems.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.DesertItems.items[i].name.."'") end
	end
	for i = 1, #Config.SodaItems.items do
		if not QBCore.Shared.Items[Config.SodaItems.items[i].name] then print("Store: Missing Item from QBCore.Shared.Items: '"..Config.SodaItems.items[i].name.."'") end
	end
	for k, v in pairs(Config.Locations) do
		if not QBCore.Shared.Jobs[v.job] then print("Error: Job role not found - '"..v.job.."'") end
		if v.garage then
			TriggerEvent("jim-jobgarage:server:syncAddLocations", { job = v.job, garage = v.garage }) -- Job Garage creation
		end
	end
end)

if not Config.JimConsumables then
	CreateThread(function()
		local drinks = { "bigfruit", "highnoon", "speedball", "gunkaccino", "bratte", "flusher", "ecocoffee", "caffeagra", "ecola", "ecolalight", "sprunk", "sprunklight" }
		for k,v in pairs(drinks) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-beanmachine:client:Consume', source, item.name, "drink") end) end

		local food = { "cheesecake", "watermelon", "beandonut", "chocolate", "crisps", }
		for k,v in pairs(food) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('jim-beanmachine:client:Consume', source, item.name, "food") end) end
	end)
else
	local foodTable = {
		["bigfruit"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["highnoon"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["speedball"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["gunkaccino"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["bratte"] = { emote = "bmcoffee1", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["flusher"] = { emote = "bmcoffee2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["ecocoffee"] = { emote = "bmcoffee", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["caffeagra"] = { emote = "bmcoffee3", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 30), }},
		["cheesecake"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
		["watermelon"] = { emote = "sandwich", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), thirst = math.random(20, 30) }},
		["beandonut"] = { emote = "donut2", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
		["chocolate"] = { emote = "egobar", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10, 20), }},
		["crisps"] = { emote = "crisps", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 30), }},
		["ecola"] = { emote = "ecola", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["ecolalight"] = { emote = "ecola", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["sprunk"] = { emote = "sprunk", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
		["sprunklight"] = { emote = "sprunk", canRun = false, time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20,30), }},
	}
	local emoteTable = {
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Crisps", AnimationOptions = { Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee2", AnimationOptions = { Prop = 'prop_fib_coffee', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions = { Prop = 'ng_proc_coffee_01a', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["bmcoffee3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee3", AnimationOptions = { Prop = 'v_club_vu_coffeecup', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.06, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions = { Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions = { Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0}, EmoteMoving = true, EmoteLoop = true, }},
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions = { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
	}
	for k, v in pairs(foodTable) do TriggerEvent("jim-consumables:server:syncAddItem", k, v) end
	for k, v in pairs(emoteTable) do TriggerEvent("jim-consumables:server:syncAddEmote", k, v) end
end

---Crafting
RegisterServerEvent('jim-beanmachine:Crafting:GetItem', function(ItemMake, craftable)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	--This grabs the table from client and removes the item requirements
	local amount = craftable["amount"] or 1
	if craftable then
		--if craftable["amount"] then amount = craftable["amount"] end
		for k, v in pairs(craftable[ItemMake]) do TriggerEvent("jim-beanmachine:server:toggleItem", false, tostring(k), v, src) end
	end
	--This should give the item, while the rest removes the requirements
	TriggerEvent("jim-beanmachine:server:toggleItem", true, ItemMake, amount, src)
end)

local function dupeWarn(src, item)
	local P = QBCore.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	-- if not Config.Debug then DropPlayer(src, "^1Kicked for attempting to duplicate items") end
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end

RegisterNetEvent('jim-beanmachine:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	local Player = QBCore.Functions.GetPlayer(src)
	local remamount = (amount or 1)
	if give == 0 or give == false then
		if HasItem(src, item, amount or 1) then -- check if you still have the item
			while remamount > 0 do if Player.Functions.RemoveItem(item, 1) then end remamount -= 1 end
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount or 1)
			if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		else dupeWarn(src, item) end -- if not boot the player
	else
		if Player.Functions.AddItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount or 1)
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..QBCore.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		end
	end
end)

if Config.Inv == "ox" then
	--Unclejust--
	exports.ox_inventory:RegisterStash("beanmachine_UCounter", "Beanmachine Counter", 20, 400000)
	exports.ox_inventory:RegisterStash("beanmachine_UStash", "Beanmachine Stash", 20, 400000)
	exports.ox_inventory:RegisterShop("UBeanFridge", { name = Config.FoodItems.label, inventory = Config.FoodItems.items })
	exports.ox_inventory:RegisterShop("UBeanSoda", { name = Config.SodaItems.label, inventory = Config.SodaItems.items })
	exports.ox_inventory:RegisterShop("UBeanDonut", { name = Config.DesertItems.label, inventory = Config.DesertItems.items })
	--Gabz--
	exports.ox_inventory:RegisterStash("beanmachine_Counter", "Beanmachine Counter", 20, 400000)
	exports.ox_inventory:RegisterStash("beanmachine_Counter2", "Beanmachine Counter 2", 20, 400000)
	exports.ox_inventory:RegisterStash("beanmachine_LegionStash", "Beanmachine Legion Stash", 20, 400000)
	exports.ox_inventory:RegisterShop("BeanFridge", { name = Config.FoodItems.label, inventory = Config.FoodItems.items})
	exports.ox_inventory:RegisterShop("BeanFridge2", { name = Config.FoodItems.label, inventory = Config.FoodItems.items})
	exports.ox_inventory:RegisterShop("BeanSoda", { name = Config.SodaItems.label, inventory = Config.SodaItems.items})
	exports.ox_inventory:RegisterShop("BeanDonut", { name = Config.DesertItems.label, inventory = Config.DesertItems.items})
	--flx--
	exports.ox_inventory:RegisterStash("beanmachine_flxCounter", "Beanmachine Counter", 20, 400000)
	exports.ox_inventory:RegisterStash("beanmachine_flxStash", "Beanmachine Stash", 20, 400000)
	exports.ox_inventory:RegisterShop("flxBeanFridge", { name = Config.FoodItems.label, inventory = Config.FoodItems.items })
	exports.ox_inventory:RegisterShop("flxBeanSoda", { name = Config.SodaItems.label, inventory = Config.SodaItems.items })
	exports.ox_inventory:RegisterShop("flxBeanDonut", { name = Config.DesertItems.label, inventory = Config.DesertItems.items })
	function HasItem(src, items, amount)
		local count = exports.ox_inventory:Search(src, 'count', items)
		if exports.ox_inventory:Search(src, 'count', items) >= (amount or 1) then if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^5FOUND^7 x^3"..count.."^7 ^3"..tostring(items)) end return true
        else if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^1NOT FOUND^7") end return false end
	end
else
	function HasItem(source, items, amount)
		local amount, count = amount or 1, 0
		local Player = QBCore.Functions.GetPlayer(source)
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end
		for _, itemData in pairs(Player.PlayerData.items) do
			if itemData and (itemData.name == items) then
				if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).."^7' ^2Slot^7: ^3"..itemData.slot.." ^7x(^3"..tostring(itemData.amount).."^7)") end
				count += itemData.amount
			end
		end
		if count >= amount then if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^5FOUND^7 x^3"..count.."^7") end return true end
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Items ^1NOT FOUND^7") end	return false
	end
end

local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/jimathy/UpdateVersions/master/jim-beanmachine.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion) end
		print(advice)
	end)
end
CheckVersion()