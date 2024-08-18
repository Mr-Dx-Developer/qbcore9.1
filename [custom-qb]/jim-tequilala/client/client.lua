local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

PlayerJob = {}
local Targets = {}
local Props = {}
local Blips = {}
local onDuty = false
local alcoholCount = 0

local function jobCheck()
	canDo = true
	if not onDuty then TriggerEvent('QBCore:Notify', Loc[Config.Lan].error["not_clocked_in"], 'error') canDo = false end
	return canDo
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then if PlayerData.job.name == "tequilala" then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(r)
	if GetCurrentResourceName() == r then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			if PlayerData.job.name == "tequilala" then onDuty = PlayerJob.onduty end
		end)
	end
end)

CreateThread(function()
	local bossroles = {}
	for grade in pairs(QBCore.Shared.Jobs["tequilala"].grades) do
		if QBCore.Shared.Jobs["tequilala"].grades[grade].isboss == true then
			if bossroles["tequilala"] then
				if bossroles["tequilala"] > tonumber(grade) then bossroles["tequilala"] = tonumber(grade) end
			else bossroles["tequilala"] = tonumber(grade) end
		end
	end
	for _, v in pairs(Config.Locations) do
		if v.zoneEnable then
			JobLocation = PolyZone:Create(v.zones, { name = v.label, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside) if not isPointInside and onDuty and PlayerJob.name == "tequilala" then TriggerServerEvent("QBCore:ToggleDuty") end end)

			Blips[#Blips+1] = makeBlip({coords = v.blip, sprite = 79, col = v.blipcolor, scale = 0.7, disp = 6, name = v.label})

		end
	end

	if not Props["cocktails"] then Props["cocktails"] = makeProp({prop = `v_res_mchopboard`, coords = vector4(-562.81, 288.66, 82.18+1.1, -270.0)}, 1, 0) end
	if not Props["cocktails2"] then Props["cocktails2"] = makeProp({prop = `v_res_mchopboard`, coords = vector4(-566.03, 287.47, 85.38+1.1, -270.0)}, 1, 0) end
	if not Props["coffee"] then Props["coffee"] = makeProp({prop = `prop_coffee_mac_02`, coords = vector4(-562.76, 289.95, 82.18+1.1, -300.0)}, 1, 0) end
	if not Props["coffee2"] then Props["coffee2"] = makeProp({prop = `prop_coffee_mac_02`, coords = vector4(-566.02, 288.01, 85.38+1.1, -300.0)}, 1, 0) end
	if not Props["laptop"] then Props["laptop"] = makeProp({prop = `prop_laptop_01a`, coords = vector4(-560.62, 289.25, 82.18+1.12, -75.0)}, 1, 0) end

	if Config.MLO == "base" and Config.useDLC == true then
		if not Props["drums"] then Props["drums"] = makeProp({prop = `sf_prop_sf_drum_kit_01a`, coords = vector4(-550.89, 284.21, 82.98, -75.0)}, 1, 0) end
		if not Props["mic"] then Props["mic"] = makeProp({prop = `v_ilev_fos_mic`, coords = vector4(-551.78, 286.25, 82.98, -75.0)}, 1, 0) end
		if not Props["mic2"] then Props["mic2"] = makeProp({prop = `v_ilev_fos_mic`, coords = vector4(-552.05, 282.87, 82.98, -75.0)}, 1, 0) end
		if not Props["gcase"] then Props["gcase"] = makeProp({prop = `sf_prop_sf_guitar_case_01a`, coords = vector4(-550.35, 287.01, 82.98, -0.0)}, 1, 0) end
		if not Props["gcase2"] then Props["gcase2"] = makeProp({prop = `sf_prop_sf_guitar_case_01a`, coords = vector4(-550.82, 281.7, 82.98, -180.0)}, 1, 0) end
		CreateModelHide(vector3(-549.85, 284.39, 82.98), 1.5, -1682380775, true)
		CreateModelHide(vector3(-552.55, 284.92, 82.98), 10.5, 134974407, true)
		CreateModelHide(vector3(-552.55, 284.92, 82.98), 10.5, 395681893, true)
		CreateModelHide(vector3(-552.55, 284.92, 82.98), 10.5, 61087258, true)
	end
	CreateModelHide(vector3(-562.26, 288.59, 82.18), 1.5, -1720513558, true)
	CreateModelHide(vector3(-564.27, 279.39, 82.98), 1.5, -501934650, true)
	CreateModelHide(vector3(-565.5, 287.46, 85.38), 1.5, -242975151, true)
	CreateModelHide(vector3(-565.5, 287.46, 85.38), 1.5, 1923645595, true)
	CreateModelHide(vector3(-562.15, 289.79, 82.18), 1.5, 1923645595, true)
	CreateModelHide(vector3(-562.15, 289.79, 82.18), 1.5, -242975151, true)
	Targets["TeqFridge"] =
	exports['qb-target']:AddBoxZone("TeqFridge", vector3(-562.82, 285.87, 82.18), 1.9, 0.2, { name="TeqFridge", heading = 355.0, debugPoly=Config.Debug, minZ=81.18, maxZ=82.18 },
		{ options = { {  event = "jim-tequilala:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "tequilala", shop = Config.DrinkItems }, }, distance = 1.5 })
	Targets["TeqFridge2"] =
	exports['qb-target']:AddBoxZone("TeqFridge2", vector3(-562.66, 287.85, 82.18), 2.0, 0.2, { name="TeqFridge2", heading = 355.0, debugPoly=Config.Debug, minZ=81.18, maxZ=82.18 },
		{ options = { {  event = "jim-tequilala:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "tequilala", shop = Config.DrinkItems }, }, distance = 1.5	})
	Targets["TeqFridge3"] =
	exports['qb-target']:AddBoxZone("TeqFridge3", vector3(-562.47, 289.47, 82.18), 1.2, 0.2, { name="TeqFridge3", heading = 355.0, debugPoly=Config.Debug, minZ=81.18, maxZ=82.18 },
		{ options = { {  event = "jim-tequilala:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "tequilala", shop = Config.DrinkItems }, }, distance = 1.5	})
	Targets["TeqFridge4"] =
	exports['qb-target']:AddBoxZone("TeqFridge4", vector3(-566.03, 285.29, 85.38), 1.6, 0.2, { name="TeqFridge4", heading = 355.0, debugPoly=Config.Debug, minZ=84.38, maxZ=85.38 },
		{ options = { {  event = "jim-tequilala:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "tequilala", shop = Config.DrinkItems }, }, distance = 1.5 })
	Targets["TeqFridge5"] =
	exports['qb-target']:AddBoxZone("TeqFridge5", vector3(-565.94, 286.94, 85.38), 1.6, 0.2, { name="TeqFridge5", heading = 355.0, debugPoly=Config.Debug, minZ=84.38, maxZ=85.38 },
		{ options = { {  event = "jim-tequilala:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_fridge"], job = "tequilala", shop = Config.DrinkItems }, }, distance = 1.5 })
	--HAND WASHES
	Targets["TeqWash"] =
	exports['qb-target']:AddBoxZone("TeqWash", vector3(-561.32, 286.1, 82.18), 0.5, 0.35, { name="TeqWash", heading = 355.0, debugPoly=Config.Debug, minZ=81.78,  maxZ=82.18 },
		{ options = { { event = "jim-tequilala:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"] }, }, distance = 1.5 })
	Targets["TeqWash2"] =
	exports['qb-target']:AddBoxZone("TeqWash2", vector3(-561.2, 287.4, 82.18), 0.5, 0.35, { name="TeqWash2", heading = 355.0, debugPoly=Config.Debug, minZ=81.78,  maxZ=82.18 },
		{ options = { { event = "jim-tequilala:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"] }, }, distance = 1.5 })
	--COUNTERS
	Targets["TeqCounter"] =
	exports['qb-target']:AddBoxZone("TeqCounter", vector3(-560.91, 287.37, 82.18), 0.45, 0.25, { name="TeqCounter", heading = 353.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.58 },
		{ options = { { event = "jim-tequilala:Stash", icon = "fas fa-wine-glass-alt", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter" }, }, distance = 2.0 })
	Targets["TeqCounter2"] =
	exports['qb-target']:AddBoxZone("TeqCounter2", vector3(-561.02, 286.07, 82.18), 0.45, 0.25, { name="TeqCounter2", heading = 356.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.58 },
		{ options = { { event = "jim-tequilala:Stash", icon = "fas fa-wine-glass-alt", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter2" }, }, distance = 2.0 })
	Targets["TeqCounter3"] =
	exports['qb-target']:AddBoxZone("TeqCounter3", vector3(-561.16, 284.79, 82.18), 0.45, 0.25, { name="TeqCounter3", heading = 353.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.58 },
		{ options = { { event = "jim-tequilala:Stash", icon = "fas fa-wine-glass-alt", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter3" }, }, distance = 2.0 })
	Targets["TeqCounter4"] =
	exports['qb-target']:AddBoxZone("TeqCounter4", vector3(-564.12, 286.87, 85.38), 0.45, 0.25, { name="TeqCounter4", heading = 356.0, debugPoly=Config.Debug, minZ=85.38, maxZ=85.98 },
		{ options = { { event = "jim-tequilala:Stash", icon = "fas fa-wine-glass-alt", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter4" }, }, distance = 2.0 })
	Targets["TeqCounter5"] =
	exports['qb-target']:AddBoxZone("TeqCounter5", vector3(-564.24, 285.57, 85.38), 0.45, 0.25, { name="TeqCounter5", heading = 353.0, debugPoly=Config.Debug, minZ=85.38, maxZ=85.98 },
		{ options = { { event = "jim-tequilala:Stash", icon = "fas fa-wine-glass-alt", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter5" }, }, distance = 2.0 })
	--CASH REGISTERS
	Targets["TeqReceipt"] =
	exports['qb-target']:AddBoxZone("TeqReceipt", vector3(-562.97, 287.49, 82.18), 0.4, 0.4, { name="TeqReceipt", heading = 350.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.78 },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "tequilala",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/8/8a/Tequilala-GTAV-Logo.png width=100px></p>"
						} }, distance = 2.0 })
	Targets["TeqReceipt2"] =
	exports['qb-target']:AddBoxZone("TeqReceipt2", vector3(-566.27, 284.69, 85.38), 0.4, 0.4, { name="TeqReceipt2", heading = 0.0, debugPoly=Config.Debug, minZ=85.38, maxZ=86.03 },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "tequilala",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/8/8a/Tequilala-GTAV-Logo.png width=100px></p>"
						} }, distance = 2.0 })
	--COCKTAIL CHOPPING BOARDS
	Targets["TeqCocktails"] =
	exports['qb-target']:AddBoxZone("TeqCocktails", vector3(-562.81, 288.67, 82.18), 0.6, 0.4, { name="TeqCocktails", heading = 0.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.58 },
		{ options = { { event = "jim-tequilala:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_cocktails"], job = "tequilala", craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["prepare_cockt"] }, }, distance = 2.0 })
	Targets["TeqCocktails2"] =
	exports['qb-target']:AddBoxZone("TeqCocktails2", vector3(-566.03, 287.48, 85.38), 0.6, 0.4, { name="TeqCocktails2", heading = 0.0, debugPoly=Config.Debug, minZ=85.38, maxZ=85.98 },
		{ options = { { event = "jim-tequilala:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_cocktails"], job = "tequilala", craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["prepare_cockt"] }, }, distance = 2.0 })
	--BEER TAPS
	Targets["TeqTap"] =
	exports['qb-target']:AddBoxZone("TeqTap", vector3(-560.94, 288.04, 82.18), 0.65, 0.2, { name="TeqTap", heading = 355.0, debugPoly=Config.Debug, minZ=82.23, maxZ=82.98 },
		{ options = { { event = "jim-tequilala:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = "tequilala", craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer_menu"]  }, }, distance = 1.5 })
	Targets["TeqTap2"] =
	exports['qb-target']:AddBoxZone("TeqTap2", vector3(-561.17, 285.42, 82.18), 0.65, 0.2, { name="TeqTap2", heading = 355.0, debugPoly=Config.Debug, minZ=82.23, maxZ=82.98 },
		{ options = { { event = "jim-tequilala:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = "tequilala", craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer_menu"] }, }, distance = 1.5 })
	Targets["TeqTap3"] =
	exports['qb-target']:AddBoxZone("TeqTap3", vector3(-564.21, 286.28, 85.38), 0.65, 0.2, { name="TeqTap3", heading = 355.0, debugPoly=Config.Debug, minZ=85.38, maxZ=86.18 },
		{ options = { { event = "jim-tequilala:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].targetinfo["pour_beer"], job = "tequilala", craftable = Crafting.Beer, header = Loc[Config.Lan].menu["beer_menu"] }, }, distance = 1.5 })
	--COFFEE
	Targets["TeqCoffee"] =
	exports['qb-target']:AddBoxZone("TeqCoffee", vector3(-562.76, 289.95, 82.18), 0.6, 0.4, { name="TeqCoffee", heading = 40.0, debugPoly=Config.Debug, minZ=82.23, maxZ=82.78 },
		{ options = { { event = "jim-tequilala:JustGive", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = "tequilala", id = "coffee"}, }, distance = 2.0 })
	Targets["TeqCoffee2"] =
	exports['qb-target']:AddBoxZone("TeqCoffee2", vector3(-566.02, 288.01, 85.38), 0.2, 0.4, { name="TeqCoffee2", heading = 347.0, debugPoly=Config.Debug, minZ=85.38, maxZ=85.98 },
		{ options = { { event = "jim-tequilala:JustGive", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["pour_coffee"], job = "tequilala", id = "coffee"}, }, distance = 2.0 })

	--CLOCKIN
	Targets["TeqClockin"] =
	exports['qb-target']:AddBoxZone("TeqClockin", vector3(-560.68, 289.25, 82.18), 0.6, 0.6, { name="TeqClockin", heading = 15.0, debugPoly=Config.Debug, minZ=82.18, maxZ=82.68 },
		{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = "tequilala" },
					{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles },
					}, distance = 2.0 })

	if Config.MLO == "base" then
		--DOOR TELEPORTS
		Targets["TeqDoor"] =
		exports['qb-target']:AddBoxZone("TeqDoor", vector3(-561.63, 290.16, 82.18), 0.2, 1.15, { name="UniDoor", heading = 355.0, debugPoly=Config.Debug, minZ=81.23, maxZ=83.33 },
			{ options = { { event = "jim-tequilala:Door", icon = "fas fa-door-open", label = Loc[Config.Lan].targetinfo["top_bar_access"], job = "tequilala", door = 2 }, }, distance = 2.0 })
		Targets["TeqDoor2"] =
		exports['qb-target']:AddBoxZone("TeqDoor2", vector3(-565.28, 284.32, 85.38), 0.2, 1.2, { name="UniDoor2", heading = 355.0, debugPoly=Config.Debug, minZ=84.38, maxZ=86.78 },
			{ options = { { event = "jim-tequilala:Door", icon = "fas fa-door-open", label = Loc[Config.Lan].targetinfo["top_bar_exit"], job = "tequilala", door = 1 }, }, distance = 2.0 })
		--ENTRANCE CHARGE
		Targets["TeqReceipt3"] =
		exports['qb-target']:AddBoxZone("TeqReceipt3", vector3(-562.79, 279.08, 82.98), 0.4, 0.4, { name="TeqReceipt3", heading = 340.0, debugPoly=Config.Debug, minZ=82.78, maxZ=83.58 },
		{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "tequilala",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/8/8a/Tequilala-GTAV-Logo.png width=100px></p>"
						} }, distance = 2.0 })
		if Config.useDLC then
		--Instruments
			Targets["TeqDrums"] =
			exports['qb-target']:AddBoxZone("TeqDrums", vector3(-550.68, 284.58, 82.97), 1.8, 1.0, { name="TeqDrums", heading = 353.0, debugPoly=Config.Debug, minZ=81.97, maxZ=83.57 },
				{ options = { { event = "jim-tequilala:anim", icon = "fas fa-drum", label = Loc[Config.Lan].targetinfo["use_drum_kit"], anim= "drum", } }, distance = 2.0 })

			Targets["TeqGuitar"] =
			exports['qb-target']:AddBoxZone("TeqGuitar", vector3(-550.33, 287.31, 82.98), 1.4, 0.6, { name="TeqGuitar", heading = 0.0, debugPoly=Config.Debug, minZ=81.98, maxZ=82.78 },
				{ options = { { event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["acoustic"], anim= "guitar", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["flying_v"], anim= "guitarelectric", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["gibson"], anim= "guitarelectric2", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["love_fist_quitar"], anim= "guitarelectric4", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["dime_green"], anim= "guitarelectric3", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["dime_red"], anim= "guitarelectric5", },
							}, distance = 2.0 })
			Targets["TeqGuitar2"] =
			exports['qb-target']:AddBoxZone("TeqGuitar2", vector3(-550.82, 281.41, 82.98), 1.4, 0.6, { name="TeqGuitar2", heading = 0.0, debugPoly=Config.Debug, minZ=81.98, maxZ=82.78 },
				{ options = { { event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["acoustic"], anim= "guitar", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["flying_v"], anim= "guitarelectric", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["gibson"], anim= "guitarelectric2", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["love_fist_quitar"], anim= "guitarelectric4", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["dime_green"], anim= "guitarelectric3", },
							{ event = "jim-tequilala:anim", icon = "fas fa-guitar", label = Loc[Config.Lan].targetinfo["dime_red"], anim= "guitarelectric5", },
						}, distance = 2.0 })
		end
	elseif Config.MLO == "hass" then
		--ENTRANCE CHARGE
		Targets["TeqReceipt3"] =
		exports['qb-target']:AddBoxZone("TeqReceipt3", vector3(-563.28, 278.75, 83.14), 0.45, 0.35, { name="TeqReceipt3", heading = 0.0, debugPoly=Config.Debug, minZ=83.14, maxZ=83.54 },
					{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = "tequilala",
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/8/8a/Tequilala-GTAV-Logo.png width=100px></p>"
						} }, distance = 2.0 })
	end
	for i = 1, #Config.Locations do
		if Config.Locations[i].Booth.enableBooth then
			Targets["TeqBooth"..i] =
			exports['qb-target']:AddCircleZone("TeqBooth"..i, Config.Locations[i].Booth.coords, 0.75, {name="TeqBooth"..i, debugPoly=Config.Debug, useZ=true, },
				{ options = { { event = "jim-tequilala:client:playMusic", icon = "fab fa-youtube", label = Loc[Config.Lan].targetinfo["dj_booth"], job = "tequilala", zone = i, }, }, distance = 2.0 })
		end
	end
end)

RegisterNetEvent('jim-tequilala:anim', function(data)
	if data.anim == "drum" then
		FreezeEntityPosition(PlayerPedId(), false)
		ExecuteCommand("e drummer")
		SetEntityCoords(PlayerPedId(), -549.95, 284.37, 82.98-0.8, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 111.6)
		Wait(100)
		ExecuteCommand("e drummer")
	else
		ExecuteCommand("e ".. (data.anim))
	end
end)

RegisterNetEvent('jim-tequilala:Door', function(data)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Citizen.Wait(10) end
	if data.door == 1 then
		SetEntityCoords(PlayerPedId(), -561.78, 289.85, 82.18, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 174.28)
	elseif data.door == 2 then
		SetEntityCoords(PlayerPedId(), -565.27, 284.67, 85.38, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), 355.47)
	end
	DoScreenFadeIn(1000)
    Wait(100)
end)

RegisterNetEvent('jim-tequilala:washHands', function(data)
    QBCore.Functions.Progressbar('washing_hands', Loc[Config.Lan].progressbar["washing_hands"], 5000, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
		{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', Loc[Config.Lan].success["success_washed_hands"], 'success')
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', Loc[Config.Lan].error["cancelled"], 'error')
    end, data.icon)
end)

RegisterNetEvent('jim-tequilala:Stash', function(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tequila_"..data.stash)
    TriggerEvent("inventory:client:SetCurrentStash", "Tequila_"..data.stash)
end)

RegisterNetEvent('jim-tequilala:Shop', function(data)
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen" end
	TriggerServerEvent(event, "shop", "tequilala", data.shop)
end)

RegisterNetEvent('jim-tequilala:Crafting:MakeItem', function(data)
	local bartext = ""
	for i = 1, #Crafting.Cocktails do
		for k, v in pairs(Crafting.Cocktails[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].menu["mixing"]
				bartime = 7000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions"
				animNow = "cop_b_idle"
			end
		end
	end
	for i = 1, #Crafting.Beer do
		for k, v in pairs(Crafting.Beer[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].menu["pouring"]
				bartime = 3000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
	if data.item == "coffee" then
		bartext = Loc[Config.Lan].menu["pouring"]
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext..QBCore.Shared.Items[data.item].label, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, },
	{}, {}, function()
		TriggerServerEvent('jim-tequilala:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-tequilala:Crafting", data)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
	end, data.item)
end)

RegisterNetEvent('jim-tequilala:Crafting', function(data)
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[k].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 1 then number = "" else number = " x"..b end
					text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				Menu[#Menu + 1] = { disabled = disable, icon = k, header = setheader, txt = settext, params = { event = "jim-tequilala:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
				settext, setheader = nil
			end
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

function FoodProgress(ItemMake, craftable)
	QBCore.Functions.Progressbar('making_food', Loc[Config.Lan].progressbar["pouring_prog"]..QBCore.Shared.Items[ItemMake].label, 3000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, },
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, },
	{}, {}, function()
		TriggerServerEvent('jim-tequilala:Crafting:GetItem', ItemMake, craftable)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled!", 'error')
	end, ItemMake)
end

RegisterNetEvent('jim-tequilala:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', Loc[Config.Lan].error["not_clocked_in"], 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('jim-tequilala:client:DrinkAlcohol', function(itemName)
	if itemName == "ambeer" then ExecuteCommand("e beer3")
	elseif itemName == "dusche" then ExecuteCommand("e beer1")
	elseif itemName == "logger" then ExecuteCommand("e beer2")
	elseif itemName == "pisswasser" then ExecuteCommand("e beer4")
	elseif itemName == "pisswasser2" then ExecuteCommand("e beer5")
	elseif itemName == "pisswasser3" then ExecuteCommand("e beer6")
	elseif itemName == "b52" or itemName == "brussian" or itemName == "bkamikaze" or itemName == "cappucc" or itemName == "ccookie" or itemName == "iflag" or itemName == "kamikaze" or itemName == "sbullet" or itemName == "voodoo" or itemName == "woowoo" then ExecuteCommand("e whiskey")
	elseif itemName == "icream" then ExecuteCommand("e icream")
	elseif itemName == "rum" then ExecuteCommand("e rumb")
	elseif itemName == "gin" then ExecuteCommand("e ginb")
	elseif itemName == "scotch" then ExecuteCommand("e whiskeyb")
	elseif itemName == "vodka" or itemName == "amaretto" or itemName == "curaco" then ExecuteCommand("e vodkab")
	else ExecuteCommand("e flute") end
    QBCore.Functions.Progressbar("snort_coke", Loc[Config.Lan].progressbar["drinking"]..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true, },
	{}, {}, {}, function() -- Done
        ExecuteCommand("e c")
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].hunger then 
			TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) 
			TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
		end
        if QBCore.Shared.Items[itemName].thirst then 
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
			TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		end        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
			AlienEffect()
        end

    end, function() -- Cancel
        ExecuteCommand("e c")
        QBCore.Functions.Notify(Loc[Config.Lan].error["cancelled"], "error")
    end, itemName)
end)

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local ped = PlayerPedId()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetPedCanRagdoll( ped, true )
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedMotionBlur(ped, true)
    SetPedIsDrunk(ped, true)
    Wait(1500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(13500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('jim-tequilala:client:Drink', function(itemName)
	if itemName == "sprunk" or itemName == "sprunklight" then ExecuteCommand("e sprunk")
	elseif itemName == "ecola" or itemName == "ecolalight" then ExecuteCommand("e ecola")
    elseif itemName == "cranberry" then ExecuteCommand("e wine")
	elseif itemName == "coffee" then ExecuteCommand("e coffee") end
	QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan].progressbar["drinking"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true, },
	{}, {}, {}, function()
        ExecuteCommand("e c")
		toggleItem(false, itemName, 1)
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end, function() -- Cancel
        ExecuteCommand("e c")
	end, itemName)
end)

RegisterNetEvent('jim-tequilala:client:Eat', function(itemName)
	if itemName == "crisps" then ExecuteCommand("e crisps")
	else ExecuteCommand("e burger") end
    QBCore.Functions.Progressbar("eat_something", Loc[Config.Lan].progressbar["eating"]..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true, },
	{}, {}, {}, function() -- Done
        ExecuteCommand("e c")
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].hunger then 
			TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) 
			TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
		end
        if QBCore.Shared.Items[itemName].thirst then 
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
			TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		end
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end, function() -- Cancel
        ExecuteCommand("e c")
	end, itemName)
end)

-- CUSTOM DJ BOOTH STUFF
RegisterNetEvent('jim-tequilala:client:playMusic', function(data)
	exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = '<center><img src=https://static.wikia.nocookie.net/thefamilyrp/images/f/f0/Tll.png width=225px>' },
		{ icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "qb-menu:client:closemenu" } },
		{ icon = "fab fa-youtube", header = Loc[Config.Lan].menu["play_song"], txt = Loc[Config.Lan].menu["youtube_link"], params = { event = 'jim-tequilala:client:musicMenu', args = { zoneNum = data.zone } } },
		{ icon = "fas fa-pause", header = Loc[Config.Lan].menu["pause_music"], txt = Loc[Config.Lan].menu["pause_music"], params = { isServer = true, event = 'jim-tequilala:server:pauseMusic', args = { zoneNum = data.zone } } },
		{ icon = "fas fa-play", header = Loc[Config.Lan].menu["resume_music"], txt = Loc[Config.Lan].menu["resume_music"], params = { isServer = true, event = 'jim-tequilala:server:resumeMusic', args = { zoneNum = data.zone } } },
		{ icon = "fas fa-volume-off", header = Loc[Config.Lan].menu["volume"], txt = Loc[Config.Lan].menu["change_volume"], params = { event = 'jim-tequilala:client:changeVolume', args = { zoneNum = data.zone } } },
		{ icon = "fas fa-stop", header = Loc[Config.Lan].menu["turn_off_music"], txt = Loc[Config.Lan].menu["stop_music"], params = { isServer = true, event = 'jim-tequilala:server:stopMusic', args = { zoneNum = data.zone } } } })
end)
RegisterNetEvent('jim-tequilala:client:musicMenu', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Song Selection',
        submitText = "Submit",
        inputs = { { type = 'text', isRequired = true, name = 'song', text = Loc[Config.Lan].menu["youtube_link"] } } })
    if dialog then
        if not dialog.song then return end
        TriggerServerEvent('jim-tequilala:server:playMusic', dialog.song, data.zoneNum)
    end
end)
RegisterNetEvent('jim-tequilala:client:changeVolume', function(data)
    local dialog = exports['qb-input']:ShowInput({
        header = 'Music Volume',
        submitText = "Submit",
        inputs = { { type = 'text', isRequired = true,  name = 'volume', text = Loc[Config.Lan].menu["min_max"] } } })
    if dialog then
        if not dialog.volume then return end
        TriggerServerEvent('jim-tequilala:server:changeVolume', dialog.volume, data.zoneNum)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
	for _, v in pairs(Props) do DeleteEntity(v) end
end)