local QBCore = exports['qb-core']:GetCoreObject()
----------- / alcohol

for k,_ in pairs(Config.ConsumablesAlcohol) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        TriggerClientEvent("consumables:client:DrinkAlcohol", source, item.name)
    end)
end

----------- / Eat

for k,_ in pairs(Config.ConsumablesEat) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent("consumables:client:Eat", source, item.name)
    end)
end

----------- / Drink
for k,_ in pairs(Config.ConsumablesDrink) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end)
end

----------- / Custom
for k,_ in pairs(Config.ConsumablesCustom) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent("consumables:client:Custom", source, item.name)
    end)
end

local function CreateItem(name,type)
    QBCore.Functions.CreateUseableItem(name, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
        TriggerClientEvent("consumables:client:"..type, source, item.name)
    end)
end
----------- / Drug



QBCore.Functions.CreateUseableItem("joint", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:UseJoint", source)
end)

QBCore.Functions.CreateUseableItem("police_scanner", function(source)
    TriggerClientEvent("qb-smallresources:client:SeizeItems", source)
end)

QBCore.Functions.CreateUseableItem("cokebaggy", function(source)
    TriggerClientEvent("consumables:client:Cokebaggy", source)
end)

QBCore.Functions.CreateUseableItem("crack_baggy", function(source)
    TriggerClientEvent("consumables:client:Crackbaggy", source)
end)

QBCore.Functions.CreateUseableItem("xtcbaggy", function(source, _)
    TriggerClientEvent("consumables:client:EcstasyBaggy", source)
end)

QBCore.Functions.CreateUseableItem("oxy", function(source)
    TriggerClientEvent("consumables:client:oxy", source)
end)

QBCore.Functions.CreateUseableItem("meth", function(source)
    TriggerClientEvent("consumables:client:meth", source)
end)


--Burger Shot

QBCore.Functions.CreateUseableItem("burgershot_bigking", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_bleeder", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_goatwrap", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_macaroon", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_patatob", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_patatos", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_shotnuggets", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_shotrings", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_thesmurfsicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_smurfetteicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_matchaicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_ubeicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_unicornicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_vanillaicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_chocolateicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_strawberryicecream", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_colab", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_colas", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

QBCore.Functions.CreateUseableItem("burgershot_coffee", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Drink", source, item.name)
end)

----------- / Tools

QBCore.Functions.CreateUseableItem("armor", function(source)
    TriggerClientEvent("consumables:client:UseArmor", source)
end)

QBCore.Functions.CreateUseableItem('mdt', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName(item.name) then return end
    TriggerClientEvent("mdt:useTablet", source, true)
end)

QBCore.Functions.CreateUseableItem("heavyarmor", function(source)
    TriggerClientEvent("consumables:client:UseHeavyArmor", source)
end)

QBCore.Commands.Add("resetarmor", "Resets Vest (Police Only)", {}, false, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == "police" then
        TriggerClientEvent("consumables:client:ResetArmor", source)
    else
        TriggerClientEvent('QBCore:Notify', source,  "For Police Officer Only", "error")
    end
end)

QBCore.Functions.CreateUseableItem("binoculars", function(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

QBCore.Functions.CreateUseableItem("parachute", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:UseParachute", source)
end)

QBCore.Commands.Add("resetparachute", "Resets Parachute", {}, false, function(source)
    TriggerClientEvent("consumables:client:ResetParachute", source)
end)

RegisterNetEvent('qb-smallpenis:server:AddParachute', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.AddItem("parachute", 1)
end)

----------- / Firework

for _,v in pairs(ConsumablesFireworks) do
    QBCore.Functions.CreateUseableItem(v, function(source, item)
        local src = source
        TriggerClientEvent("fireworks:client:UseFirework", src, item.name, "proj_indep_firework")
    end)
end

----------- / Lockpicking

QBCore.Functions.CreateUseableItem("lockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

QBCore.Functions.CreateUseableItem("advancedlockpick", function(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)

----------- / Unused

-- QBCore.Functions.CreateUseableItem("smoketrailred", function(source, item)
--     local Player = QBCore.Functions.GetPlayer(source)
--     if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
--     TriggerClientEvent("consumables:client:UseRedSmoke", source)
-- end)

-- Events for adding and removing specific items to fix some exploits

RegisterNetEvent('consumables:server:resetArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.AddItem('heavyarmor', 1)
end)

RegisterNetEvent('consumables:server:useHeavyArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('heavyarmor', 1)
end)

RegisterNetEvent('consumables:server:useArmor', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('armor', 1)
end)

RegisterNetEvent('consumables:server:useMeth', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('meth', 1)
end)

RegisterNetEvent('consumables:server:useOxy', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('oxy', 1)
end)

RegisterNetEvent('consumables:server:useXTCBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('xtcbaggy', 1)
end)

RegisterNetEvent('Thx:Server:ItemStuff', function(Add, itemName, amount, itembox)
     local src = source
     local Player = QBCore.Functions.GetPlayer(src)
     local Amount = amount
     if itembox == nil then itembox = true end
     if not amount then
         Amount = 1
     end
     if Player then
         if Add then
             Player.Functions.AddItem(itemName, Amount)
             if itembox then
                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'add', Amount)
             end
         else
             Player.Functions.RemoveItem(itemName, Amount)
             if itembox then
                 TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove', Amount)
             end
         end
     end
end)

QBCore.Functions.CreateCallback('THX:Server:HealBandAidPack', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
	local bandaids = Config.Bandages
		if bandaids then
			cb(true)
		else
			cb(false)
			TriggerClientEvent('QBCore:Notify', src, "What?", "error")
		end
end)

QBCore.Functions.CreateCallback('THX:Server:HasBandAidPack', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local pack = Ply.Functions.GetItemByName("packofbandaids")
        if pack then
            cb(true)
        else
            cb(false)
            TriggerClientEvent('QBCore:Notify', src, "What?", "error")
        end
end)
QBCore.Functions.CreateUseableItem("packofbandaids", function(source, item)
    TriggerClientEvent("thx:consumables:client:openbandaids", source, item.name)
end)

for _, v in pairs(Config.Bandages) do
    -- print(v)
    QBCore.Functions.CreateUseableItem(v, function(source, item)
        TriggerClientEvent("Thx:bandage:heal", source, item.name)
    end)
end

RegisterNetEvent('consumables:server:useCrackBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('crack_baggy', 1)
end)

RegisterNetEvent('consumables:server:useCokeBaggy', function()
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.RemoveItem('cokebaggy', 1)
end)

RegisterNetEvent('consumables:server:drinkAlcohol', function(item)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    local foundItem = nil

    for k in pairs(Config.ConsumablesAlcohol) do
        if k == item then
            foundItem = k
            break
        end
    end

    if not foundItem then return end

    Player.Functions.RemoveItem(foundItem, 1)
end)

RegisterNetEvent('consumables:server:UseFirework', function(item)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    local foundItem = nil

    for i = 1, #ConsumablesFireworks do
        if ConsumablesFireworks[i] == item then
            foundItem = ConsumablesFireworks[i]
            break
        end
    end

    if not foundItem then return end

    Player.Functions.RemoveItem(foundItem, 1)
end)

RegisterNetEvent('consumables:server:addThirst', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('thirst', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, amount)
end)

RegisterNetEvent('consumables:server:addHunger', function(amount)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return end

    Player.Functions.SetMetaData('hunger', amount)
    TriggerClientEvent('hud:client:UpdateNeeds', source, amount, Player.PlayerData.metadata.thirst)
end)

QBCore.Functions.CreateCallback('consumables:itemdata', function(_, cb, itemName)
    cb(Config.ConsumablesCustom[itemName])
end)

local function AddDrink(drinkname, replenish)
    if Config.ConsumablesDrink[drinkname] ~= nil then
        return false, "already added"
    else
        Config.ConsumablesDrink[drinkname] = replenish
        CreateItem(drinkname, 'Drink')
        return true, "success"
    end
end

exports('AddDrink', AddDrink)

local function AddFood(foodname, replenish)
    if Config.ConsumablesEat[foodname] ~= nil then
        return false, "already added"
    else
        Config.ConsumablesEat[foodname] = replenish
        CreateItem(foodname, 'Eat')
        return true, "success"
    end
end

exports('AddFood', AddFood)

local function AddAlcohol(alcoholname, replenish)
    if Config.ConsumablesAlcohol[alcoholname] ~= nil then
        return false, "already added"
    else
        Config.ConsumablesAlcohol[alcoholname] = replenish
        CreateItem(alcoholname, 'DrinkAlcohol')
        return true, "success"
    end
end

exports('AddAlcohol', AddAlcohol)

local function AddCustom(itemname, data)
    if 'consumables:itemdata' ~= nil then
        return false, "already added"
    else
        Config.ConsumablesCustom[itemname] = data
        CreateItem(itemname, 'Custom')
        return true, "success"
    end
end

exports('AddCustom', AddCustom)