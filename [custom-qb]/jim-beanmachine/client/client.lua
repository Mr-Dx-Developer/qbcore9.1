local QBCore = exports[Config.Core]:GetCoreObject()

PlayerJob = {}
local Targets, Props, CraftLock = {}, {}, false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerJob.onduty then for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then TriggerServerEvent("QBCore:ToggleDuty") end end end end)
end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job for k, v in pairs(Config.Locations) do if PlayerData.job.name == v.job then onDuty = PlayerJob.onduty end end end)
end)

CreateThread(function()
	for k, v in pairs(Config.Locations) do
		local bossroles = {}
		for grade, info in pairs(QBCore.Shared.Jobs[v.job].grades) do
			if info.isboss then
				if bossroles[v.job] then
					if bossroles[v.job] > tonumber(grade) then bossroles[v.job] = tonumber(grade) end
				else bossroles[v.job] = tonumber(grade)	end
			end
		end
		if v.zoneEnable then
			makeBlip({ coords = v.blip, sprite = v.blipsprite, col = v.blipcolor, scale = v.blipscale, disp = v.blipdisp, category = v.blipcat, name = v.label })
			if v.zones then
				JobLocation = PolyZone:Create(v.zones, { name = v.label, debugPoly = Config.Debug })
				JobLocation:onPlayerInOut(function(isPointInside)
					if PlayerJob.name == v.job then
						if v.autoClock and v.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
						if v.autoClock and v.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
					end
				end)
			end
			local propTable = {}
			if k == "beangabzlegion" then
				Targets["BeanWash"] =
					exports['qb-target']:AddBoxZone("BeanWash", vec3(123.73, -1039.24, 29.28-0.5), 1.2, 0.6, { name="BeanWash", heading = 340.0, debugPoly=Config.Debug, minZ=28.88, maxZ=29.68 },
						{ options = { { event = "jim-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(123.73, -1039.24, 29.28) }, }, distance = 1.5 })
				Targets["BeanCounter"] =
					exports['qb-target']:AddBoxZone("BeanCounter", vec3(120.54, -1040.74, 29.28-1), 0.6, 0.4, { name="BeanCounter", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 },
						{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter", coords = vec3(120.54, -1040.74, 29.28) }, }, distance = 2.0 })
				Targets["BeanCounter2"] =
					exports['qb-target']:AddBoxZone("BeanCounter2", vec3(121.85, -1037.08, 29.28-1), 0.6, 0.4, { name="BeanCounter2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08},
						{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "Counter2", coords = vec3(121.85, -1037.08, 29.28) }, }, distance = 2.0 })

				Targets["BeanReceipt"] =
					exports['qb-target']:AddBoxZone("BeanReceipt", vec3(120.73, -1040.09, 29.28), 0.6, 0.6, { name="BeanReceipt", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
						} }, distance = 2.0 })
				Targets["BeanReceipt2"] =
					exports['qb-target']:AddBoxZone("BeanReceipt2",vec3(122.0, -1036.51, 29.28), 0.6, 0.6, { name="BeanReceipt2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
						} }, distance = 2.0 })

				Targets["BeanFridge"] =
					exports['qb-target']:AddBoxZone("BeanFridge", vec3(124.51, -1037.97, 29.28), 0.85, 0.6, { name="BeanFridge", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 },
						{ options = { {  event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "BeanFridge", coords = vec3(124.51, -1037.97, 29.28) }, }, distance = 1.5 })
				Targets["BeanFridge2"] =
					exports['qb-target']:AddBoxZone("BeanFridge2", vec3(123.5, -1040.74, 29.28), 0.9, 0.6, { name="BeanFridge2", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=30.08 },
						{ options = { {  event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "BeanFridge2", coords = vec3(123.5, -1040.74, 29.28) }, }, distance = 1.5 })

				Targets["BeanDrink"] =
					exports['qb-target']:AddBoxZone("BeanDrink", vec3(124.56, -1036.88, 29.28), 0.7, 0.4, { name="BeanDrink", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(124.56, -1036.88, 29.28) }, }, distance = 2.0 })
				Targets["BeanDrink2"] =
					exports['qb-target']:AddBoxZone("BeanDrink2", vec3(122.93, -1041.68, 29.28), 0.7, 0.6, { name="BeanDrink2", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(122.93, -1041.68, 29.28) }, }, distance = 2.0 })

				Targets["BeanSlush"] =x
					exports['qb-target']:AddBoxZone("BeanSlush", vec3(126.07, -1036.59, 29.28), 0.6, 0.6, { name="BeanSlush", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=30.08 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_slush"], job = v.job, craftable = Crafting.Slush, header = Loc[Config.Lan].menu["slush_menu"], coords = vec3(126.07, -1036.59, 29.28) }, }, distance = 2.0 })

				Targets["BeanSoda"] =
					exports['qb-target']:AddBoxZone("BeanSoda", vec3(123.56, -1042.75, 29.28), 0.6, 1.4, { name="BeanSoda", heading = 340.0, debugPoly=Config.Debug, minZ=29.08, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["grab_soda"], job = v.job, shop = Config.SodaItems, shopname = "BeanSoda", coords = vec3(123.56, -1042.75, 29.28) }, }, distance = 2.0 })

				Targets["BeanDonut"] =
					exports['qb-target']:AddBoxZone("BeanDonut", vec3(121.4, -1038.43, 29.28), 1.45, 0.6, { name="BeanDonut", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=29.88 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-circle-dot", label = Loc[Config.Lan].targetinfo["grab_food"], job = v.job, shop = Config.DesertItems, shopname = "BeanDonut", coords = vec3(121.4, -1038.43, 29.28) },
									{ event = "jim-beanmachine:Stash", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_stash"], job = v.job, stash = "LegionStash", coords = vec3(121.4, -1038.43, 29.28) }, }, distance = 2.0 })

				Targets["BeanClockin"] =
					exports['qb-target']:AddBoxZone("BeanClockin", vec3(126.94, -1035.84, 29.28), 1.2, 0.2, { name="BeanClockin", heading = 340.0, debugPoly=Config.Debug, minZ=29.28, maxZ=31.28 },
						{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
									{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].targetinfo["open_bossmenu"], job = bossroles, },
									}, distance = 2.0 })
			end
			if k == "beanunclejust" then
				--Cereal Boxes
				CreateModelHide(vec3(-636.56, 235.83, 82.43), 1.0, -598185919, true) CreateModelHide(vec3(-636.56, 235.83, 82.43), 1.0, 714696561, true)
				CreateModelHide(vec3(-636.56, 235.83, 82.43), 1.0, 1241647493, true) CreateModelHide(vec3(-636.56, 235.83, 82.43), 1.0, 2141353157, true)

				CreateModelHide(vec3(-634.28, 235.29, 83.12), 1.5, 270388964, true)	CreateModelHide(vec3(-634.28, 235.29, 83.12), 1.5, 974883178, true)
				CreateModelHide(vec3(-634.28, 235.29, 83.12), 1.5, -85890288, true)	CreateModelHide(vec3(-635.73, 235.3, 81.88), 1.5, -1281587804, true)
				CreateModelHide(vec3(-633.47, 233.44, 81.88+1.0), 1.5, 1503218008, true)

				propTable[#propTable+1] = { prop = "prop_till_03", coords = vec4(-634.38, 235.29, 83.12, 285.0)}
				propTable[#propTable+1] = { prop = "prop_food_tray_01", coords = vec4(-634.28, 234.69, 83.12, 95.0)}
				propTable[#propTable+1] = { prop = "prop_slush_dispenser", coords = vec4(-636.56, 235.83, 82.43+0.91, 90.0)}

				Targets["UBeanCounter"] =
					exports['qb-target']:AddBoxZone("UBeanCounter", vec3(-634.27, 234.69, 81.88), 0.55, 0.4, { name="UBeanCounter", heading = 5.0, debugPoly=Config.Debug, minZ=81.93, maxZ=82.48 },
						{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "UCounter", coords = vec3(-634.27, 234.69, 81.88) }, }, distance = 2.0 })
				Targets["UBeanReceipt"] =
					exports['qb-target']:AddBoxZone("UBeanReceipt", vec3(-634.38, 235.3, 81.88), 0.4, 0.5, { name="UBeanReceipt", heading = 15.0, debugPoly=Config.Debug, minZ=82.08, maxZ=82.68 },
						{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
						img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
					} }, distance = 2.0 })
				Targets["UBeanDrink"] =
					exports['qb-target']:AddBoxZone("UBeanDrink", vec3(-635.7, 236.55, 81.88), 0.6, 1.0, { name="UBeanDrink", heading = 1.0, debugPoly=Config.Debug, minZ=81.88, maxZ=82.68 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(-635.7, 236.55, 81.88) }, }, distance = 2.0 })
				Targets["UBeanDrink2"] =
					exports['qb-target']:AddBoxZone("UBeanDrink2", vec3(-627.68, 222.8, 81.88), 0.6, 0.8, { name="UBeanDrink2", heading = 0.0, debugPoly=Config.Debug, minZ=81.88, maxZ=82.68 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = Loc[Config.Lan].menu["drink_menu"], coords = vec3(-627.68, 222.8, 81.88) }, }, distance = 2.0 })
				Targets["UBeanFridge"] =
					exports['qb-target']:AddBoxZone("UBeanFridge", vec3(-635.51, 233.23, 81.88-1), 0.4, 1.6, { name="UBeanFridge", heading = 339.0, debugPoly=Config.Debug, minZ=80.88, maxZ=83.08 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_shop"], job = v.job, shop = Config.FoodItems, coords = vec3(-635.51, 233.23, 81.88), shopname = "UBeanFridge", },
									{ event = "jim-beanmachine:Stash", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_stash"], job = v.job, stash = "UStash", coords = vec3(-635.51, 233.23, 81.88) }, }, distance = 1.5 })
				Targets["UBeanSlush"] =
					exports['qb-target']:AddBoxZone("UBeanSlush", vec3(-636.52, 235.81, 81.88), 0.5, 0.5, { name="UBeanSlush", heading = 1.0, debugPoly=Config.Debug, minZ=82.28, maxZ=83.08 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_slush"], job = v.job, craftable = Crafting.Slush, header = Loc[Config.Lan].menu["slush_menu"], coords = vec3(-636.52, 235.81, 81.88) }, }, distance = 2.0 })
				Targets["UBeanSoda"] =
					exports['qb-target']:AddBoxZone("UBeanSoda", vec3(-636.74, 234.86, 81.88-1), 2.6, 0.4, { name="UBeanSoda", heading = 1.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.08 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["grab_soda"], job = v.job, shop = Config.SodaItems, shopname = "UBeanSoda", coords = vec3(-636.74, 234.86, 81.88) }, }, distance = 2.0 })
				Targets["UBeanDonut"] =
					exports['qb-target']:AddBoxZone("UBeanDonut", vec3(-636.62, 234.98, 81.88), 0.6, 0.6, { name="UBeanDonut", heading = 1.0, debugPoly=Config.Debug, minZ=82.28, maxZ=82.88 },
					{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-circle-dot", label = Loc[Config.Lan].targetinfo["grab_food"], job = v.job, shop = Config.DesertItems, shopname = "UBeanDonut", coords = vec3(-636.62, 234.98, 81.88) }, }, distance = 2.0 })
				Targets["UBeanWash"] =
					exports['qb-target']:AddBoxZone("UBeanWash", vec3(-621.67, 226.77, 81.88-1), 1.6, 0.6, { name="BeanWash", heading = 0.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.68 },
						{ options = { { event = "jim-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(-621.67, 226.77, 81.88) }, }, distance = 1.5 })
				Targets["UBeanWash2"] =
					exports['qb-target']:AddBoxZone("UBeanWash2", vec3(-630.71, 222.83, 81.88-1), 0.7, 1.4, { name="UBeanWash2", heading = 0.0, debugPoly=Config.Debug, minZ=80.88, maxZ=82.68 },
						{ options = { { event = "jim-beanmachine:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].targetinfo["wash_hands"], job = v.job, coords = vec3(-630.71, 222.83, 81.88) }, }, distance = 1.5 })

				Targets["UBeanClockin"] =
					exports['qb-target']:AddBoxZone("UBeanClockin", vec3(-635.89, 227.12, 81.88), 1.6, 0.2, { name="UBeanClockin", heading = 0.0, debugPoly=Config.Debug, minZ=81.68, maxZ=82.93 },
					{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
								{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = "Open Bossmenu", job = bossroles, },
								}, distance = 2.0 })
			end
			if k == "beanrflx" then
				Targets["flxClockin"] =
					exports['qb-target']:AddBoxZone("flxClockin", vec3(284.84, -978.75, 29.42-0.3), 0.5, 0.5, { name="flxClockin", heading = 343.0, debugPoly=Config.Debug, minZ=29.02, maxZ=29.62 },
					{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].targetinfo["toggle_duty"], job = v.job },
								{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = "Open Bossmenu", job = bossroles, },
								}, distance = 2.0 })
				Targets["flxReceipt"] =
				exports['qb-target']:AddBoxZone("flxReceipt", vec3(280.99, -972.57, 29.42), 0.4, 0.5, { name="flxReceipt", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.22 },
					{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].targetinfo["charge_customer"], job = v.job,
					img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/fc/TheBeanMachine-GTA4-logo.png width=100px></p>"
				} }, distance = 2.0 })
				Targets["flxCounter"] =
					exports['qb-target']:AddBoxZone("flxCounter", vec3(280.50, -972.54, 30.29-1), 0.55, 0.7, { name="flxCounter", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.02 },
					{ options = { { event = "jim-beanmachine:Stash", icon = "fas fa-mug-saucer", label = Loc[Config.Lan].targetinfo["open_counter"], stash = "flxCounter", coords = vec3(280.50, -972.54, 30.29) }, }, distance = 2.0 })
				Targets["flxBeanSlush"] =
					exports['qb-target']:AddBoxZone("flxBeanSlush", vec3(278.92, -972.6, 30.62-1), 0.5, 0.5, { name="flxBeanSlush", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.52 },
						{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].targetinfo["prepare_slush"], job = v.job, craftable = Crafting.Slush, header = "Slush Menu", coords = vec3(278.92, -972.6, 30.62) }, }, distance = 2.0 })
				Targets["flxBeanSoda"] =
					exports['qb-target']:AddBoxZone("flxBeanSoda", vec3(278.87, -973.37, 30.62-1), 0.5, 0.7, { name="flxBeanSoda", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.22 },
						{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["grab_soda"], job = v.job, shop = Config.SodaItems, shopname = "flxBeanSoda", coords = vec3(278.87, -973.37, 30.62) }, }, distance = 2.0 })

				Targets["flxBeanDonut"] =
					exports['qb-target']:AddBoxZone("flxBeanDonut", vec3(279.62, -972.55, 30.62-1), 0.5, 0.7, { name="flxBeanDonut", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.02 },
							{ options = { { event = "jim-beanmachine:Shop", icon = "fas fa-circle-dot", label = Loc[Config.Lan].targetinfo["grab_food"], job = v.job, shop = Config.DesertItems, shopname = "flxBeanDonut", coords = vec3(279.62, -972.55, 30.62) },
										{ event = "jim-beanmachine:Stash", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_stash"], job = v.job, stash = "flxStash", coords = vec3(279.62, -972.55, 30.62) }, }, distance = 2.0 })
				Targets["flxBeanDrink"] =
				exports['qb-target']:AddBoxZone("flxBeanDrink", vec3(279.54, -975.12, 29.42), 0.7, 0.5, { name="flxBeanDrink", heading = 90.0, debugPoly=Config.Debug, minZ=29.42, maxZ=30.22 },
					{ options = { { event = "jim-beanmachine:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].targetinfo["prepare_coffee"], job = v.job, craftable = Crafting.Drinks, header = "Drinks Menu", coords = vec3(279.54, -975.12, 29.42) }, }, distance = 2.0 })
				Targets["flxBeanFridge"] =
					exports['qb-target']:AddBoxZone("flxBeanFridge", vec3(278.94, -971.89, 29.42-1), 0.85, 0.7, { name="flxBeanFridge", heading = 0.0, debugPoly=Config.Debug, minZ=28.62, maxZ=30.62 },
						{ options = { {  event = "jim-beanmachine:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].targetinfo["open_storage"], job = v.job, shop = Config.FoodItems, shopname = "flxBeanFridge", coords = vec3(278.94, -971.89, 29.42) }, }, distance = 1.5 })

				propTable[#propTable+1] = { prop = "v_res_cakedome", coords = vec4(279.62, -972.55, 30.62, 90.0) }
				propTable[#propTable+1] = { prop = "prop_slush_dispenser", coords = vec4(278.92, -972.6, 30.62, 90.0) }
				propTable[#propTable+1] = { prop = "prop_food_bs_soda_01", coords = vec4(278.87, -973.37, 30.62, 90.0) }
				propTable[#propTable+1] = { prop = "prop_food_tray_01", coords = vec4(280.50, -972.54, 30.625, 0.0) }
			end
			for _, prop in pairs(propTable) do makeProp(prop, true, false) end
		end
	end
end)

RegisterNetEvent('jim-beanmachine:washHands', function(data)
	QBCore.Functions.Progressbar('hand_washing', Loc[Config.Lan].progressbar["washing_hands"], 5000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		triggerNotify(nil, Loc[Config.Lan].success["success_washed_hands"], 'success')
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false) triggerNotify(nil, Loc[Config.Lan].error["cancelled"], 'error')
	end, "fas fa-hand-holding-droplet")
end)

--[[CRAFTING]]--
RegisterNetEvent('jim-beanmachine:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartime = 5000
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k, v in pairs(data.craft[data.item]) do	data.craft[data.item][k] *= data.amount	end
		bartime *= data.amount bartime *= 0.9
	end
	QBCore.Functions.Progressbar('making_food', Loc[Config.Lan].progressbar["making"]..QBCore.Shared.Items[data.item].label, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, }, {}, {}, function()
		CraftLock = false
		TriggerServerEvent('jim-beanmachine:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-beanmachine:Crafting", data)
	end, function() -- Cancel
		CraftLock = false
		TriggerEvent('inventory:client:busy:status', false)
	end, data.item)
end)

RegisterNetEvent('jim-beanmachine:Crafting', function(data)
	if CraftLock then return end
	--if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 0 or b == 1 then number = "" else number = " x"..b end
					if not QBCore.Shared.Items[l] then print("^3Error^7: ^2Script can't find ingredient item in QB-Core items.lua - ^1"..l.."^7") return end
					if Config.Menu == "ox" then text = text..QBCore.Shared.Items[l].label..number.."\n" end
					if Config.Menu == "qb" then text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>" end
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				local event = "jim-beanmachine:Crafting:MakeItem"
                if Config.MultiCraft then event = "jim-beanmachine:Crafting:MultiCraft" end
				Menu[#Menu + 1] = {
					disabled = disable,
					icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
					header = setheader, txt = settext, --qb-menu
					params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } }, -- qb-menu
					title = setheader, description = settext, -- ox_lib
					event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header }, -- ox_lib
				}
				settext, setheader = nil
			end
		end
	end
	if Config.Menu == "ox" then exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu }) exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-beanmachine:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end
	end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-beanmachine:Crafting", args = data }, event = "jim-beanmachine:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-beanmachine:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k },
			params = { event = "jim-beanmachine:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, anim = data.anim, amount = k } }
		}
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-beanmachine:Stash', function(data)
	--if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "beanmachine_"..data.stash) else
	TriggerEvent("inventory:client:SetCurrentStash", "beanmachine_"..data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "beanmachine_"..data.stash) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-beanmachine:Shop', function(data)
	--if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then  exports.ox_inventory:openInventory('shop', { type = data.shopname }) end
	TriggerServerEvent(event, "shop", "beanmachine", data.shop)
	lookEnt(data.coords)
end)

-- [[CONSUME]] --
local function ConsumeSuccess(itemName, type)
	ExecuteCommand("e c")
	toggleItem(false, itemName, 1)
	if QBCore.Shared.Items[itemName].hunger then
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
		--TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
	end
	if QBCore.Shared.Items[itemName].thirst then
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		--TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end
	if type == "alcohol" then alcoholCount += 1
		if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200)	elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) AlienEffect() end
	end
	if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
end

RegisterNetEvent('jim-beanmachine:client:Consume', function(itemName, type)
	local emoteTable = {
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk", ["ecola"] = "ecola",	["ecolalight"] = "ecola",
		["ecocoffee"] = "bmcoffee1", ["flusher"] = "bmcoffee2", ["caffeagra"] = "bmcoffee3",	["crisps"] = "crisps",
		["beandonut"] = "donut2", ["chocolate"] = "egobar",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["drinking"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["eating"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	QBCore.Functions.Progressbar('making_food', progstring..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = animDictNow, anim = animNow, flags = 8, }, {}, {}, function()
		ConsumeSuccess(itemName, type)
	end, function() -- Cancel
		ExecuteCommand("e c")
	end, itemName)
end)
AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for k in pairs(Props) do DeleteEntity(Props[k]) end
		exports['qb-menu']:closeMenu()
	end
end)