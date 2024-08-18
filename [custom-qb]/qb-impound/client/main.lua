local QBCore = exports['qb-core']:GetCoreObject()
local bones = {'bonnet', 'boot'}

CreateThread(function()
    exports['qb-target']:AddTargetBone(bones, {
        options = {
            ["Impound"] = {
                icon = "fas fa-lock",
                label = "Impound Request",
                event = "qb-impound:client:OpenImpoundMenu",
                distance = 1.3
            }
        }
    })
end)


RegisterNetEvent('qb-impound:client:OpenImpoundMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Vehicle Scuff",
            txt = "Vehicle in an unrecoverable state.",
            params = {
                event = "qb-impound:client:VehicleScuff",
            }
        },
        {
            header = "Parking Violation",
            txt = "Vehicle parked in an restricted or unauthorized place.",
            params = {
                event = "qb-impound:client:ParkingViolation",
            }
        },
        {
            header = "Police Impound",
            txt = "Sends vehicle to police impound lot.",
            params = {
                event = "qb-impound:client:PDImpound",
            }
        },
    })
end)

RegisterNetEvent('qb-impound:client:VehicleScuff', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("qb-impound:server:VehicS")
        QBCore.Functions.Notify("Impound Request Accepted", "success")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('qb-impound:client:ParkingViolation', function()
    QBCore.Functions.Progressbar("random_task", "Requesting Impound...", 7000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
     }, {
     }, {}, {}, function() -- Done
        TriggerServerEvent("qb-impound:server:ParkingVio")
     end, function() -- Cancel
     end)
end)

RegisterNetEvent('qb-impound:client:PDImpound', function()
    TriggerServerEvent("qb-impound:server:PDIm")
    QBCore.Functions.Notify("Impound Request Accepted", "success")
end)

-- discord.gg/qbcoreframework -- QBCore#4011 Only Buy From Him