local isAiming, isDefaultName, currentCrosshair = false, false, 1

CreateThread(function()
    if GetCurrentResourceName() == 'qb-crosshair' then
        isDefaultName = true
        local cachedCrosshair = GetResourceKvpInt('crosshair')
        if cachedCrosshair > 0 then
            currentCrosshair = cachedCrosshair
        end
    end
    for i = 1, 13 do
        SendNUIMessage({type = "DisplayCrosshair", enable = false, style = i})
        Wait(0)
    end
    CreateThread(function()
        while true do
            HideHudComponentThisFrame(14)
            Wait(7)
        end
    end)
    while true do
        ManageReticle()
        Wait(250)
    end
end)

-- RegisterKeyMapping(Config["UseCommand"]["Command"], "Open crosshair using " .. Config["Hotkey"]["Key"], "keyboard", Config["Hotkey"]["Key"])
RegisterCommand(Config["UseCommand"]["Command"], function()
    CrossHair()
end, false)

CrossHair = function()
    SetNuiFocus(true, true)
    SendNUIMessage({type = "EnableCrosshairMenu", enable = true})
end

ManageReticle = function()
    if not IsEntityDead(PlayerPedId()) then
        if (IsPlayerFreeAiming(PlayerId())) then
            if not isAiming then
                SendNUIMessage({type = "DisplayCrosshair", enable = true, style = currentCrosshair})
                isAiming = true
            end
        else
            if isAiming then
                SendNUIMessage({type = "DisplayCrosshair", enable = false, style = currentCrosshair})
                isAiming = false
            end
        end
    end
end

RegisterNUICallback('escape', function(data, cb)
    SetNuiFocus(false, false)    
    SendNUIMessage({type = "EnableCrosshairMenu", enable = false})
    cb('ok')
end)

RegisterNUICallback('setCrosshair', function(data, cb)
    crosshairIndex = tonumber(data['crosshairIndex'])

    currentCrosshair = crosshairIndex
    if isDefaultName then
        SetResourceKvpInt('crosshair', currentCrosshair)
    end
    cb('ok')
end)

-- discord.gg/qbcoreframework -- QBCore#4011 Only Buy From Him