local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("mystery_smallbox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-box:client:AbrirPequena', source)
    end
end)

QBCore.Functions.CreateUseableItem("mystery_mediumbox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-box:client:AbrirMedia', source)
    end
end)

QBCore.Functions.CreateUseableItem("mystery_bigbox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-box:client:AbrirGrande', source)
    end
end)

QBCore.Functions.CreateUseableItem("mystery_expensivebox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('qb-box:client:AbrirSuper', source)
    end
end)

RegisterNetEvent('qb-box:server:ComprarPequena', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local preco = Config.Prices['smallBox']

    Player.Functions.RemoveMoney('bank', preco)

    Player.Functions.AddItem('mystery_smallbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_smallbox'], "add")
end)

RegisterNetEvent('qb-box:server:ComprarMedia', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local preco = Config.Prices['mediumBox']

    Player.Functions.RemoveMoney('bank', preco)

    Player.Functions.AddItem('mystery_mediumbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_mediumbox'], "add")
end)

RegisterNetEvent('qb-box:server:ComprarGrande', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local preco = Config.Prices['bigBox']

    Player.Functions.RemoveMoney('bank', preco)

    Player.Functions.AddItem('mystery_bigbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_bigbox'], "add")
end)

RegisterNetEvent('qb-box:server:ComprarSuper', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local preco = Config.Prices['expenciveBox']

    Player.Functions.RemoveMoney('bank', preco)

    Player.Functions.AddItem('mystery_expensivebox', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mystery_expensivebox'], "add")
end)

RegisterNetEvent('qb-box:server:RewardPequena', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local probabilidade = math.random(1, 100)

    if probabilidade <= 10 then

        Player.Functions.AddMoney('cash', Config.Rewards['smallBox']['Money1'])
    elseif probabilidade > 10 and probabilidade <= 20 then

        Player.Functions.AddMoney('cash', Config.Rewards['smallBox']['Money2'])
    elseif probabilidade > 20 and probabilidade <= 40 then

        Player.Functions.AddItem(Config.Rewards['smallBox']['Item1'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['smallBox']['Item1']], "add")
    elseif probabilidade > 40 and probabilidade <= 100 then

        Player.Functions.AddItem(Config.Rewards['smallBox']['ShitItem1'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['smallBox']['ShitItem1']], "add")
    end
end)

RegisterNetEvent('qb-box:server:RewardMedia', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local probabilidade = math.random(1, 100)

    if probabilidade <= 10 then

        Player.Functions.AddMoney('cash', Config.Rewards['mediumBox']['Money1'])
    elseif probabilidade > 10 and probabilidade <= 20 then

        Player.Functions.AddMoney('cash', Config.Rewards['mediumBox']['Money2'])
    elseif probabilidade > 20 and probabilidade <= 40 then

        Player.Functions.AddItem(Config.Rewards['mediumBox']['Item1'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['mediumBox']['Item1']], "add")

        Player.Functions.AddItem(Config.Rewards['mediumBox']['Item2'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['mediumBox']['Item2']], "add")
    elseif probabilidade > 40 and probabilidade <= 100 then

        Player.Functions.AddItem(Config.Rewards['mediumBox']['ShitItem1'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['mediumBox']['ShitItem1']], "add")

        Player.Functions.AddItem(Config.Rewards['mediumBox']['ShitItem2'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['mediumBox']['ShitItem2']], "add")
    end
end)

RegisterNetEvent('qb-box:server:RewardGrande', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local probabilidade = math.random(1, 100)

    if probabilidade <= 10 then

        Player.Functions.AddMoney('cash', Config.Rewards['bigBox']['Money1'])
    elseif probabilidade > 10 and probabilidade <= 20 then

        Player.Functions.AddMoney('cash', Config.Rewards['bigBox']['Money2'])
    elseif probabilidade > 20 and probabilidade <= 40 then

        Player.Functions.AddItem(Config.Rewards['bigBox']['Item1'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['Item1']], "add")

        Player.Functions.AddItem(Config.Rewards['bigBox']['Item2'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['Item2']], "add")

        Player.Functions.AddItem(Config.Rewards['bigBox']['Item3'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['Item3']], "add")
    elseif probabilidade > 40 and probabilidade <= 100 then

        Player.Functions.AddItem(Config.Rewards['bigBox']['ShitItem1'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['ShitItem1']], "add")

        Player.Functions.AddItem(Config.Rewards['bigBox']['ShitItem2'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['ShitItem2']], "add")

        Player.Functions.AddItem(Config.Rewards['bigBox']['ShitItem3'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['bigBox']['ShitItem3']], "add")
    end
end)

RegisterNetEvent('qb-box:server:RewardSuper', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local probabilidade = math.random(1, 100)

    if probabilidade <= 10 then

        Player.Functions.AddMoney('cash', Config.Rewards['expenciveBox']['Money1'])
    elseif probabilidade > 10 and probabilidade <= 20 then

        Player.Functions.AddMoney('cash', Config.Rewards['expenciveBox']['Money2'])
    elseif probabilidade > 20 and probabilidade <= 40 then

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['Item1'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['Item1']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['Item2'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['Item2']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['Item3'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['Item3']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['Item4'], math.random(1, 2))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['Item4']], "add")
    elseif probabilidade > 40 and probabilidade <= 100 then

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['ShitItem1'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['ShitItem1']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['ShitItem2'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['ShitItem2']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['ShitItem3'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['ShitItem3']], "add")

        Player.Functions.AddItem(Config.Rewards['expenciveBox']['ShitItem4'], math.random(1, 5))
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.Rewards['expenciveBox']['ShitItem4']], "add")
    end
end)

RegisterServerEvent('qb-box:server:removemystery_smallbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('mystery_smallbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_smallbox'], "remove")
end)

RegisterServerEvent('qb-box:server:removemystery_mediumbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('mystery_mediumbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_mediumbox'], "remove")
end)

RegisterServerEvent('qb-box:server:removemystery_bigbox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('mystery_bigbox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_bigbox'], "remove")
end)

RegisterServerEvent('qb-box:server:removemystery_expensivebox', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('mystery_expensivebox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mystery_expensivebox'], "remove")
end)