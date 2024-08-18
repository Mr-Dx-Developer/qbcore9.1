if GetResourceState("qb-core") ~= "started" then return end

CreateThread(function()
    Wait(200)
    print("^5QB Core found! Loading QB Core functions^0")
end)

QBCore = exports['qb-core']:GetCoreObject()

GetPlayer = function(target)
    local Player = QBCore.Functions.GetPlayer(target)

    return Player
end

AddMoney = function(target, type, amount, reason)
    local Player = GetPlayer(target)

    return Player.Functions.AddMoney(type, amount, reason)
end

RemoveMoney = function(target, type, amount, reason)
    local Player = GetPlayer(target)

    return Player.Functions.RemoveMoney(type, amount, reason)
end

GetMoney = function(target, type)
    local Player = GetPlayer(target)

    return Player.PlayerData.money[type]
end