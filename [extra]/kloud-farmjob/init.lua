_T = {
    Zone = {},
    Props = {},
    Blip = {},
    PickedTrees = {},
    Peds = {},
}

_G = {
    InZone = false,
    IsBusy = false,
    CurrentZone = nil,
    Cooldown = false
}

Start = function()
    for zone, info in pairs(KloudDev.Locations) do
        _T.Zone[zone] = lib.zones.sphere({
            coords = info.coords,
            radius = info.zoneRadius,
            debug = KloudDev.Debug,
            onEnter = function()
                if info.job and PlayerJob.name ~= info.job then return end
                _G.InZone = true
                _G.CurrentZone = zone
                SpawnProps(zone)
            end,
            onExit = function()
                _G.InZone = false
                _G.CurrentZone = nil
                ClearProps()
            end
        })
    end
    for zone, info in pairs(KloudDev.Trees) do
        if info.zoneType == "sphere" then
            _T.Zone[zone] = lib.zones.sphere({
                coords = info.coords,
                radius = info.zoneRadius,
                debug = KloudDev.Debug,
                onEnter = function()
                    if info.job and PlayerJob.name ~= info.job then return end
                    _G.InZone = true
                    _G.CurrentZone = zone
                end,
                onExit = function()
                    _G.InZone = false
                    _G.CurrentZone = nil
                end
            })
        elseif info.zoneType == "poly" then
            lib.zones.poly({
                points = info.zonePoints,
                thickness = 25,
                debug = KloudDev.Debug,
                onEnter = function()
                    if info.job and PlayerJob.name ~= info.job then return end
                    _G.InZone = true
                    _G.CurrentZone = zone
                end,
                onExit = function()
                    _G.InZone = false
                    _G.CurrentZone = nil
                end
            })
        end
    end
    CreateBlips()
    CreateTargets()
    CreatePeds()
end

CreateBlips = function()
    for zone, info in pairs(KloudDev.Locations) do
        if info.blip.enabled then
            _T.Blip[zone] = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
            SetBlipSprite(_T.Blip[zone], info.blip.sprite)
            SetBlipDisplay(_T.Blip[zone], 4)
            SetBlipScale(_T.Blip[zone], info.blip.scale)
            SetBlipColour(_T.Blip[zone], info.blip.colour)
            SetBlipAsShortRange(_T.Blip[zone], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.blip.label)
            EndTextCommandSetBlipName(_T.Blip[zone])
        end
    end
    for zone, info in pairs(KloudDev.Trees) do
        if info.blip.enabled then
            _T.Blip[zone] = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
            SetBlipSprite(_T.Blip[zone], info.blip.sprite)
            SetBlipDisplay(_T.Blip[zone], 4)
            SetBlipScale(_T.Blip[zone], info.blip.scale)
            SetBlipColour(_T.Blip[zone], info.blip.colour)
            SetBlipAsShortRange(_T.Blip[zone], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.blip.label)
            EndTextCommandSetBlipName(_T.Blip[zone])
        end
    end
    for zone, info in pairs(KloudDev.Shops) do
        if info.blip.enabled then
            for _, coords in pairs(info.coords) do
                _T.Blip[zone] = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(_T.Blip[zone], info.blip.sprite)
                SetBlipDisplay(_T.Blip[zone], 4)
                SetBlipScale(_T.Blip[zone], info.blip.scale)
                SetBlipColour(_T.Blip[zone], info.blip.colour)
                SetBlipAsShortRange(_T.Blip[zone], true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(info.blip.label)
                EndTextCommandSetBlipName(_T.Blip[zone])
            end
        end
    end
    if KloudDev.WashLocations.blip.enabled then
        for k, coords in pairs(KloudDev.WashLocations.coords) do
            _T.Blip["Wash"..k] = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(_T.Blip["Wash"..k], KloudDev.WashLocations.blip.sprite)
            SetBlipDisplay(_T.Blip["Wash"..k], 4)
            SetBlipScale(_T.Blip["Wash"..k], KloudDev.WashLocations.blip.scale)
            SetBlipColour(_T.Blip["Wash"..k], KloudDev.WashLocations.blip.colour)
            SetBlipAsShortRange(_T.Blip["Wash"..k], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(KloudDev.WashLocations.blip.label)
            EndTextCommandSetBlipName(_T.Blip["Wash"..k])
        end
    end
end

CreateTargets = function()
    for zone, info in pairs(KloudDev.Trees) do
        if info.job and PlayerJob.name ~= info.job then return end
        AddTargetModel(info.prop, {
            {
                event = 'kloud-farm:client:pickTree',
                label = info.target.label,
                name = "PickTrees",
                icon = info.target.icon,
                currentZone = zone,
                canInteract = function(entity)
                    if not _G.IsBusy and _G.InZone and CanPick(entity) and _G.CurrentZone == zone then return true end
                    return false
                end,
                distance = 2,
            }
        })
    end

    for _, coords in pairs(KloudDev.WashLocations.coords) do
        lib.zones.sphere({
            coords = coords,
            radius = 4.5,
            debug = KloudDev.Debug,
            onEnter = function()
                DrawText(locale("press_wash_crops", "[E]"))
            end,
            onExit = function()
                HideText()
            end,
            inside = function ()
                if not _G.IsBusy and IsControlJustPressed(0, 38) then
                    TriggerEvent("kloud-farm:client:wash")
                end

                if _G.IsBusy then
                    HideText()
                end
            end
        })
    end
end

CreatePeds = function()
    while not PlayerLoaded do Wait(100) end
    for k, v in pairs(KloudDev.Shops) do
        for _, coords in pairs(v.coords) do
            if k == "sell" then
                local model = v.pedModels[math.random(1, #v.pedModels)]
                lib.requestModel(model, 10000)
                _T.Peds[k] = CreatePed(5, joaat(model), coords.x, coords.y, coords.z, coords.w, false, false)
                FreezeEntityPosition(_T.Peds[k], true)
                SetBlockingOfNonTemporaryEvents(_T.Peds[k], true)
                SetEntityInvincible(_T.Peds[k], true)

                AddEntityTarget(_T.Peds[k], {
                    {
                        event = 'kloud-farm:client:openSell',
                        label = locale('open_sell'),
                        name = "kloud-farm:openSell",
                        icon = "fas fa-basket-shopping",
                        distance = 2.5,
                    },
                })
                SetModelAsNoLongerNeeded(model)
            end

            
            if k == "shop" then
                local model = v.pedModels[math.random(1, #v.pedModels)]
                lib.requestModel(model, 10000)
                _T.Peds[k] = CreatePed(5, joaat(model), coords.x, coords.y, coords.z, coords.w, false, false)
                FreezeEntityPosition(_T.Peds[k], true)
                SetBlockingOfNonTemporaryEvents(_T.Peds[k], true)
                SetEntityInvincible(_T.Peds[k], true)

                AddEntityTarget(_T.Peds[k], {
                    {
                        event = 'kloud-farm:client:openShop',
                        label = locale('open_shop'),
                        name = "kloud-farm:openShop",
                        icon = "fas fa-basket-shopping",
                        distance = 2.5,
                    },
                })
                SetModelAsNoLongerNeeded(model)
            end
        end
    end
end

CreateThread(Start)