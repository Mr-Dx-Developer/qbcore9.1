## Drop first code in ``qb-core/shared/items.lua``
```lua

["taser_ammo"]                   = {["name"] = "taser_ammo",                    ["label"] = "Taser Cartridges",         ["weight"] = 300,       ["type"] = "item",      ["image"] = "taser_ammo.png",           ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "Cartridge for Taser"},

```

## Add code in ``qb-smallresources/client/ignore.lua`` At the very bottom
```lua

local taserCartsLeft = maxTaserCarts
     
     RegisterNetEvent("FillTaser")
     AddEventHandler("FillTaser",function(source, args, rawCommand)
         
         QBCore.Functions.Progressbar("load_tazer", "Reloading Tazer..", 2000, false, true, {
             disableMovement = false,
             disableCarMovement = false,
             disableMouse = false,
             disableCombat = true,
         }, {
             animDict = "anim@weapons@pistol@singleshot_str",
             anim = "reload_aim",
             flags = 48,
         }, {}, {}, function() -- Done
         
             
             taserCartsLeft = maxTaserCarts
             TriggerServerEvent("QBCore:Server:RemoveItem", "taser_ammo", 1)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["taser_ammo"], "remove")
             
         end)
     end)  

local taserModel = GetHashKey("WEAPON_STUNGUN")

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()

        if GetSelectedPedWeapon(ped) == taserModel then
            if IsPedShooting(ped) then
                DisplayAmmoThisFrame(true)
                taserCartsLeft = taserCartsLeft - 1
            end
        end

        if taserCartsLeft <= 0 then
            if GetSelectedPedWeapon(ped) == taserModel then
                SetPlayerCanDoDriveBy(ped, false)
                DisablePlayerFiring(ped, true)
                if IsControlJustReleased(0, 106) then
                    QBCore.Functions.Notify("You need to reload your taser!", "error")
                end
            end
        end

        if longerTazeTime then
            SetPedMinGroundTimeForStungun(ped, longerTazeSecTime * 1000)
        end
    end
end)

RegisterCommand('reloadtaser', function()
    TriggerEvent("FillTaser")
end) 

```

## Add code in ``qb-smallresources/server/consumables.lua``
```lua

QBCore.Functions.CreateUseableItem("taser_ammo", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("FillTaser", source)
    end
end) 

```