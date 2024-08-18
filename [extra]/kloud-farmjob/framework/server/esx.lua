if GetResourceState("es_extended") ~= "started" then return end

CreateThread(function()
    Wait(200)
    print("^5ESX found! Loading ESX functions^0")
    if GetResourceState("ox_inventory") ~= "started" then 
        print("^1Can't find ox_inventory, start it before this script^0")
    end
end)

ESX = exports['es_extended']:getSharedObject()

GetPlayer = function(target)
    local Player = ESX.GetPlayerFromId(target)

    return Player
end

AddMoney = function(target, type, amount, reason)
    local Player = GetPlayer(target)

    if type == "cash" then
        type = "money"
    end

    return Player.addAccountMoney(type, amount)
end

RemoveMoney = function(target, type, amount, reason)
    local Player = GetPlayer(target)

    if type == "cash" then
        type = "money"
    end

    return Player.removeAccountMoney(type, amount)
end

GetMoney = function(target, type)
    local Player = GetPlayer(target)

    if type == "cash" then
        type = "money"
    end

    return Player.getAccount(type).money
end