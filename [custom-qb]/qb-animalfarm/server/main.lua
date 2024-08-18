local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-animafarm:server:spawnanimals")
AddEventHandler("qb-animafarm:server:spawnanimals", function()
    local _source = source    
    TriggerClientEvent("qb-animafarm:client:spawnanimals", -1)
end)

QBCore.Commands.Add("spawnanimal", "Spawn Animals", {{"model", "Animal Model"}}, false, function(source, args)
    TriggerClientEvent('qb-animafarm:client:spawnanim', source, args[1])
end, 'god')


RegisterServerEvent('qb-animafarm:server:sellmeat')
AddEventHandler('qb-animafarm:server:sellmeat', function()
    local src = source        
    local Player = QBCore.Functions.GetPlayer(src)    
    local price = 0
	if Player ~= nil then
        if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
            for k, v in pairs(Player.PlayerData.items) do 
                if Player.PlayerData.items[k] ~= nil then 
                    if Config.PriceMeat[Player.PlayerData.items[k].name] ~= nil then 
                        price = price + (Config.PriceMeat[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                        Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    end
                end
            end
           -- Citizen.Wait(2000)   
            Player.Functions.AddMoney("cash", price, "sold-items-hunting")
            TriggerClientEvent('QBCore:Notify', src, "You have sold your items and recieved $"..price)
        else
            TriggerClientEvent('QBCore:Notify', src, "You don't have items")
        end
	end
    Wait(10)
end)


RegisterNetEvent('qb-animafarm:server:AddItems')
AddEventHandler('qb-animafarm:server:AddItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local meatAmount = math.random(1, 3)
    local cowPeltAmount = math.random(1, 3)

    Player.Functions.AddItem("meat", meatAmount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['meat'], "add")

    Player.Functions.AddItem("cowpelt", cowPeltAmount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cowpelt'], "add")
end)