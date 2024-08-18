local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()


local drawn_marker = false
local pos_close = nil
local marker = nil
local openned = false
local notify_open = false

local mission_started = false
local mission_point_start = nil
local mission_point_end = nil
local mission_name = nil
local mission_position = nil
local vehicle = nil
local draw_marker_mission = false
local step = 0

RegisterKeyMapping('OpenStores:'..key_open, 'Open Store', 'keyboard', key_open)
RegisterCommand('OpenStores:'..key_open, function()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
		
	local closest, dist, dist2, position = closestStore()

	if dist < radius_coord then
		if not openned then
			TriggerServerEvent('qb-store3: OpenStore', closest, position.buy_items)
			openned = true
		end
	elseif dist2 < radius_coord then
		if not openned then
			TriggerServerEvent('qb-store3: CheckOwnerStore', closest, position.buy_items)
		end
	end
end)

RegisterNetEvent('qb-store3: OpenStore')
AddEventHandler('qb-store3: OpenStore', function(name, items)
	OpenStore(name, items)
	openned = true
end)

RegisterNetEvent('qb-store3: OpenDashboard')
AddEventHandler('qb-store3: OpenDashboard', function(name, balance)
	OpenDashboard(name, balance)
	openned = true
end)

RegisterNetEvent('qb-store3: OpenBuyStore')
AddEventHandler('qb-store3: OpenBuyStore', function(name)
	OpenBuyStore(name)
	openned = true
end)

function OpenStore(name, items)
	SendNUIMessage({
		open = true,
		store_title = name,
		items = items,
		color_header = stores[name].color_header,
		color_buttons = stores[name].color_buttons
	})

	SetNuiFocus(true, true)
end

function OpenBuyStore(name)
	SendNUIMessage({
		open_buy = true,
		store_title = name,
		color_header = stores[name].color_header,
		color_buttons = stores[name].color_buttons,
		price_store = stores[name].price_store
	})

	SetNuiFocus(true, true)
end

function OpenDashboard(name, balance)
	SendNUIMessage({
		open_dashboard = true,
		store_title = name,
		color_header = stores[name].color_header,
		color_buttons = stores[name].color_buttons,
		price_store = stores[name].price_store,
		percentage_sell = stores[name].percentage_sell
	})

	SetNuiFocus(true, true)
end

CreateThread(function()
	while true do
		local ped = GetPlayerPed(-1)
		local pos = GetEntityCoords(ped)
		
		local closest, dist, dist2, position = closestStore()
		
		if dist < radius_coord then
			if not notify_open then
				--Notify(translate.TR_PRESS_BUTTON .. key_open)
				 QBCore.Functions.Notify(translate.TR_PRESS_BUTTON, "success")
				notify_open = true
			end
		elseif dist2 < radius_coord then
			if not notify_open then
				--Notify(translate.TR_PRESS_BUTTON .. key_open)
				QBCore.Functions.Notify(translate.TR_PRESS_BUTTON, "success")
				notify_open = true
			end
		elseif dist < 50.0 then
			pos_close = position
			marker = stores[closest].marker
			drawn_marker = true
			openned = false
			notify_open = false
		else
			drawn_marker = false					
			pos_close = nil
			marker = nil
			openned = false
			notify_open = false
		end

		if mission_started then
			if step == 0 then
				local dist_start = #(pos - mission_point_start)
				if dist_start < radius_coord then
					local veh = GetVehiclePedIsIn(ped, false)

					if veh ~= 0 then
						step = 1
						
						---Notify(translate.TR_WAIT_PRODUCTS)
						QBCore.Functions.Notify(translate.TR_WAIT_PRODUCTS, "success")
						SetTimeout(2000, function()
							vehicle = GetEntityModel(veh)
							DeleteWaypoint()
							SetNewWaypoint(mission_point_end.x, mission_point_end.y)
							---Notify(translate.TR_GO_STORE)
							QBCore.Functions.Notify(translate.TR_GO_STORE, "success")
						end)
					end

				elseif dist_start < 50.0 then
					draw_marker_mission = true
				else
					draw_marker_mission = false
				end
			elseif step == 1 then
				local dist_end = #(pos - mission_point_end)
				if dist_end < radius_coord then
					local veh = GetVehiclePedIsIn(ped, false)

					if veh ~= 0 then
						if vehicle == GetEntityModel(veh) then
							TriggerServerEvent('qb-store3: CompleteMission', mission_name, mission_position.buy_items)

							mission_started = false
							mission_point_start = nil
							mission_point_end = nil
							mission_name = nil
							mission_position = nil
							vehicle = nil
							draw_marker_mission = false
							step = 0
						end
					end

				elseif dist_end < 50.0 then
					draw_marker_mission = true
				else
					draw_marker_mission = false
				end
			end
		end
		
		Wait(2000)
	end
end)

CreateThread(function()
	while true do
		local sleep = 0
		if drawn_marker then
			sleep = 0

			pos_buy_items = pos_close.buy_items
			pos_buy_store = pos_close.buy_store

			DrawMarker(marker, pos_buy_items.x, pos_buy_items.y, pos_buy_items.z-0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			DrawMarker(marker, pos_buy_store.x, pos_buy_store.y, pos_buy_store.z-0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 0, 255, 0, 100, false, true, 2, false, false, false, false)
		else
			sleep = 1000
		end

		if draw_marker_mission then
			sleep = 0

			DrawMarker(2, mission_point_start.x, mission_point_start.y, mission_point_start.z-0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 0, 255, 0, 100, false, true, 2, false, false, false, false)
			DrawMarker(2, mission_point_end.x, mission_point_end.y, mission_point_end.z-0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 0, 255, 0, 100, false, true, 2, false, false, false, false)
		end

		Wait(sleep)
	end
end)

RegisterNetEvent('qb-store3: SendPopMessage')
AddEventHandler('qb-store3: SendPopMessage', function(type, message)
	SendNUIMessage({
		pop_up = true,
		type = type,
		message = message
	})
end)

RegisterNetEvent('qb-store3: LoadBalance')
AddEventHandler('qb-store3: LoadBalance', function(money)
	SendNUIMessage({
		loadBalance = true,
		money = money
	})
end)

RegisterNetEvent('qb-store3: LoadStock')
AddEventHandler('qb-store3: LoadStock', function(stock, products)
	SendNUIMessage({
		loadStock = true,
		stock = stock,
		products = products
	})
end)

RegisterNetEvent('qb-store3: LoadMissions')
AddEventHandler('qb-store3: LoadMissions', function(missions, identifier)
	SendNUIMessage({
		loadMissions = true,
		request = missions,
		identifier = identifier
	})
end)

RegisterCommand('tpr', function()
	SetEntityCoords(GetPlayerPed(-1), mission_point_start)
end)

RegisterNetEvent('qb-store3: AcceptMission')
AddEventHandler('qb-store3: AcceptMission', function(name, item_name)
	if not mission_started then
		local closest, dist, dist2, position = closestStore()

		mission_name = name		
		mission_position = position
		mission_point_end = position.mission

		if missions_coords[item_name] then
			local rand_point = math.random(1, #missions_coords[item_name])
			mission_point_start = missions_coords[item_name][rand_point]
		else
			local rand_point = math.random(1, #missions_coords['RANDOM_MISSION'])
			mission_point_start = missions_coords['RANDOM_MISSION'][rand_point]
		end

		-- print(mission_point_start)

		DeleteWaypoint()
		SetNewWaypoint(mission_point_start.x, mission_point_start.y)

		mission_started = true
	end
end)

RegisterNetEvent('qb-store3: CancelMission')
AddEventHandler('qb-store3: CancelMission', function()
	mission_started = false
	mission_point_start = nil
	mission_point_end = nil
	mission_name = nil
	mission_position = nil
	vehicle = nil
	draw_marker_mission = false
	step = 0

	DeleteWaypoint()
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
	openned = false
	cb('ok')
end)

RegisterNUICallback('buyItens', function(data, cb)
	local closest, dist, dist2, position = closestStore()

	TriggerServerEvent("qb-store3: BuyItens", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendBuyStore', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendBuyStore", closest, position.buy_items)
	cb('ok')
end)

RegisterNUICallback('sendSellStore', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendSellStore", closest, position.buy_items)
	cb('ok')
end)

RegisterNUICallback('sendAddMoney', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendAddMoney", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendWithdraw', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendWithdraw", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendPutForSale', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendPutForSale", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendRequestItem', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendRequestItem", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendRemoveItem', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendRemoveItem", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('sendChangePrice', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: SendChangePrice", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('acceptMission', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: AcceptMission", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('cancelMission', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: CancelMission", closest, position.buy_items, data)
	cb('ok')
end)

RegisterNUICallback('loadBalance', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: LoadBalance", closest, position.buy_items)
	cb('ok')
end)

RegisterNUICallback('loadStock', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: LoadStock", closest, position.buy_items)
	cb('ok')
end)

RegisterNUICallback('loadMissions', function(data, cb)
	local closest, dist, dist2, position = closestStore()
	
	TriggerServerEvent("qb-store3: LoadMissions", closest, position.buy_items)
	cb('ok')
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	Wait(5000)
	
	SendNUIMessage({
        config = true,
        translate = translate,
		weightSystem = use_weight_system,
        NameResource = {GetCurrentResourceName(),
		GetCurrentServerEndpoint()
		}
    })

	for i,k in pairs(stores) do
		if k.use_blip then
			for c,j in pairs(k.coordinates) do
				local blip = AddBlipForCoord(j.buy_items.x, j.buy_items.y, j.buy_items.z)
				SetBlipSprite(blip, k.blip)
				SetBlipColour(blip, k.blip_color)
				SetBlipAsShortRange(blip, true)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(k.blip_name)
				SetBlipScale(blip, 0.70)
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

function closestStore()
	local ped = GetPlayerPed(-1)
	local pos = GetEntityCoords(ped)
	local min = 99999
	local buy = 99999

	local closest = -1
	local position = nil

	for i,k in pairs(stores) do
		for c,j in pairs(k.coordinates) do
			local dist = #(j.buy_items - pos)

			if dist < min then
				closest = i
				min = dist
				buy = #(j.buy_store - pos)
				position = j
			end
		end
	end

	return closest, min, buy, position
end

function Notify(message)
    TriggerEvent('esx:Notify', message)
    TriggerEvent('chat:addMessage', { args = { message }})
end