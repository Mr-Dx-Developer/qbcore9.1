local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-box:client:ComprarCaixa', function(args, data)
    local args = tonumber(args)

    if args == 1 then
        TriggerServerEvent('qb-box:server:ComprarPequena')
    elseif args == 2 then
        TriggerServerEvent('qb-box:server:ComprarMedia')
    elseif args == 3 then
        TriggerServerEvent('qb-box:server:ComprarGrande')
    elseif args == 4 then
        TriggerServerEvent('qb-box:server:ComprarSuper')
    end
end)

RegisterNetEvent('qb-box:client:ComprarCaixas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Mysterious Shop",
            isMenuHeader = true,
        },
        {
            header = "< Close Menu",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items['mystery_smallbox'].image.." width=35px style='margin-right: 10px'> Small Mystery Box",
            txt = "Price: 100$",
            params = {
                event = "qb-box:client:ComprarCaixa",
                args = 1,
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items['mystery_mediumbox'].image.." width=35px style='margin-right: 10px'> Medium Mystery Box",
            txt = "Price: 500$",
            params = {
                event = "qb-box:client:ComprarCaixa",
                args = 2,
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items['mystery_bigbox'].image.." width=35px style='margin-right: 10px'> Big Mystery Box",
            txt = "Price: 1000$",
            params = {
                event = "qb-box:client:ComprarCaixa",
                args = 3,
            }
        },
        {
            header = "<img src=nui://qb-inventory/html/images/"..QBCore.Shared.Items['mystery_expensivebox'].image.." width=35px style='margin-right: 10px'> Super Mystery Box",
            txt = "Price: 3000$",
            params = {
                event = "qb-box:client:ComprarCaixa",
                args = 4,
            }
        },
    })
end)


RegisterNetEvent('qb-box:client:AbrirPequena', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_cs_box_clothes`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
    QBCore.Functions.Progressbar('name_here', 'OPENING MYSTERY BOX...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj)

        TriggerServerEvent('qb-box:server:removemystery_smallbox')

        TriggerServerEvent('qb-box:server:RewardPequena')
    end)
end)

RegisterNetEvent('qb-box:client:AbrirMedia', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_cs_cardbox_01`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
    QBCore.Functions.Progressbar('name_here', 'OPENING MYSTERY BOX...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj)

        TriggerServerEvent('qb-box:server:removemystery_mediumbox')
        TriggerServerEvent('qb-box:server:RewardMedia')
    end)
end)

RegisterNetEvent('qb-box:client:AbrirGrande', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_cs_rub_box_01`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
    QBCore.Functions.Progressbar('name_here', 'OPENING MYSTERY BOX...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj)

        TriggerServerEvent('qb-box:server:removemystery_bigbox')

        TriggerServerEvent('qb-box:server:RewardGrande')
    end)
end)

RegisterNetEvent('qb-box:client:AbrirSuper', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_cardbordbox_04a`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
    QBCore.Functions.Progressbar('name_here', 'OPENING MYSTERY BOX...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj)

        TriggerServerEvent('qb-box:server:removemystery_expensivebox')
        TriggerServerEvent('qb-box:server:RewardSuper')
    end)
end)