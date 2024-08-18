local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('skillsystem:fetchStatus', function(source, cb)
	local Player = QBCore.Functions.GetPlayer(source)
 
	if Player then
		local status = MySQL.scalar.await('SELECT skills FROM players WHERE citizenid = ?', {Player.PlayerData.citizenid})
		if status ~= nil then
			cb(json.decode(status))
		else
			cb(nil)
		end
	else
		cb()
	end
 end)
 
RegisterServerEvent('skillsystem:update')
AddEventHandler('skillsystem:update', function (data)
     local Player = QBCore.Functions.GetPlayer(source)
     --print(data)

	 MySQL.query('UPDATE players SET skills = @skills WHERE citizenid = @citizenid', {
		['@skills'] = data,
		['@citizenid'] = Player.PlayerData.citizenid
	})
end)

RegisterServerEvent('qb-gym:checkChip', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Player.Functions.GetItemByName('fitness_subscription').amount
	
	if quantity > 0 then
		TriggerClientEvent('qb-gym:trueMembership', src) -- true
	else
		TriggerClientEvent('qb-gym:falseMembership', src) -- false
	end
end)

RegisterServerEvent('qb-gym:buyMembership', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
	if Player.PlayerData.money.cash >= Config.MmbershipCardPrice then
        Player.Functions.RemoveMoney('cash', Config.MmbershipCardPrice)
        Player.Functions.AddItem(Config.MmbershipCardPrice, 1)	
        TriggerClientEvent('QBCore:Notify', src, 'You have paid for a gym membership', 'success', 3000)
		TriggerClientEvent('qb-gym:trueMembership', src) -- true
	else
        TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money, you need '.. Config.MmbershipCardPrice, 'error', 3000)

	end	
end)

RegisterNetEvent("qb-gym:server:buyTicket")
AddEventHandler("qb-gym:server:buyTicket", function(ticket)
    local src = source
    local data = Config.ticketPrice[ticket]
    local Player = QBCore.Functions.GetPlayer(source)
    local moneyPlayer = tonumber(Player.PlayerData.money.bank)
    if moneyPlayer > data.price then
        Player.Functions.RemoveMoney("bank", tonumber(data.price), "gym-ticket")
        if Player.Functions.GetItemByName(ticket) then
            TriggerClientEvent("qb-gym:clientticketResult", source, ticket)
        else
            local info = {
                owner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
                cardtime = Config.ticketPrice[ticket].time
            }
            Player.Functions.AddItem(ticket, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ticket], "add", 1) 
            TriggerClientEvent("qb-gym:clientticketResult", source, ticket)
            TriggerClientEvent('QBCore:Notify', source, "You bought "..ticket.." subscription", "success")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "! You dont have enough money", "error")
    end
end)

