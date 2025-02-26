local QBCore = exports['qb-core']:GetCoreObject()

local inSpawnSelector = false

local inSpawnEditor = false

local disableStyleChanges = false

local isNew = false

local skyCamera = nil

local Houses = {}

local apartments = {}

if Config.ScriptStyle == "dark" or Config.ScriptStyle == "natural" then
    disableStyleChanges = true
end

RegisterNUICallback("nuiFocus", function()
    SetNuiFocus(false, false)
    inSpawnEditor = false
end)

RegisterNUICallback("spawnPlayer", function(data, cb)
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local insideMeta = PlayerData.metadata["inside"]
    if data.type == "lastlocation" then
        if isNew then
            cb("new")
        else
            local inJail = IsPlayerInJail(function(inJailStatus)
                PreSpawnPlayer()
                if not inJailStatus then
                    QBCore.Functions.GetPlayerData(function(pd)
                        ped = PlayerPedId()
                        SetEntityCoords(ped, pd.position.x, pd.position.y, pd.position.z)
                        SetEntityHeading(ped, pd.position.a)
                        FreezeEntityPosition(ped, false)
                    end)
                    if Config.Housing == "qb-housing" then
                        if insideMeta.house ~= nil then
                            local houseId = insideMeta.house
                            TriggerEvent('qb-houses:client:LastLocationHouse', houseId)
                        elseif insideMeta.apartment.apartmentType ~= nil or insideMeta.apartment.apartmentId ~= nil then
                            local apartmentType = insideMeta.apartment.apartmentType
                            local apartmentId = insideMeta.apartment.apartmentId
                            TriggerEvent('qb-apartments:client:LastLocationHouse', apartmentType, apartmentId)
                        end
                    elseif Config.Housing == "ps-housing" then
                        if insideMeta.property_id ~= nil then
                            local property_id = insideMeta.property_id
                            TriggerServerEvent('ps-housing:server:enterProperty', tostring(property_id))
                        end
                    end
                    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
                    TriggerEvent('QBCore:Client:OnPlayerLoaded')
                else
                    TriggerEvent("prison:client:Enter", inJailStatus)
                end
                PostSpawnPlayer()
            end)
        end
    elseif data.type == "maplocation" then
        local inJail = IsPlayerInJail(function(inJailStatus)
            PreSpawnPlayer()
            if not inJailStatus then
                SetEntityCoords(ped, data.coords.x, data.coords.y, data.coords.z)
                TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
                TriggerEvent('QBCore:Client:OnPlayerLoaded')
                if Config.Housing == "qb-housing" then
                    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
                    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
                elseif Config.Housing == "ps-housing" then
                    TriggerServerEvent('ps-housing:server:resetMetaData')
                end
                Wait(500)
                SetEntityHeading(ped, data.coords.w)
            else
                TriggerEvent("prison:client:Enter", inJailStatus)
            end
            PostSpawnPlayer()
        end)
    elseif data.type == "apartments" then
        local inJail = IsPlayerInJail(function(inJailStatus)
            PreSpawnPlayer()
            if not inJailStatus then
                isNew = false
                if Config.Housing == "qb-housing" then
                    TriggerServerEvent("apartments:server:CreateApartment", FindApartmentIndexByLabel(data.label), data.label)
                elseif Config.Housing == "ps-housing" then
                    TriggerServerEvent("ps-housing:server:createNewApartment", FindApartmentIndexByLabel(data.label))
                end
                TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
                TriggerEvent('QBCore:Client:OnPlayerLoaded')
            else
                TriggerEvent("prison:client:Enter", inJailStatus)
            end
            PostSpawnPlayer()
        end)
    elseif data.type == "house" then
        local inJail = IsPlayerInJail(function(inJailStatus)
            PreSpawnPlayer()
            if not inJailStatus then
                TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
                TriggerEvent('QBCore:Client:OnPlayerLoaded')
                if Config.Housing == "qb-housing" then
                    TriggerEvent('qb-houses:client:enterOwnedHouse', FindHouseByLabel(data.houses, data.label).house)
                    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
                    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
                elseif Config.Housing == "ps-housing" then
                    local selectedHouse = FindHouseByLabel(data.houses, data.label)
                    local property_id = selectedHouse.property_id
                    TriggerServerEvent('ps-housing:server:enterProperty', tostring(property_id))
                end
            else
                TriggerEvent("prison:client:Enter", inJailStatus)
            end
            PostSpawnPlayer()
        end)
    end
end)

RegisterNUICallback("modifyData", function(data)
    if data.type == "addlocation" then
        TriggerServerEvent("qb-spawn:ModifyData", "new", data)
    elseif data.type == "removelocation" then
        TriggerServerEvent("qb-spawn:ModifyData", "delete", data)
    elseif data.type == "modifycolors" then
        TriggerServerEvent("qb-spawn:ModifyData", "colors", data)
    elseif data.type == "modifyicon" then
        TriggerServerEvent("qb-spawn:ModifyData", "icon", data)
    end
end)

RegisterNUICallback("getLocationData", function(data, cb)
    local locationName = data.locationName

    if Config.Locations[locationName] then
        local locationData = Config.Locations[locationName]
        local nearbyPlayers = GetNumberOfPlayersInArea(locationData.Coords.x, locationData.Coords.y, locationData.Coords.z, locationData.Radius)
        local streetName = QBCore.Functions.GetStreetNametAtCoords(locationData.Coords)

        local locationInfo = {
            ImageURL = locationData.ImageURL,
            People = nearbyPlayers,
            Street = streetName.main,
            Coordinates = {
                x = locationData.Coords.x,
                y = locationData.Coords.y,
                z = locationData.Coords.z,
                w = locationData.Coords.w,
            },
        }

        cb(locationInfo)
    else
        cb(nil)
    end
end)

RegisterNUICallback("getLocations", function(data, cb)
    QBCore.Functions.TriggerCallback('qb-spawn:GetInfo', function(result)
        cb(result)
    end, { type = "locations" })
end)

RegisterNUICallback("getHouses", function(data, cb)
    QBCore.Functions.TriggerCallback('qb-spawn:GetInfo', function(houses)
        local myHouses = {}
        if houses ~= nil then
            for i = 1, (#houses), 1 do
                local house = houses[i]

                myHouses[#myHouses+1] = {
                    house = house,
                    label = GenerateHouseLabel(house),
                }
            end
        end

        Wait(300)

        local apartmentArray = {}

        for _, apartment in pairs(apartments) do
            table.insert(apartmentArray, apartment)
        end 

        cb({ houses = myHouses, isNew = isNew, apartments = apartmentArray, config = Config, })
    end, { type = "houses" })
end)

function FindHouseByLabel(houses, label)
    for index, myHouse in pairs(houses) do
        if myHouse.label == label then
            return myHouse.house
        end
    end
    return nil
end

function IsPlayerInJail(callback)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["injail"] and PlayerData.metadata["injail"] > 0 then
            callback(PlayerData.metadata["injail"])
        else
            callback(false)
        end
    end)
end

function GenerateHouseLabel(house)
    if Config.Housing == "qb-housing" then
        return Houses[house.house].adress
    elseif Config.Housing == "ps-housing" then
        return (house.apartment or house.street) .. " " .. house.property_id
    else
        return ""
    end
end

function FindApartmentIndexByLabel(label)
    for index, apartment in pairs(apartments) do
        if apartment.label == label then
            return index
        end
    end
    return nil
end

function GetNumberOfPlayersInArea(x, y, z, distance)
    local playerCount = 0

    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetPos = GetEntityCoords(targetPed)
        local distanceBetween = #(vector3(x, y, z) - targetPos)

        if distanceBetween <= distance then
            playerCount = playerCount + 1
        end
    end

    return playerCount
end

function SetDisplay(bool)
    inSpawnSelector = bool
    SetNuiFocus(bool, bool)

    if not disableStyleChanges then
        local hour = GetClockHours()
        if hour >= 20 or hour <= 5 then 
            Config.ScriptStyle = "dark"
        else
            Config.ScriptStyle = "light"
        end
    end

    SendNUIMessage({
        action = "spawnSelector",
        status = bool,
        config = Config or {},
        isNew = isNew,
    })
end

function SetEditorDisplay(bool)
    inSpawnEditor = bool
    SetNuiFocus(bool, bool)

    if not disableStyleChanges then
        local hour = GetClockHours()
        if hour >= 20 or hour <= 5 then 
            Config.ScriptStyle = "dark"
        else
            Config.ScriptStyle = "light"
        end
    end

    SendNUIMessage({
        action = "spawnEditor",
        config = Config or {},
    })
end

function PreSpawnPlayer()
    SetDisplay(false)
    DoScreenFadeOut(500)
    Wait(2000)
end

function PostSpawnPlayer()
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(skyCamera, false)
    DestroyCam(skyCamera, true)
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
end

-- qb-spawn default events, credits to the QBCore team.
RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Houses = houseConfig
end)

RegisterNetEvent('qb-spawn:client:setupSpawns', function(_, new, apps)
    if new then
        isNew = true
        apartments = apps
    end
end)

RegisterNetEvent('qb-spawn:client:openUI', function(value)
    SetEntityVisible(PlayerPedId(), false)
    FreezeEntityPosition(PlayerPedId(), true)
    DoScreenFadeOut(250)
    Wait(1000)
    DoScreenFadeIn(250)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        skyCamera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + Config.CameraSettings['SkyCamera']['ZPlus'], -85.00, 0.00, 0.00, 100.00, false, 0)
        SetCamActive(skyCamera, true)
        RenderScriptCams(true, false, 1, true, true)
    end)
    Wait(500)
    SetDisplay(value)
end)

RegisterCommand("spawneditor", function()
    QBCore.Functions.TriggerCallback('qb-spawn:GetInfo', function(result)
        if result then
            DoScreenFadeOut(250)
            SetEditorDisplay(true)
            Wait(500)
            DoScreenFadeIn(250)
        else
            QBCore.Functions.Notify("No permissions", "error")
        end
    end, { type = "permissions" })
end)

CreateThread(function()
    while true do
        Wait(0)
        if inSpawnEditor or inSpawnSelector then
            DisableAllControlActions(0)
        else
            Wait(1000)
        end
    end
end)