local QBCore = exports['qb-core']:GetCoreObject()

local Targets = {}
local parking = {}
--Garage Locations
CreateThread(function()
	for k, v in pairs(Config.Locations) do
		if v.garage then
			local out = v.garage.out
			Targets["PizzaGarage: "..k] =
			exports['qb-target']:AddBoxZone("PizzaGarage: "..k, vector3(out.x, out.y, out.z-1.03), 0.8, 0.5, { name="PizzaGarage: "..k, heading = out[4]+180.0, debugPoly=Config.Debug, minZ=(out.z-1.03)-0.1, maxZ=out.z-1.03+1.3 },
				{ options = { { event = "jim-pizzathis:client:Garage:Menu", icon = "fas fa-clipboard", label = Loc[Config.Lan].targetinfo["job_vehicles"], job = v.job, coords = v.garage.spawn, list = v.garage.list }, },
				distance = 2.0 })
				parking[#parking+1] = makeProp({prop = `prop_parkingpay`, coords = vector4(out.x, out.y, out.z, out.w+180)}, 1, 0)
		end
	end
end)

local currentVeh = { out = false, current = nil }
RegisterNetEvent('jim-pizzathis:client:Garage:Menu', function(data)
	RequestAnimDict('amb@prop_human_atm@male@enter') while not HasAnimDictLoaded('amb@prop_human_atm@male@enter') do Wait(1) end
	if HasAnimDictLoaded('amb@prop_human_atm@male@enter') then TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true) end
	local vehicleMenu = { { icon = "fas fa-car-tunnel", header = Loc[Config.Lan].menu["job_garage"], isMenuHeader = true } }
	vehicleMenu[#vehicleMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "jim-pizzathis:client:Menu:Close" } }
	if currentVeh.out and DoesEntityExist(currentVeh.current) then
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-clipboard-list", header = Loc[Config.Lan].menu["vehicle_out_of_garage"],
										txt = Loc[Config.Lan].menu["vehicle"]..GetDisplayNameFromVehicleModel(GetEntityModel(currentVeh.current))..Loc[Config.Lan].menu["plate"]..GetVehicleNumberPlateText(currentVeh.current).."]",
										params = { event = "jim-pizzathis:client:Garage:Blip", }, }
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-car-burst", header = Loc[Config.Lan].menu["remove_vehicle"], params = { event = "jim-pizzathis:client:RemSpawn" } }
	else
		currentVeh = { out = false, current = nil }
		table.sort(data.list, function(a, b) return a:lower() < b:lower() end)
		for k,v in pairs(data.list) do
			local spawnName = v
			v = string.lower(GetDisplayNameFromVehicleModel(GetHashKey(spawnName)))	v = v:sub(1,1):upper()..v:sub(2).." "..GetMakeNameFromVehicleModel(GetHashKey(tostring(spawnName)))
			vehicleMenu[#vehicleMenu+1] = { header = v, params = { event = "jim-pizzathis:client:SpawnList", args = { spawnName = spawnName, coords = data.coords } } }
		end
	end
    exports['qb-menu']:openMenu(vehicleMenu)
end)

RegisterNetEvent("jim-pizzathis:client:SpawnList", function(data)
	local oldveh = GetClosestVehicle(data.coords.x, data.coords.y, data.coords.z, 2.5, 0, 71)
	if oldveh ~= 0 then
		local name = GetDisplayNameFromVehicleModel(GetEntityModel(oldveh)):lower()
		for k, v in pairs(QBCore.Shared.Vehicles) do
			if tonumber(v.hash) == GetEntityModel(vehicle) then
			if Config.Debug then print("Vehicle: "..v.hash.." ("..QBCore.Shared.Vehicles[k].name..")") end
			name = QBCore.Shared.Vehicles[k].name
			end
		end
		TriggerEvent("QBCore:Notify", name..Loc[Config.Lan].error["in_the_way"], "error")
	else
		QBCore.Functions.SpawnVehicle(data.spawnName, function(veh)
			currentVeh = { out = true, current = veh }
			SetVehicleModKit(veh, 0)
			NetworkRequestControlOfEntity(veh)
			SetVehicleNumberPlateText(veh, string.sub(PlayerJob.label, 1, 5)..tostring(math.random(100, 999)))
			SetEntityHeading(veh, data.coords.w)
			TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
			SetVehicleColours(veh, 131, 128)
			TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
			SetVehicleEngineOn(veh, true, true)
			Wait(250)
			SetVehicleDirtLevel(veh, 0.0)
			TriggerEvent("QBCore:Notify", Loc[Config.Lan].success["retrieved"]..GetDisplayNameFromVehicleModel(data.spawnName).." ["..GetVehicleNumberPlateText(currentVeh.current).."]", "success")
		end, data.coords, true)
	end
end)

RegisterNetEvent("jim-pizzathis:client:RemSpawn", function(data)
	SetVehicleEngineHealth(currentVeh.current, 200.0)
	SetVehicleBodyHealth(currentVeh.current, 200.0)
	for i = 0, 7 do SmashVehicleWindow(currentVeh.current, i) Wait(150) end PopOutVehicleWindscreen(currentVeh.current)
	for i = 0, 5 do	SetVehicleTyreBurst(currentVeh.current, i, true, 0) Wait(150) end
	for i = 0, 5 do SetVehicleDoorBroken(currentVeh.current, i, false) Wait(150) end
	Wait(800)
	DeleteEntity(currentVeh.current) currentVeh = { out = false, current = nil }
end)

local markerOn = false
RegisterNetEvent("jim-pizzathis:client:Garage:Blip", function(data)
	TriggerEvent("QBCore:Notify", Loc[Config.Lan].info["job_vehicle_map"])
	if markerOn then markerOn = not markerOn end
	markerOn = true
	local carBlip = GetEntityCoords(currentVeh.current)
	if not DoesBlipExist(garageBlip) then
		garageBlip = AddBlipForCoord(carBlip.x, carBlip.y, carBlip.z)
		SetBlipColour(garageBlip, 8)
		SetBlipRoute(garageBlip, true)
		SetBlipSprite(garageBlip, 85)
		SetBlipRouteColour(garageBlip, 3)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Job Vehicle")
		EndTextCommandSetBlipName(garageBlip)
	end
	while markerOn do
		local time = 5000
		local carLoc = GetEntityCoords(currentVeh.current)
		local playerLoc = GetEntityCoords(PlayerPedId())
		if DoesEntityExist(currentVeh.current) then
			if #(carLoc - playerLoc) <= 30.0 then time = 100
			elseif #(carLoc - playerLoc) <= 1.5 then
				RemoveBlip(garageBlip)
				garageBlip = nil
				markerOn = not markerOn
			else time = 5000 end
		else
			RemoveBlip(garageBlip)
			garageBlip = nil
			markerOn = not markerOn
		end
		Wait(time)
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
	for i = 1, #parking do DeleteEntity(parking[i]) end
end)