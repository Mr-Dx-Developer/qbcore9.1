local QBCore = exports['qb-core']:GetCoreObject()

-- [ MAIN ] --

local shopItems = Config.Items

local function toggleField(enable)
    SetNuiFocus(enable, enable)

    if enable then
        SendNUIMessage({
            action = 'open'
        })
    else
        SendNUIMessage({
            action = 'close'
        })
    end
end

RegisterNUICallback('escape', function(data, cb)
    toggleField(false)
    SetNuiFocus(false, false)

    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
    local shoppingCart = data.shoppingCart
    local totalprice = 0
    for item, v in pairs(shoppingCart) do
        local configItem = shopItems[item]
        totalprice += (v.amount * configItem.price)
    end

    if (ESX) then
        ESX.TriggerServerCallback('qb-shop:canAfford', function(bool)
            if (bool) then
                Config.Notification(Config.Locale.buyed:format(totalprice), 'success')
            else
                Config.Notification(Config.Locale.nomoney, 'error')
            end
            SetNuiFocus(not bool, not bool)
            cb(bool)
        end, totalprice, shoppingCart)
    elseif (QBCore) then
        QBCore.Functions.TriggerCallback('qb-shop:canAfford', function(bool)
            if (bool) then
                Config.Notification(Config.Locale.buyed:format(totalprice), 'success')
            else
                Config.Notification(Config.Locale.nomoney, 'error')
            end
            SetNuiFocus(not bool, not bool)
            cb(bool)
        end, totalprice, shoppingCart)
    end
end)

local function addItem(category, item, display, price, description)
    SendNUIMessage({
        action = 'add',
        category = category,
        item = item,
        display = display,
        price = price,
        description = description,
    })
end

local function ShowHelpNotification(msg)
    AddTextEntry('shopsHelpNotification', msg)
    DisplayHelpTextThisFrame('shopsHelpNotification', false)
end

CreateThread(function()
    while true do
        local msec = 750
        local pCoords = GetEntityCoords(PlayerPedId())
        for key, value in pairs(Config.Shops) do
            local dist = #(pCoords - vector3(value.x, value.y, value.z))
            if (dist <= 20.0) then
                msec = 0
                -- DrawMarker(20, vector3(value.x, value.y, value.z + 1), 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, true, false, false, false)
                if dist <= 1.5 then
                    if not displayedText then
                        exports['qb-core']:DrawText("PRESS [E] TO OPEN SHOP", 'left')
                        displayedText = true
                    end

                    if IsControlJustReleased(0, 38) then
                        SendNUIMessage({
                            action = 'clear'
                        })
                        for item, value2 in pairs(shopItems) do
                            addItem(value2.category, item, value2.display, value2.price, value2.description)
                        end
                        toggleField(true)
                        exports['qb-core']:HideText()
                        displayedText = false
                    end
                else
                    displayedText = false
                    exports['qb-core']:HideText()
                end
            end
        end
        Wait(msec)
    end
end)

local activeBlips = {} -- Table to store active blips

CreateThread(function()
    local playerPed = PlayerPedId()

    while true do
        Wait(1000) -- Adjust the interval as needed

        local playerCoords = GetEntityCoords(playerPed)

        -- Remove blips that are no longer within the radius
        for k, blip in pairs(activeBlips) do
            local coords = Config.Shops[k]
            local distance = GetDistanceBetweenCoords(playerCoords, coords.x, coords.y, coords.z, true)

            if distance > Config.BlipRadius then
                RemoveBlip(blip)
                activeBlips[k] = nil
            end
        end

        -- Add blips for shops within the radius
        for k, coords in pairs(Config.Shops) do
            if not activeBlips[k] then
                local distance = GetDistanceBetweenCoords(playerCoords, coords.x, coords.y, coords.z, true)

                if distance <= Config.BlipRadius then
                    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                    SetBlipSprite(blip, 59)
                    SetBlipScale(blip, 0.6)
                    SetBlipDisplay(blip, 4)
                    SetBlipAsShortRange(blip, true)

                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(coords.blipname)
                    EndTextCommandSetBlipName(blip)

                    activeBlips[k] = blip
                end
            end
        end
    end
end)
