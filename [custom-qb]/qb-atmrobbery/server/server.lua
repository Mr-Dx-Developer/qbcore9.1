-- QBCore Exports --
local QBCore = exports['qb-core']:GetCoreObject()

-- Remove Money from Player's Balance to purhcase the RFID --
RegisterNetEvent('qb-atmrobbery:server:PurchaseDisruptor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('bank', Config.RFIDPrice, 'RFID Disruptor')
    Player.Functions.AddItem(Config.ATMRequiredItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ATMRequiredItem], 'add', 1)
end)

-- Add Money to Player's Balance Once Hack is Successful --
RegisterNetEvent('qb-atmrobbery:server:AddMoney', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Possibility = Config.LuckyItemPossibility
    local Variation = Config.LuckyItemVariation

    if Possibility == Variation then
        Player.Functions.AddItem(Config.LuckyItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LuckyItem], 'add', 1)
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    else
        Player.Functions.AddMoney('cash', Config.RewardMoney, 'ATM withdrawl')
    end
end)

-- Remove RFID Disruptor on third eye of an ATM --
QBCore.Functions.CreateCallback('qb-atmrobbery:server:RemoveDisruptor', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DisruptorScan = Player.Functions.GetItemByName(item)
    if DisruptorScan then
        cb(true)
        Player.Functions.RemoveItem(Config.ATMRequiredItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ATMRequiredItem], 'remove', 1)
    else
        cb(false)
    end
end)

-- Police Amount On-Duty --
QBCore.Functions.CreateCallback('qb-atmrobbery:server:PoliceInteger', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayers(src)
    local PoliceInteger = 0

    for i = 1, #Player do
        local xPlayer = QBCore.Functions.GetPlayer(Player[i])
        if (xPlayer.PlayerData.job.name == 'police' and xPlayer.PlayerData.job.onduty) then
            PoliceInteger = PoliceInteger + 1
        end
    end

    if PoliceInteger >= Config.RequiredPolice then
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', src, ('Not enough police'), 'error')
    end
end)

-- On Resource Start (Console Notification) --
AddEventHandler('onResourceStart', function(resource)
    if (GetCurrentResourceName() ~= resource) then
        return
    end
    print(resource..' started successfully')
end)