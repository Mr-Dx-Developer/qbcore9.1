local QBCore = exports['qb-core']:GetCoreObject()
local healing = false

local function THXHealBandage()
    if not healing then
        healing = true
    else
        return
    end

    local count = Config.HealingTicks
    while count > 0 do
        Wait(1000)
        count -= 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + Config.HealthPerTick)
    end
    healing = false
end

RegisterNetEvent("ThxPrisonNotify", function(text,type,length)
    QBCore.Functions.Notify(text,type,length)
end)
local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end
local function LoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end
RegisterNetEvent('thx:consumables:client:openbandaids', function(item)
    QBCore.Functions.TriggerCallback('THX:Server:HasBandAidPack', function(bandaid)
        if bandaid then
            local item11 = 'packofbandaids'
            TriggerServerEvent("Thx:Server:ItemStuff", false, item11, 1)
            local PedCoords = GetEntityCoords(PlayerPedId())
            LoadModel("w_ar_carbinerifle_boxmag_luxe")
            bandaidbox = CreateObject(GetHashKey('w_ar_carbinerifle_boxmag_luxe'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
            AttachEntityToEntity(bandaidbox, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.1, 0.0, 0.0, 10.0, 90.0, false, false, false, false, 2, true)
            QBCore.Functions.Progressbar("pickup_sla", "Opening Bandaids..", 2500, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 1,
            }, {}, {}, function() -- Done
                DeleteEntity(bandaidbox)
                local chad = math.random(1,10)
                local item = 'swbandage'
                local item1 = 'kittybandage'
                local item2 = 'shrekbandage'
                local item3 = 'carsbandage'
                local item4 = 'mousebandage'
                local item5 = 'avengersbandage'
                local item6 = 'baconbandage'
                local item7 = 'pokemonbandage'
                local item8 = 'spongebobbandage'
                local item9 = 'toystorybandage'
                local item10 = 'scoobydobandage'
                Wait(1500)
                if chad == 1 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 2 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item1, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 3 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item2, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 4 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item3, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 5 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item5, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 6 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item7, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 7 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item8, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 8 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item9, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 9 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item10, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                elseif chad == 10 then
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item4, 4, 4)
                    TriggerServerEvent("Thx:Server:ItemStuff", true, item6, 1)
                end
                ClearPedTasks(PlayerPedId())   
            end, function()
                TriggerEvent("ThxPrisonNotify","Cancelled..", "error")
                ClearPedTasks(PlayerPedId())
            end)
        end
    end)
end)
RegisterCommand("bandage", function()
        TriggerEvent('Thx:bandage:heal')
        
    end)
RegisterNetEvent("Thx:bandage:heal", function(slut)
    QBCore.Functions.TriggerCallback('THX:Server:HealBandAidPack', function(heal)
        if heal then
            TriggerServerEvent("Thx:Server:ItemStuff", false, slut, 1)
            QBCore.Functions.Progressbar("pickup_sla", "Patching yourself up..", Config.BandageTimer, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_arresting",
                anim = "a_uncuff",
                flags = 49,
            }, {}, {}, function() -- Done
                ClearPedTasks(PlayerPedId())
                THXHealBandage()
            end, function()
                TriggerEvent("ThxPrisonNotify","Cancelled..", "error")
                ClearPedTasks(PlayerPedId())
            end)
        end
    end, slut)
end)