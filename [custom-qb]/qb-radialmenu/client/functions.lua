QBCore = exports['qb-core']:GetCoreObject()



-- Global Variables

kilitac = false

-- Important Functions

function GetClosestPlayerMenu()
    local player, distance = QBCore.Functions.GetClosestPlayer()
    if distance ~= -1 and distance <= 3.0 then
        return true, GetPlayerServerId(player)
    else
        return false
    end
end

-- Araç Çevirme
RegisterNetEvent('arac-cevir')
AddEventHandler('arac-cevir', function()
    local playerped = PlayerPedId()
    if not IsPedInAnyVehicle(playerped) then
        local PlayerCoords = GetEntityCoords(playerped)
        local arac, mesafe = QBCore.Functions.GetClosestVehicle(PlayerCoords)
        if mesafe < 5 then
            QBCore.Functions.Progressbar("arac-cevir", "Araç Çevriliyor", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() 
                SetVehicleOnGroundProperly(arac)
            end, function() 
            end)
        else
            QBCore.Functions.Notify("Etrafında Araç Yok!") 
        end
	else
		QBCore.Functions.Notify("Araç İçindeki İken Bu İşlemi Gerçekleştiremezsin.") 
	end
end)


-- Functions
function deleteVeh(veh)
    SetVehicleHasBeenOwnedByPlayer(veh, true)
    NetworkRequestControlOfEntity(veh)
    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

    QBCore.Functions.Progressbar("arac_cek", "Araç Çekiliyor...", 3000, false, false,
        { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {}, {}, {}, function() -- Done
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
            DeleteEntity(veh)
            DeleteVehicle(veh)
            SetEntityAsNoLongerNeeded(veh)
            ClearPedTasksImmediately(PlayerPedId())
        end, function() -- Cancel
            ClearPedTasksImmediately(PlayerPedId())
        end)
end

-- Events
RegisterNetEvent('qb-radialmenu:arac-cek', function(data)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local found, player = GetClosestPlayerMenu()
    local inVehicle = IsPedInAnyVehicle(playerPed, false)
    local inVhicleId = 0
    local vehicle, mesafe = 0, 999
    
    if inVehicle then
        inVhicleId = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle, mesafe = QBCore.Functions.GetClosestVehicle(coords)
    end

        if PlayerData.job.name == "police" or string.find(PlayerData.job.name, "mekanik") then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local vehicle, mesafe = QBCore.Functions.GetClosestVehicle(coords)
            if mesafe < 8 then
                if not inVehicle then
                    if DoesEntityExist(vehicle) then
                        deleteVeh(vehicle)
                    end
                end
            end
        else
            QBCore.Functions.Notify("Bu işlem sadece Polisler ve Mekanikler için geçerlidir.")
        end
end)


RegisterNetEvent('qb-radialmenu:neonsok', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local found, player = GetClosestPlayerMenu()
    local inVehicle = IsPedInAnyVehicle(playerPed, false)
    local inVhicleId = 0
    local vehicle, mesafe = 0, 999
    
    if inVehicle then
        inVhicleId = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle, mesafe = QBCore.Functions.GetClosestVehicle(coords)
    end

    if not inVehicle then -- Sürücü Koldutuğunda İken
        QBCore.Functions.Notify('Aracın içinde olman lazım')
    else
        QBCore.Functions.Progressbar("arac_cek", "Aracın neonları sökülüyor", 3000, false, false,
        { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {}, {}, {}, function() -- Done
            if DoesEntityExist(inVhicleId) then
                SetVehicleNeonLightEnabled(inVhicleId, 0, false)
                SetVehicleNeonLightEnabled(inVhicleId, 1, false)
                SetVehicleNeonLightEnabled(inVhicleId, 2, false)
                SetVehicleNeonLightEnabled(inVhicleId, 3, false)
            end
            QBCore.Functions.Notify('Aracın neonları söküldü')
        end, function() -- Cancel
        end)

    end
end)


RegisterNetEvent('qb-radialmenu:kilitac', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local found, player = GetClosestPlayerMenu()
    local inVehicle = IsPedInAnyVehicle(playerPed, false)
    local inVhicleId = 0
    local vehicle, mesafe = 0, 999

    if inVehicle then
        inVhicleId = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle, mesafe = QBCore.Functions.GetClosestVehicle(coords)
    end

    if mesafe < 4 then
        local playerPed = PlayerPedId()
        local lock = GetVehicleDoorLockStatus(vehicle)
        kilitac = true
        TriggerEvent("qb-radialmenu:kilitacma")
        FreezeEntityPosition(PlayerPedId(), true)
        QBCore.Functions.Progressbar("kilid_ac", "Kapının kilidi açılıyor", 2000, false, true,
        { -- p1: menu name, p2: yazı, p3: ölü iken kullan, p4:iptal edilebilir
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
        }, {
            animDict = "veh@break_in@0h@p_m_one@",
            anim = "low_force_entry_ds",
            flags = 9,
        }, {}, {}, function() -- Done
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            QBCore.Functions.Notify('Aracın Kilidi Açıldı')
            StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            FreezeEntityPosition(PlayerPedId(), false)
        end, function() -- Cancel
            StopAnimTask(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0)
            FreezeEntityPosition(PlayerPedId(), false)
        end)
    end
end)