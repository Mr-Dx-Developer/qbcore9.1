local QBCore = exports['qb-core']:GetCoreObject()
local webhook = "https://discord.com/api/webhooks/977955273526370395/LhY6LDyyhdr5VaIBRm6ANSG4PIaLsOCGxj8aImIwHXT1r40PQn2HQYAUZP9OUcjFT2ol"


RegisterNetEvent("qb-camera:server:getimage", function(url, name)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player.Functions.RemoveItem("polaroid_paper", 1) then
        TriggerClientEvent('QBCore:Notify', src, "You don't have any polaroid paper", "error")
        return
    end

    Player.Functions.AddItem("polaroid", 1, false, {url = url, name = name, date = os.date("%d-%m-%Y")})
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["polaroid"], "add")
end)

QBCore.Functions.CreateCallback('qb-camera:server:webhook', function(source, cb, args)
    cb(webhook)
end)

QBCore.Functions.CreateUseableItem('polaroid_camera', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("qb-camera:client:camera", src)
    end
end)

QBCore.Functions.CreateUseableItem('polaroid', function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("qb-camera:client:showImage", src, item.info.url, item.info.name, item.info.date)
    end
end)
