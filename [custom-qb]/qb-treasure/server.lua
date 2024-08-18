local QBCore = exports['qb-core']:GetCoreObject()

local function GenerateScannerMetadata()
    local info = {
        location = Config.locations[math.random(#Config.locations)]
    }
    return info    
end

------------car as item --------------------------

QBCore.Functions.CreateUseableItem("neon", function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local HasItem = QBCore.Functions.HasItem('t20')

    Player.Functions.AddItem(HasItem, 1)
    -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['t20'], "add")
    TriggerClientEvent('mb-car:client:remove', source)
end)

QBCore.Functions.CreateUseableItem("t20", function(source)
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.RemoveItem("t20", 1)
    TriggerClientEvent('mb-car:client:uset20', source)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['t20'], "remove")
end)


-----------------------------------------------------

QBCore.Commands.Add("givescanner", "Give Player Treasure Scanner (Admin Only)", {{name = "id", help = "Player ID"}}, false, function(source, args)
    local playerId = args[1] ~= '' and tonumber(args[1]) or source
    local Player = QBCore.Functions.GetPlayer(playerId)

    if Player then
        local info = GenerateScannerMetadata()
        if Player.Functions.AddItem("digiscanner", 1, nil, info) then
            QBCore.Functions.Notify(source, "Succuessfully given scanner to ".. GetPlayerName(playerId), "success")
        else
            QBCore.Functions.Notify(source, "Player Inventory Full", "error")
        end
    else
        QBCore.Functions.Notify(source, "No Player Found", "error")
    end

end, "admin")

QBCore.Functions.CreateUseableItem("digiscanner", function(source, item)
    if item.info == nil or item.info.location == nil then 
        QBCore.Functions.Notify(source, "Item metadata error", "error")
        return
    end
    TriggerClientEvent("qb-treasure_cl:toggleScanner", source, item.info.location)
end)

QBCore.Functions.CreateUseableItem("shovel", function(source, item)
    TriggerClientEvent("qb-treasure_cl:digAnim", source)
end)

RegisterNetEvent("qb-treasure_sv:completeDig", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))

    local scanners = Player.Functions.GetItemsByName("digiscanner")
    if #scanners == 0 then return end

    for i=1, #scanners do
        if scanners[i].info and scanners[i].info.location then
            local targetCoords = scanners[i].info.location
            if #(playerCoords - vec3(targetCoords.x, targetCoords.y, targetCoords.z)) < 2.5 then
                if Player.Functions.RemoveItem("digiscanner", 1, scanners[i].slot) then
                    TriggerClientEvent("qb-treasure_cl:treasureAnim", src)
                    
                    SetTimeout(6000, function()                        
                        local rolls = math.random(Config.minRolls, Config.maxRolls)
                        for i=1, rolls do
                            local loot = Config.loot[math.random(#Config.loot)]
                            local lootAmt = math.random(loot.min, loot.max)
                            
                            Player.Functions.AddItem(loot.item, lootAmt)
                            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[loot.item], "add")
                        end
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["digiscanner"], "remove")
                    end)

                end
                break
            end
        end
    end
end)

exports("GenerateScannerMetadata", GenerateScannerMetadata)