
local QBCore = exports['qb-core']:GetCoreObject()
local onlineplayers = 0
local resourceismi = tostring(GetCurrentResourceName())

sethud = function(hangieleman ,data)
    local lisans = string.sub(hangieleman, 9)

    local savebilgi = SaveResourceFile(resourceismi,  "players/"..lisans..".json", data, -1)
    return savebilgi
end

gethud = function(hangieleman)
    local lisans = string.sub(hangieleman, 9)
    
    local loadbilgi = LoadResourceFile(resourceismi, "players/"..lisans..".json")
    if loadbilgi then return loadbilgi else return "[]" end
end

RegisterServerEvent('bp_hud:getbankcash')
AddEventHandler('bp_hud:getbankcash', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    if xPlayer then
        local bank = xPlayer.PlayerData.money["bank"]
        local cash = xPlayer.PlayerData.money['cash']

        TriggerClientEvent('bp_hud:sendinfobank', src, bank, cash)
    end
end)


RegisterServerEvent('bp_hud:setgethudinfo')
AddEventHandler('bp_hud:setgethudinfo', function()
    local src = source 
    local xPlayer = QBCore.Functions.GetPlayer(src)
    
    if xPlayer then
        local hudinfo = json.decode(gethud(xPlayer.PlayerData.citizenid))
   
        if json.encode(hudinfo) == "[]" then
            sethud(xPlayer.PlayerData.citizenid, json.encode(Config.hudd))
            TriggerClientEvent('bp_hud:confirmhudinfos', src, Config.hudd)
        else
            TriggerClientEvent('bp_hud:confirmhudinfos', src, hudinfo)
        end
    end
end)





Citizen.CreateThread(function()

    while true do
        Citizen.Wait(tonumber(Config.serverchecktime) * 60 * 1000)
    
        local xPlayers = QBCore.Functions.GetPlayers()
        
        onlineplayers = #xPlayers
    end




end)



RegisterServerEvent('bp_hud:updatehudsettinbgs')
AddEventHandler('bp_hud:updatehudsettinbgs', function(data)
    local src = source 
    local xPlayer = QBCore.Functions.GetPlayer(src)

    -- Check if xPlayer is not nil
    if not xPlayer then
        return
    end

    sethud(xPlayer.PlayerData.citizenid, json.encode(data))
    TriggerClientEvent('bp_hud:confirmhudinfos', src, data)
end)



RegisterServerEvent('bp_hud:getonlines')
AddEventHandler('bp_hud:getonlines', function()
    local src = source


  
    TriggerClientEvent('bp_hud:sendonline', src, onlineplayers)
   
end)





RegisterServerEvent('bp_hud:resethud')
AddEventHandler('bp_hud:resethud', function()
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

  
        local hudd = {}
        hudd.weapon = true
        hudd.needhud = {['iconcolor'] = "#FFFFFF", ['textstate'] = true, ['progcolor'] = "#f3a84f", ['position'] = "right-center", ['style']= "normal", ['size'] = 1.0, ['hudstate'] = true}
        hudd.bankcash = {['iconcolor'] = "#FFFFFF", ['progcolor'] = "#f3a84f", ['position'] = "right-top", ['size'] = 1.0, ['hudstate'] = true}
        hudd.topmenu = {['logostate'] = true, ['onlinestate'] = true, ['timestate'] = true}
        hudd.vehmenu = {['iconcolor'] = "#FFFFFF", ['progcolor'] = "#f3a84f", ['position'] = "right-bottom", ['size'] = 1.0}
        hudd.mapstyle = 'normal'
        -- hudd.hudstyle = 'normal'


        sethud(xPlayer.PlayerData.citizenid,json.encode(hudd))
        TriggerClientEvent('bp_hud:confirmhudinfos', src,hudd)


  
   
end)

