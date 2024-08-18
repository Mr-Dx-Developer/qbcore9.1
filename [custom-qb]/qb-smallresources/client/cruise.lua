local QBCore = exports["qb-core"]:GetCoreObject()

local useMph = true -- if false, it will display speed in kph
local speedLimiterEnabled = false

local function handleSpeedLimiter(vehicle, maxSpeed)
    if not speedLimiterEnabled then
        local cruise = GetEntitySpeed(vehicle)
        SetEntityMaxSpeed(vehicle, cruise)
        speedLimiterEnabled = true

        if useMph then
            cruise = math.floor(cruise * 2.23694 + 0.5)
            QBCore.Functions.Notify("Speed limiter set to " .. cruise .. " mph. Press L to disable.")
        else
            cruise = math.floor(cruise * 3.6 + 0.5)
            QBCore.Functions.Notify("Speed limiter set to " .. cruise .. " km/h. Press L to disable.")
        end
    else
        SetEntityMaxSpeed(vehicle, maxSpeed)
        speedLimiterEnabled = false
        QBCore.Functions.Notify("Speed limiter disabled")
    end
end

RegisterKeyMapping('speedlimiter', 'Toggle speed limiter', 'keyboard', 'Y')

RegisterCommand('speedlimiter', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if GetPedInVehicleSeat(vehicle, -1) == playerPed and IsPedInAnyVehicle(playerPed, false) then
        local maxSpeed = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
        handleSpeedLimiter(vehicle, maxSpeed)
    end
end, false)