local QBCore = exports['qb-core']:GetCoreObject()
local VehicleNitrous = {}
local start = os.time()

CreateThread(function()
    while true do
        Wait(1000 * 60)

        local uptime = os.difftime(os.time(), start)
        local hrs = math.floor(uptime / 3600)
        local mins = math.floor((uptime - (hrs * 3600)) / 60)

        local uptimeString = ""
        if hrs > 0 then
            uptimeString = string.format("%d:%02d", hrs, mins)
        else
            uptimeString = string.format("%d minutes", mins)
        end

        SetConvarServerInfo('Uptime', uptimeString)
    end
end)


RegisterNetEvent('tackle:server:TacklePlayer', function(playerId)
    TriggerClientEvent("tackle:client:GetTackled", playerId)
end)

QBCore.Functions.CreateCallback('nos:GetNosLoadedVehs', function(_, cb)
    cb(VehicleNitrous)
end)

-- QBCore.Commands.Add("id", "Check Your ID #", {}, false, function(source)
--     TriggerClientEvent('QBCore:Notify', source,  "ID: "..source)
-- end)

QBCore.Commands.Add("dutycheck", "Check the total duty duration of a citizen", {{name = "citizenid", help = "Citizen ID of the officer to check duty duration for"}}, true, function(source, args)
    local playerId = source
    local citizenid = args[1]
    local player = QBCore.Functions.GetPlayer(playerId)
    print(player.PlayerData.job.isboss)
    if player.PlayerData.job.name == 'police' or  player.PlayerData.job.name == 'ambulance' then
        if player.PlayerData.job.isboss then 
            local query = 'SELECT SUM(duration) AS total_duration FROM duty_logs WHERE citizenid = ?'
            exports.oxmysql:execute(query, {citizenid}, function(result)
                if result[1].total_duration then
                    local totalDuration = result[1].total_duration
                    local hours = math.floor(totalDuration / 3600)
                    local minutes = math.floor((totalDuration % 3600) / 60)
                    local seconds = totalDuration % 60
                    TriggerClientEvent('chat:addMessage', playerId, { args = { '^1Duty Logs', string.format('^7Total duty duration for %s: %02d:%02d:%02d', citizenid, hours, minutes, seconds) } })
                else
                    TriggerClientEvent('chat:addMessage', playerId, { args = { '^1Duty Logs', string.format('^7No duty logs found for %s', citizenid) } })
                end
            end)
        else 
            TriggerClientEvent('QBCore:Notify', source, 'Only for Boss', 'error', 2500)
        end
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Only for Emergency Services', 'error', 2500)
    end
end)

QBCore.Commands.Add("myinfo", "Check Your player info", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('QBCore:Notify', source, 'Char ID: '..Player.PlayerData.cid..' '.. 'Citizen ID: '..Player.PlayerData.citizenid..' '.. "SID: "..source..' '..'Name: '..Player.PlayerData.charinfo.firstname..' '..Player.PlayerData.charinfo.lastname)
end)

QBCore.Commands.Add("fixpedfor", "refreshskin for player (admin only)", {{name = "id", help = "player id"}}, false, function(source, args)
    local src = source
    if args[1] then
        local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if Player then
            TriggerClientEvent("qb-clothing:client:reloadOutfits", Player.PlayerData.source)
            -- TriggerClientEvent("illenium-appearance:client:ClearStuckProps", Player.PlayerData.source)
        else
            TriggerClientEvent('QBCore:Notify', src, "player not online", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "no id specified", "error")
    end
end, "admin")

QBCore.Commands.Add("fixvehicle", "Fix Player Vehicle (admin only)", {{name = "id", help = 'player id'}}, false, function(source, args)
    local src = source
    if args[1] then
        local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
        if Player then
            TriggerClientEvent('iens:repaira', Player.PlayerData.source)
            TriggerClientEvent('vehiclemod:client:fixEverything', Player.PlayerData.source)
        else
            TriggerClientEvent('QBCore:Notify', src, "player not online", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'no id specified', "error")

    end
end, "admin")

QBCore.Commands.Add("dutyreset", "Reset the total duty duration of a citizen", {{name = "citizenid", help = "Citizen ID of the officer to reset duty duration for"}}, true, function(source, args)
    local playerId = source
    local citizenid = args[1]
    local player = QBCore.Functions.GetPlayer(playerId)
    if player.PlayerData.job.name == 'police' or  player.PlayerData.job.name == 'ambulance' then
        if player.PlayerData.job.isboss then 
            local query = 'SELECT SUM(duration) AS total_duration FROM duty_logs WHERE citizenid = ?'
            exports.oxmysql:execute(query, {citizenid}, function(result)
                if result[1].total_duration then
                    exports.oxmysql:execute('DELETE FROM duty_logs WHERE citizenid = ?', {citizenid})
                    TriggerClientEvent('chat:addMessage', playerId, { args = { '^1Duty Logs', string.format('^7Duty duration for %s has been reset.', citizenid) } })
                else
                    TriggerClientEvent('chat:addMessage', playerId, { args = { '^1Duty Logs', string.format('^7No duty logs found for %s', citizenid) } })
                end
            end)
        else 
            TriggerClientEvent('QBCore:Notify', source, 'Only for Boss', 'error', 2500)
        end
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Only for Emergency Services', 'error', 2500)
    end
end)

QBCore.Functions.CreateUseableItem("harness", function(source, item)
    TriggerClientEvent('seatbelt:client:UseHarness', source, item)
end)

RegisterNetEvent('equip:harness', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if not Player.PlayerData.items[item.slot].info.uses then
        Player.PlayerData.items[item.slot].info.uses = Config.HarnessUses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    elseif Player.PlayerData.items[item.slot].info.uses == 1 then
        TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['harness'], "remove")
        Player.Functions.RemoveItem('harness', 1)
    else
        Player.PlayerData.items[item.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('seatbelt:DoHarnessDamage', function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if hp == 0 then
        Player.Functions.RemoveItem('harness', 1, data.slot)
    else
        Player.PlayerData.items[data.slot].info.uses -= 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent('qb-carwash:server:washCar', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end

    if Player.Functions.RemoveMoney('cash', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    elseif Player.Functions.RemoveMoney('bank', Config.DefaultPrice, "car-washed") then
        TriggerClientEvent('qb-carwash:client:washCar', src)
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t("error.dont_have_enough_money"), 'error')
    end
end)

QBCore.Functions.CreateCallback('smallresources:server:GetCurrentPlayers', function(_, cb)
    local TotalPlayers = 0
    local players = QBCore.Functions.GetPlayers()
    for _ in pairs(players) do
        TotalPlayers += 1
    end
    cb(TotalPlayers)
end)
