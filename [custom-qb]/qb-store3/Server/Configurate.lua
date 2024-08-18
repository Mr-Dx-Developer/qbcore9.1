QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports.oxmysql:execute('CREATE TABLE IF NOT EXISTS stores (id int AUTO_INCREMENT, name varchar(100), coordinate text, owner varchar(120), stock longtext, products longtext, request longtext, balance varchar(20), PRIMARY KEY(id))', {}, function()
        exports.oxmysql:execute('SELECT * FROM stores', {}, function(result)
            for i,k in pairs(result) do
                local coordinate = json.decode(k.coordinate)

                k.coordinate = vector3(coordinate.x, coordinate.y, coordinate.z)
                k.stock = json.decode(k.stock)
                k.products = json.decode(k.products)
                k.request = json.decode(k.request)
                k.balance = tonumber(k.balance)
                server_stores[k.id] = k
            end

            for i,k in pairs(stores) do
                for j,c in pairs(k.coordinates) do
                    local found = false

                    for l,m in pairs(server_stores) do
                        local x = tonumber(string.format("%.2f", tonumber(m.coordinate.x)))*1.0
                        local y = tonumber(string.format("%.2f", tonumber(m.coordinate.y)))*1.0
                        local z = tonumber(string.format("%.2f", tonumber(m.coordinate.z)))*1.0
                        local pos = vector3(x,y,z)

                        local x2 = tonumber(string.format("%.2f", tonumber(c.buy_items.x)))*1.0
                        local y2 = tonumber(string.format("%.2f", tonumber(c.buy_items.y)))*1.0
                        local z2 = tonumber(string.format("%.2f", tonumber(c.buy_items.z)))*1.0
                        local pos2 = vector3(x2,y2,z2)

                        if pos == pos2 then
                            found = true

                            if m.name ~= i then
                                exports.oxmysql:update('UPDATE stores SET name = @name WHERE id = @id', {
                                    ['@id'] = l,
                                    ['@name'] = i
                                })

                                m.name = i
                            end

                            break
                        end
                    end

                    if not found then
                        local stock_aux = json.decode(json.encode(k.items))
                        for _, m in pairs(stock_aux) do
                            m.amount = 0
                        end

                        local name = i
                        local coordinate = json.encode({x = c.buy_items.x, y = c.buy_items.y, z = c.buy_items.z})
                        local owner = "none"
                        local stock = json.encode(stock_aux)
                        local products = json.encode(k.items)
                        local request = json.encode({})
                        local balance = 0

                        exports.oxmysql:insert('INSERT INTO stores (name, coordinate, owner, stock, products, request, balance) VALUES (@name, @coordinate, @owner, @stock, @products, @request, @balance)', {
                            ['@name'] = name, 
                            ['@coordinate'] = coordinate, 
                            ['@owner'] = owner, 
                            ['@stock'] = stock, 
                            ['@products'] = products, 
                            ['@request'] = request, 
                            ['@balance'] = balance,
                        }, function(insertId)

                            server_stores[insertId] = {
                                ['name'] = name, 
                                ['coordinate'] = c.buy_items, 
                                ['owner'] = owner, 
                                ['stock'] = stock_aux, 
                                ['products'] = k.items, 
                                ['request'] = {}, 
                                ['balance'] = 0,
                            }
                        end)
                    end
                end
            end

            for i,k in pairs(server_stores) do
                local changed = false

                for l,m in pairs(stores[k.name].items) do
                    local found = false

                    for j,c in pairs(k.products) do    
                        if m.name == c.name then
                            found = true
                            break
                        end
                    end

                    if not found then
                        local stock_aux = json.decode(json.encode(m))
                        table.insert(k.products, m)
                        table.insert(k.stock, stock_aux)
                        k.stock[#k.stock].amount = 0
                        changed = true
                    end
                end

                for j,c in pairs(k.products) do    
                    local found = false
                    
                    for l,m in pairs(stores[k.name].items) do
                        if m.name == c.name then
                            found = true
                            break
                        end
                    end

                    if not found then
                        for g,h in pairs(k.stock) do
                            if h.name == c.name then
                                table.remove(k.stock, g)
                                break
                            end                                
                        end

                        table.remove(k.products, j)
                        changed = true
                    end
                end

                if changed then
                    exports.oxmysql:update('UPDATE stores SET products = @products, stock = @stock WHERE id = @id', {
                        ['@id'] = i,
                        ['@products'] = json.encode(k.products),
                        ['@stock'] = json.encode(k.stock)
                    })
                end

                if k.owner == "none" then
                    for j,c in pairs(k.products) do                            
                        for l,m in pairs(stores[k.name].items) do
                            if c.name == m.name then
                                c.amount = m.amount
                                break
                            end
                        end
                    end
                end
            end
        end)
    end)
end)

function showNotification(source, message)
    TriggerClientEvent('esx:showNotification', source, message)
    TriggerClientEvent('chat:addMessage', source, { args = { message }})
end

-- This function will return the amount of money in the player's bank account
function getBankMoney(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        return xPlayer.PlayerData.money["bank"]
    end
end

-- This function will return the amount of money in the player's wallet account
function getWalletMoney(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        return xPlayer.PlayerData.money["cash"]
    end
end

-- This function will remove money from the player's bank account
function removeBankMoney(source, value)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        xPlayer.Functions.RemoveMoney('bank', value)
    end 
end

-- This function will remove money from the player's Wallet account
function removeWalletMoney(source, value)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
        xPlayer.Functions.RemoveMoney('cash', value)
    end 
end

-- This function will add money to the player's bank account
function addBankMoney(source, value)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
         xPlayer.Functions.AddMoney('bank', value)
    end
end

-- This function will add money from the player's Wallet account
function addWalletMoney(source, value)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    if xPlayer then
         xPlayer.Functions.AddMoney('cash', value)
    end
end

if use_weight_system then
    -- This function will return TRUE if the player has enough space in his inventory
    function canCarryItem(source, weight)
        local xPlayer = QBCore.Functions.GetPlayer(source)
	--убрал проверку на заполниность инвеноря, не смог решить по другому (ВРЕМЕННОЕ РЕШЕНИЕ)
        -- if xPlayer then
            -- local maxWeight = QBCore.Config.Player.MaxWeight
            -- local totalWeight = QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items)
            -- return ( (totalWeight + weight) <= maxWeight )
        -- end 

        return true --false
    end
    
else
    -- This function will return TRUE if the player has enough space in his inventory
    function canCarryItem(source, item, _amount)
        local xPlayer = QBCore.Functions.GetPlayer(source)
	
        if xPlayer then
            local itemInfo = QBCore.Shared.Items[item:lower()]
            local maxWeight = QBCore.Config.Player.MaxWeight
            local totalWeight = QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items)
            local itemWeight = itemInfo.weight * _amount
            return ( (totalWeight + itemWeight) <= maxWeight )
        end   
        
        return false
    end
end

-- This function will return the player's inventory
function getInventory(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local Inventory = Player.PlayerData.items

    if Player then
        return Inventory
    end
end

-- This function will add an item to the player's inventory
function addInventoryItem(source, item, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer then
        xPlayer.Functions.AddItem(item, amount)
    end 
end

-- This function will return the player's weigth
function getWeight(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return QBCore.Player.GetTotalWeight(xPlayer.PlayerData.items)
end

-- This function will return the player's identifier (identifier or id)
function getIdentifier(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
	
    if xPlayer then
        return xPlayer.PlayerData.citizenid
    end
end