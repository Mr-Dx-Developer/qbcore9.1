if AK4Y.Framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif AK4Y.Framework == "oldqb" then 
    QBCore = nil
end

Citizen.CreateThread(function()
    if AK4Y.Framework == "oldqb" then 
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
	elseif AK4Y.Framework == "qb" then
		while QBCore == nil do
            Citizen.Wait(200)
        end
    end
	Wait(4000)
	SendNUIMessage({
		type = 'setJs', 
		vehicles = AK4Y.Vehicles,
		categories = AK4Y.Categories,
		helicopters = AK4Y.Helicopters,
		weapons = AK4Y.Weapons,
		items = AK4Y.Items,
		moneys = AK4Y.Money,
		customItems = AK4Y.Customize,
		customPlatePrice = AK4Y.CustomPlatePriceOnBuyVehicle,
		minCharForPhone = AK4Y.MinCharForPhoneNumber,
		minCharForPlate = AK4Y.MinCharForPlate,
		maxCharForPhone = AK4Y.MaxCharForPhoneNumber,
		maxCharForPlate = AK4Y.MaxCharForPlate,
		credits = AK4Y.BuyCredits,
		language = AK4Y.Translate,
	})	
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
end)

local openMenuSpamProtect = 0
RegisterCommand(AK4Y.OpenMenuCommand, function()
	if openMenuSpamProtect <= GetGameTimer() then 
		openMenuSpamProtect = GetGameTimer() + 1000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getPlayerDetails", function(result)
			SetNuiFocus(true,true)
			SendNUIMessage({
				type = 'openUi', 
				currentCredit = result.playerData.credit,
				firstName = result.charInfo.firstname,
				lastName = result.charInfo.lastname,
			})	
		end)
	else
		AK4Y.ClientNotify(AK4Y.Translate.openSpam, "error")
	end
end)

RegisterKeyMapping(AK4Y.OpenMenuCommand, 'VIP Sistemini Aç', 'keyboard', 'F10')

local sendInputSpamProtect = 0
RegisterNUICallback('sendInput', function(data, cb)
	if sendInputSpamProtect <= GetGameTimer() then
		sendInputSpamProtect = GetGameTimer() + 2000 
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:sendInput", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getVehicleSpamProtect = 0
RegisterNUICallback('getVehicle', function(data, cb)
	if getVehicleSpamProtect <= GetGameTimer() then
		getVehicleSpamProtect = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getVehicle", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getWeaponSpamProtect = 0
RegisterNUICallback('getWeapon', function(data, cb)
	if getWeaponSpamProtect <= GetGameTimer() then
		getWeaponSpamProtect = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getWeapon", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getItemSpamProtect = 0
RegisterNUICallback('getItem', function(data, cb)
	if getItemSpamProtect <= GetGameTimer() then
		getItemSpamProtect = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getItem", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end
end)

local getMoneySpamProtect = 0
RegisterNUICallback('getMoney', function(data, cb)
	if getMoneySpamProtect <= GetGameTimer() then
		getMoneySpamProtect = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getMoney", function(result)
			if result then 	
				cb(result)
			else
				cb(false)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end	
end)

local getCustomPlate = 0
RegisterNUICallback('getCustomPlate', function(data, cb)
	if getCustomPlate <= GetGameTimer() then
		getCustomPlate = GetGameTimer() + 2000
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			local oldPlate = GetVehicleNumberPlateText(veh)
			QBCore.Functions.TriggerCallback("ak4y-donateSystem:getCustomPlate", function(result)
				if result then 	
					local newPlate = data.input
					SetVehicleNumberPlateText(veh, data.input)
					if AK4Y.GiveAddKeys then 
						AK4Y.GiveAddKeysFunction(newPlate)
					end
					cb(true)
				else
					cb(AK4Y.Translate.errorDuringPurchase)
				end
			end, data, oldPlate)
		else
			cb(AK4Y.Translate.insideVehicle)
		end
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end	
end)

local getPrivNumber = 0
RegisterNUICallback('getPrivNumber', function(data, cb)
	if getPrivNumber <= GetGameTimer() then
		getPrivNumber = GetGameTimer() + 2000
		QBCore.Functions.TriggerCallback("ak4y-donateSystem:getPrivNumber", function(result)
			if result then 	
				cb(true)
			else
				cb(AK4Y.Translate.errorDuringPurchase)
			end
		end, data)
	else
		AK4Y.ClientNotify(AK4Y.Translate.spamNotify, "error")
		cb(false)
	end	
end)

RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus(false, false)
end)