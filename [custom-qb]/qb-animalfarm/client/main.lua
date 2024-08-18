local QBCore = exports['qb-core']:GetCoreObject()

local isPressed = false
local entity_local = 0
function SellingBlips()
    for _, v in pairs(Config.SellSpots) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 141)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 49)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Sell Meat")
        EndTextCommandSetBlipName(blip)
    end
end

function ShowHelpMsg(msg)   
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)   
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end


Citizen.CreateThread(function()
    SellingBlips()  
    exports['qb-target']:AddTargetModel('a_c_cow', {
        options = {
            {
                event = "qb-animafarm:getanimalmeat",
                icon = "fas fa-hands",
                label = "Harvest",
                canInteract = function(entity)
                if (tonumber(GetEntityHealth(entity)) < 1 )  then
                    entity_local = entity
                    return IsEntityDead(entity)
                    end
                end,
            },
        },
        distance = 2.5,
    })
    while true do
        local ped = PlayerPedId()  

        for _, v in pairs(Config.SellSpots) do
            local pos = GetEntityCoords(ped)
            if #(vector3(pos.x, pos.y, pos.z)-vector3(v.x, v.y, v.z)) < 8 then
                DrawMarker(20, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.5, 0.5,-0.25, 255, 60, 60, 150, 1, 1, 2, 0, 0, 0, 0)
                if #(vector3(pos.x, pos.y, pos.z)-vector3(v.x, v.y, v.z)) < 2 then                    
                    ShowHelpMsg('Press ~INPUT_PICKUP~ to Sell Hunting Items.')
                    if IsControlJustPressed(0, 38) then
                        TriggerServerEvent('qb-animafarm:server:sellmeat')
                    end
                end
            end
        end
        Citizen.Wait(4)
    end
end)



RegisterNetEvent('qb-animafarm:getanimalmeat')
AddEventHandler('qb-animafarm:getanimalmeat', function(data)
    loadAnimDict('amb@medic@standing@kneel@base')
    loadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(GetPlayerPed(-1),"amb@medic@standing@kneel@base","base", 8.0, -8.0, -1, 1, 0,false, false, false)
    TaskPlayAnim(GetPlayerPed(-1),"anim@gangops@facility@servers@bodysearch@","player_search", 8.0, -8.0, -1,48, 0, false, false, false)                                                
    isPressed = true
    QBCore.Functions.Progressbar("harv_anim", "Harvesting Animal", 5000, false, false, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        ClearPedTasks(GetPlayerPed(-1))
        TriggerServerEvent('qb-animafarm:server:AddItems')
        DeleteEntity(entity_local)
        entity_local = 0
    end, function() -- Cancel
        ClearPedTasks(GetPlayerPed(-1))
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)


RegisterNetEvent('qb-animafarm:client:spawnanim')
AddEventHandler('qb-animafarm:client:spawnanim', function(model)
    model           = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
        CreatePed(5, model, x, y, z, 0.0, true, false)
    end)
end)
