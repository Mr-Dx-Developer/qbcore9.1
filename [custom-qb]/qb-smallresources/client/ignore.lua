CreateThread(function()
    while true do
        for _, sctyp in next, Config.BlacklistedScenarios['TYPES'] do
            SetScenarioTypeEnabled(sctyp, false)
        end
        for _, scgrp in next, Config.BlacklistedScenarios['GROUPS'] do
            SetScenarioGroupEnabled(scgrp, false)
        end
        Wait(10000)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SendNUIMessage({
        action = "open",
    })
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    SendNUIMessage({
        action = "close",
    })
end)


RegisterCommand('id', function(source, args, rawCommand)
    local playerId = GetPlayerServerId(PlayerId())
    TriggerEvent('QBCore:Notify', 'Your ID: ' .. playerId, 'success')
end, false)


AddEventHandler("populationPedCreating", function(x, y, z)
	Wait(500) -- Give the entity some time to be created
	local _, handle = GetClosestPed(x, y, z, 1.0) -- Get the entity handle
	SetPedDropsWeaponsWhenDead(handle, false)
end)


if Config.Stun.active then
    CreateThread(function()
        local sleep
        while true do
            sleep = 1000
            local ped = PlayerPedId()
            if IsPedBeingStunned(ped, 0) then
                sleep = 0
                SetPedMinGroundTimeForStungun(ped, math.random(Config.Stun.min, Config.Stun.max))
            end
            Wait(sleep)
        end
    end)
end

CreateThread(function()
	for dispatchService, enabled in pairs(Config.DispatchServices) do
		EnableDispatchService(dispatchService, enabled)
	end

	local wantedLevel = 0
	if Config.EnableWantedLevel then
		wantedLevel = 5
	end

	SetMaxWantedLevel(wantedLevel)
end)

if Config.IdleCamera then --Disable Idle Cinamatic Cam
    DisableIdleCamera(true)
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)
		if weapon ~= GetHashKey("WEAPON_UNARMED") then
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER")then
				if IsPedShooting(ped) then
					SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
				end
			end
		else
			Wait(500)
		end
        Wait(7)
    end
end)

CreateThread(function()
    local pedPool = GetGamePool('CPed')
    for _, v in pairs(pedPool) do
        SetPedDropsWeaponsWhenDead(v, false)
    end
end)


----pistol wiping

CreateThread(function()
    while(true)do
            if globalIsPedArmed then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            else
                Wait(100)
            end
        Wait(0)
    end
end)


-- anty bunny hop

-- CreateThread(function()
--     while true do
--         Wait(100)
--         local ped = PlayerPedId()
--         if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
--             local chance_result = math.random()
--             --You can change the chance as you want! Just changed 0.2!
--             if chance_result < 0.2 then 
--                 Wait(600)
--                 ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.10)
--                 -- QBCore.Functions.Notify("You are too tired!", 'error', 2500)
--                 SetPedToRagdoll(ped, 5000, 1, 2)
--             else
--                 Wait(2000)
--             end
--         end
--     end
-- end)


-- turn off aim assiest 
CreateThread(function()-- probably just add this to an existing script
    while true do
        Wait(500)-- can set to 0 if needed 
        local gamepad = GetLastInputMethod(2)
        if not gamepad then
           SetPlayerTargetingMode(3)--set targeting to "free-aim" if a controller is being used
        else
            Wait(2000)--wait if the player is using a keyboard
        end
    end
end)

-- No helmet in an vehicle

CreateThread(function()
    while true do
        local sleep = 750
        if IsPedInAnyVehicle(playerped, false) and allowshuffle == false then
            sleep = 250
            SetPedConfigFlag(playerped, 184, true)
            if GetIsTaskActive(playerped, 165) then
                seat = 0
                if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
                    seat =- 1
                end
                SetPedIntoVehicle(playerped, currentvehicle, seat)
            end
        elseif IsPedInAnyVehicle(playerped, false) and allowshuffle == true then
            SetPedConfigFlag(playerped, 184, false)
        end
        Citizen.Wait(sleep)
    end
end)

----wrong mussle punch error issue fixed 
-- Prevent props (hat, glasses, etc.) from falling off when punched

CreateThread(function()
    while true do
    if PlayerPedId() ~= lastped then
        lastped = PlayerPedId()
        SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
    end
    Wait(100)
    end
end)

----train auto
CreateThread(function() -- TRAIN SPAWNS / SPAWN TRAINS
    SwitchTrainTrack(0, true)
    SwitchTrainTrack(3, true)
    N_0x21973bbf8d17edfa(0, 120000)
    SetRandomTrains(true)
end)

----regenarate helth over time 
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local maxHealth = GetEntityMaxHealth(ped)
        local health = GetEntityHealth(ped)
        Wait(1000)

        local newHealth = GetEntityHealth(ped)
        if newHealth < health then
            Wait(60000)
        else
            if health < maxHealth and health >= 100 and not InLaststand and not isDead then
                SetEntityHealth(ped, health + 2)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if vehicle ~= nil and vehicle ~= 0 then
            SetVehicleRadioEnabled(vehicle, false)
        end
    end
end)
