server_stores = {

}

RegisterNetEvent("qb-store3: OpenStore")
AddEventHandler("qb-store3: OpenStore", function(name, position)
    local idJ = source
    
    local found_store = getStoreServer(name, position)

    if found_store then
        TriggerClientEvent("qb-store3: OpenStore", idJ, found_store.name, found_store.products)
    end
end)

RegisterNetEvent("qb-store3: CheckOwnerStore")
AddEventHandler("qb-store3: CheckOwnerStore", function(name, position)
    local idJ = source
    
    local found_store = getStoreServer(name, position)

    if isOwnerStore(idJ, found_store) then
        TriggerClientEvent("qb-store3: OpenDashboard", idJ, found_store.name, found_store.balance)
    elseif found_store.owner == 'none' then
        TriggerClientEvent("qb-store3: OpenBuyStore", idJ, name)
    else
        ---showNotification(idJ, translate.TR_HAS_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_HAS_OWNER, "error")
    end
end)

RegisterNetEvent("qb-store3: SendBuyStore")
AddEventHandler("qb-store3: SendBuyStore", function(name, position)
    local idJ = source
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner ~= "none" then
        -- has owner
       --- showNotification(idJ, translate.TR_HAS_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_HAS_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_HAS_OWNER)
        return
    else
        -- do not has owner
        local money = getBankMoney(idJ)
        local price = stores[name].price_store
        local identifier = getIdentifier(idJ)

        if player_can_only_own_one_store then
            for i,k in pairs(server_stores) do
                if k.owner == identifier then
                    ---showNotification(idJ, translate.TR_JUST_ONE_STORE)
					QBCore.Functions.Notify(idJ, translate.TR_JUST_ONE_STORE, "error")
                    TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_JUST_ONE_STORE)
                    return
                end
            end
        end

        if tonumber(money) < tonumber(price) then
            -- dont have money
            ---showNotification(idJ, translate.TR_DONT_HAVE_MONEY)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_HAVE_MONEY, "error")
            TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_DONT_HAVE_MONEY)
            return
        end

        removeBankMoney(idJ, price)
        found_store.owner = identifier

        exports.oxmysql:update('UPDATE stores SET owner = @owner WHERE id = @id', {
            ['owner'] = identifier,
            ['@id'] = id_store
        })

        exports.oxmysql:execute('SELECT * FROM stores WHERE id = @id', {
            ['@id'] = id_store
        }, function(result)
            if result and #result > 0 then
                local k = result[1]
                
                local coordinate = json.decode(k.coordinate)

                k.coordinate = vector3(coordinate.x, coordinate.y, coordinate.z)
                k.stock = json.decode(k.stock)
                k.products = json.decode(k.products)
                k.request = json.decode(k.request)
                k.balance = tonumber(k.balance)
                k.owner = identifier
                server_stores[k.id] = k
            end
        end)

        ---showNotification(idJ, translate.TR_PURCHASE_STORE)
		QBCore.Functions.Notify(idJ, translate.TR_PURCHASE_STORE, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")
    end
end)

RegisterNetEvent("qb-store3: SendSellStore")
AddEventHandler("qb-store3: SendSellStore", function(name, position)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local price = stores[name].price_store - (stores[name].price_store * (stores[name].percentage_sell/100.0))

        addBankMoney(idJ, price)
        found_store.owner = "none"

        exports.oxmysql:update('UPDATE stores SET owner = @owner WHERE id = @id', {
            ['owner'] = 'none',
            ['@id'] = id_store
        })

        --showNotification(idJ, translate.TR_SOLD_STORE)
		QBCore.Functions.Notify(idJ, translate.TR_SOLD_STORE, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")
    else
        -- is not owner
       --- showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        return
    end
end)

RegisterNetEvent("qb-store3: SendAddMoney")
AddEventHandler("qb-store3: SendAddMoney", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local value = tonumber(data.money)
        local money = getBankMoney(idJ)

        if tonumber(money) < tonumber(value) then
            -- dont have money
            --showNotification(idJ, translate.TR_DONT_HAVE_MONEY2)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_HAVE_MONEY2, "error")
            TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_DONT_HAVE_MONEY2)
            LoadBalance(idJ, name, position)
            return
        end

        removeBankMoney(idJ, value)
        found_store.balance = found_store.balance + value

        exports.oxmysql:update('UPDATE stores SET balance = @balance WHERE id = @id', {
            ['@balance'] = found_store.balance,
            ['@id'] = id_store
        })        

        ---showNotification(idJ, "You added money to the cashier.")
		QBCore.Functions.Notify(idJ, translate.TR_WITHDRAWED2, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadBalance(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        return
    end
end)

RegisterNetEvent("qb-store3: SendWithdraw")
AddEventHandler("qb-store3: SendWithdraw", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local value = tonumber(data.money)
        local money = found_store.balance

        if tonumber(money) < tonumber(value) then
            -- dont have money
            --showNotification(idJ, translate.TR_DONT_BALANCE)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_BALANCE, "error")
            TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_DONT_BALANCE)
            LoadBalance(idJ, name, position)
            return
        end

        addBankMoney(idJ, value)
        found_store.balance = found_store.balance - value

        exports.oxmysql:update('UPDATE stores SET balance = @balance WHERE id = @id', {
            ['@balance'] = found_store.balance,
            ['@id'] = id_store
        })  

        ---showNotification(idJ, translate.TR_WITHDRAWED)
		QBCore.Functions.Notify(idJ, translate.TR_WITHDRAWED, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadBalance(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        return
    end
end)

RegisterNetEvent("qb-store3: SendPutForSale")
AddEventHandler("qb-store3: SendPutForSale", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local item = data.item

        for i,k in pairs(found_store.stock) do
            if k.name == item.name then
                if tonumber(k.amount) < tonumber(item.amount_selected) then
                    -- dont have this amount
                    ---showNotification(idJ, translate.TR_STOCK_DONT_AMOUNT)
					QBCore.Functions.Notify(idJ, translate.TR_STOCK_DONT_AMOUNT, "error")
                    TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_STOCK_DONT_AMOUNT)
                    LoadStock(idJ, name, position)
                    return
                else
                    k.amount = k.amount - item.amount_selected
                end

                break
            end
        end

        for i,k in pairs(found_store.products) do
            if k.name == item.name then
                k.amount = k.amount + item.amount_selected
            end
        end

        exports.oxmysql:update('UPDATE stores SET products = @products, stock = @stock WHERE id = @id', {
            ['@products'] = json.encode(found_store.products),
            ['@stock'] = json.encode(found_store.stock),
            ['@id'] = id_store
        })

        ---showNotification(idJ, translate.TR_WAS_OFFERED)
		QBCore.Functions.Notify(idJ, translate.TR_WAS_OFFERED, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadStock(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        LoadStock(idJ, name, position)
        return
    end
end)

RegisterNetEvent("qb-store3: SendRemoveItem")
AddEventHandler("qb-store3: SendRemoveItem", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local item = data.item

        for i,k in pairs(found_store.products) do
            if k.name == item.name then
                if tonumber(k.amount) < tonumber(item.amount_selected) then
                    -- dont have this amount
                    --showNotification(idJ, translate.TR_PRODUCTS_DONT_AMOUNT)
					QBCore.Functions.Notify(idJ, translate.TR_PRODUCTS_DONT_AMOUNT, "error")
                    TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_PRODUCTS_DONT_AMOUNT)
                    LoadStock(idJ, name, position)
                    return
                else
                    k.amount = k.amount - item.amount_selected
                end

                break
            end
        end

        for i,k in pairs(found_store.stock) do
            if k.name == item.name then
                k.amount = k.amount + item.amount_selected
            end
        end

        exports.oxmysql:update('UPDATE stores SET products = @products, stock = @stock WHERE id = @id', {
            ['@products'] = json.encode(found_store.products),
            ['@stock'] = json.encode(found_store.stock),
            ['@id'] = id_store
        })

        ---showNotification(idJ, translate.TR_PUT_BACK)
		QBCore.Functions.Notify(idJ, translate.TR_PUT_BACK, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadStock(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        LoadStock(idJ, name, position)
        return
    end
end)

RegisterNetEvent("qb-store3: SendChangePrice")
AddEventHandler("qb-store3: SendChangePrice", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local item = data.item

        for i,k in pairs(found_store.products) do
            if k.name == item.name then
                if tonumber(k.max_price) >= tonumber(item.price_selected) then
                    k.price = item.price_selected
                else
                    -- price exceded 
                    ---showNotification(idJ, translate.TR_PRICE_HIGHER)
					QBCore.Functions.Notify(idJ, translate.TR_PRICE_HIGHER, "error")
                    TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_PRICE_HIGHER)
                    LoadStock(idJ, name, position)
                    return
                end     

                break
            end
        end

        exports.oxmysql:update('UPDATE stores SET products = @products WHERE id = @id', {
            ['@products'] = json.encode(found_store.products),
            ['@id'] = id_store
        })

        ---showNotification(idJ, translate.TR_PRICE_CHANGED)
		QBCore.Functions.Notify(idJ, translate.TR_PRICE_CHANGED, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadStock(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        LoadStock(idJ, name, position)
        return
    end
end)

RegisterNetEvent("qb-store3: SendRequestItem")
AddEventHandler("qb-store3: SendRequestItem", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local item = data.item
        local money = item.amount_selected * item.request_price

        if tonumber(found_store.balance) < money then
            -- dont have money
            ---showNotification(idJ, translate.TR_DONT_BALANCE2)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_BALANCE2, "error")
            TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_DONT_BALANCE2)
            LoadStock(idJ, name, position)
            return
        end

        found_store.balance = found_store.balance - money
        item.amount = item.amount_selected
        item.requested = 'none'

        table.insert(found_store.request, item)

        exports.oxmysql:update('UPDATE stores SET request = @request, balance = @balance WHERE id = @id', {
            ['@request'] = json.encode(found_store.request),
            ['@balance'] = found_store.balance,
            ['@id'] = id_store
        })

        ---showNotification(idJ, translate.TR_PRODUCT_REQUEST)
		QBCore.Functions.Notify(idJ, translate.TR_PRODUCT_REQUEST, "success")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")

        LoadStock(idJ, name, position)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_OWNER)
        return
    end
end)

RegisterNetEvent("qb-store3: AcceptMission")
AddEventHandler("qb-store3: AcceptMission", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store = getStoreServer(name, position)

    if found_store then
        -- does not exist
        local item = data.item
        local money = item.price * item.amount
        local requested = item.requested

        local found = false

        for i,k in pairs(server_stores) do
            for j,c in pairs(k.request) do
                if c.requested == identifier then
                    ---showNotification(idJ, translate.TR_ALREADY_MISSION)
					QBCore.Functions.Notify(idJ, translate.TR_ALREADY_MISSION, "error")
                    LoadMissions(idJ, name, position)
                    return
                end
            end
        end

        if not own_missions then
            if found_store.owner == identifier then
                ---showNotification(idJ, translate.TR_NOT_OWN_MISSION)
				QBCore.Functions.Notify(idJ, translate.TR_NOT_OWN_MISSION, "error")
                LoadMissions(idJ, name, position)
                return
            end
        end

        for i,k in pairs(found_store.request) do
            if k.name == item.name and tonumber(k.price * k.amount) == tonumber(money) and requested == k.requested then
                k.requested = identifier
                found = true
                break
            end
        end

        if not found then
            ---showNotification(idJ, translate.TR_DONT_EXIST)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_EXIST, "error")
            LoadMissions(idJ, name, position)
            return
        end

        TriggerClientEvent('qb-store3: AcceptMission', idJ, name, item.name)

        ----showNotification(idJ, translate.TR_RECEIVE_MISSION)
		QBCore.Functions.Notify(idJ, translate.TR_RECEIVE_MISSION, "success")
        LoadMissions(idJ, name, position)
    else
        -- does not exist
        print('Warning: Some store does not exist.')
    end
end)

RegisterNetEvent("qb-store3: CancelMission")
AddEventHandler("qb-store3: CancelMission", function(name, position, data)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store = getStoreServer(name, position)

    if found_store then
        -- does not exist
        local item = data.item
        local money = item.price * item.amount
        local requested = item.requested

        local found = false

        for i,k in pairs(found_store.request) do
            if k.name == item.name and tonumber(k.price * k.amount) == tonumber(money) and requested == k.requested and k.requested == identifier then
                k.requested = 'none'
                found = true
                break
            end
        end

        if not found then
            ---showNotification(idJ, translate.TR_DONT_EXIST)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_EXIST, "error")
            LoadMissions(idJ, name, position)
            return
        end

        TriggerClientEvent('qb-store3: CancelMission', idJ)

        ---showNotification(idJ, translate.TR_CANCEL_MISSION)
		QBCore.Functions.Notify(idJ, translate.TR_CANCEL_MISSION, "error")
        LoadMissions(idJ, name, position)
    else
        -- does not exist
        print('Warning: Some store does not exist.')
    end
end)

RegisterNetEvent("qb-store3: CompleteMission")
AddEventHandler("qb-store3: CompleteMission", function(name, position)
    local idJ = source
    local identifier = getIdentifier(idJ)
    local found_store, id_store = getStoreServer(name, position)

    if found_store then
        -- exist

        local found = false
        local money = 0
        for i,k in pairs(found_store.request) do
            if k.requested == identifier then
                for j,c in pairs(found_store.stock) do
                    if c.name == k.name then
                        c.amount = c.amount + k.amount
                        break
                    end
                end

                money = k.amount * k.mission_money

                table.remove(found_store.request, i)
                found = true

                break
            end
        end

        if not found then
            -- dont have money
            ---showNotification(idJ, translate.TR_DONT_EXIST)
			QBCore.Functions.Notify(idJ, translate.TR_DONT_EXIST, "error")
            return
        end

        addBankMoney(idJ, money)

        exports.oxmysql:update('UPDATE stores SET request = @request, stock = @stock WHERE id = @id', {
            ['@request'] = json.encode(found_store.request),
            ['@stock'] = json.encode(found_store.stock),
            ['@id'] = id_store
        })

        ----showNotification(idJ, translate.TR_COMPLETE_MISSION .. translate.TR_MONEY_SIMBOL .. ' ' .. money)
		QBCore.Functions.Notify(idJ, translate.TR_COMPLETE_MISSION .. translate.TR_MONEY_SIMBOL .. ' ' .. money, "success")
    else
        -- does not exist
        print('Warning: Some store does not exist.')
    end
end)

RegisterNetEvent("qb-store3: LoadBalance")
AddEventHandler("qb-store3: LoadBalance", function(name, position)
    LoadBalance(source, name, position)
end)

function LoadBalance(source, name, position)
    local identifier = getIdentifier(source)
    local found_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local money = found_store.balance
        TriggerClientEvent('qb-store3: LoadBalance', source, money)
    else
        -- is not owner
        ---showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        return
    end
end

RegisterNetEvent("qb-store3: LoadStock")
AddEventHandler("qb-store3: LoadStock", function(name, position)
    LoadStock(source, name, position)
end)

function LoadStock(source, name, position)
    local identifier = getIdentifier(source)
    local found_store = getStoreServer(name, position)

    if found_store and found_store.owner == identifier then
        -- is owner
        local products = found_store.products
        local stock = found_store.stock
        TriggerClientEvent('qb-store3: LoadStock', source, stock, products)
    else
        -- is not owner
        --showNotification(idJ, translate.TR_NOT_OWNER)
		QBCore.Functions.Notify(idJ, translate.TR_NOT_OWNER, "error")
        return
    end
end

RegisterNetEvent("qb-store3: LoadMissions")
AddEventHandler("qb-store3: LoadMissions", function(name, position)
    LoadMissions(source, name, position)
end)

function LoadMissions(source, name, position)
    local identifier = getIdentifier(source)
    local found_store = getStoreServer(name, position)

    if found_store then
        -- exist
        local missions = found_store.request
        TriggerClientEvent('qb-store3: LoadMissions', source, missions, identifier)
    else
        -- does not exist
        print('Warning: Some store does not exist.')
        return
    end
end

RegisterNetEvent("qb-store3: BuyItens")
AddEventHandler("qb-store3: BuyItens", function(name, position, data)
    local idJ = source    
    local money = getBankMoney(idJ)
    
    if use_weight_system then
        local weight_buy = 0
        for i,k in pairs(data.cart) do
            weight_buy = weight_buy + (k.weight * k.amount_selected)
        end

        if not canCarryItem(idJ, weight_buy) then
            TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_WEIGHT)
            return
        end
    else
        for i,k in pairs(data.cart) do
            if not canCarryItem(idJ, k.name, k.amount_selected) then
                TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_WEIGHT)
                return
            end
        end
    end

    local price = 0
    for i,k in pairs(data.cart) do
        price = price + (k.price * k.amount_selected)
    end

    local my_money = 0
    if(data.buy_method == translate.TR_BANK_ACCOUNT) then
        my_money = getBankMoney(idJ)
    elseif data.buy_method == translate.TR_WALLET_MONEY then
        my_money = getWalletMoney(idJ)
    end

    if tonumber(my_money) < tonumber(price) then
        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_NOT_MONEY)
        return
    end

    local found_store, id_store = getStoreServer(name, position)
    if found_store then
        for i,k in pairs(data.cart) do
            for j,c in pairs(found_store.products) do
                if k.name == c.name then
                    if tonumber(k.amount_selected) > tonumber(c.amount) then
                        -- dont have this amount
                        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "error", translate.TR_DONT_AMOUNT .. c.label)
                        return
                    end
                end
            end
        end

        if(data.buy_method == translate.TR_BANK_ACCOUNT) then
            removeBankMoney(idJ, price)
        elseif data.buy_method == translate.TR_WALLET_MONEY then
            removeWalletMoney(idJ, price)
        end

        for i,k in pairs(data.cart) do
            for j,c in pairs(found_store.products) do
                if k.name == c.name then
                    addInventoryItem(idJ, k.name, k.amount_selected)
                    c.amount = c.amount - k.amount_selected
                end
            end
        end

        if found_store.owner ~= 'none' then
            found_store.balance = found_store.balance + price
            
            exports.oxmysql:update('UPDATE stores SET products = @products, balance = @balance WHERE id = @id', {
                ['@products'] = json.encode(found_store.products),
                ['@balance'] = found_store.balance,
                ['@id'] = id_store
            })
        end

        TriggerClientEvent('qb-store3: SendPopMessage', idJ, "success")
    else
        -- Store not found
        print('Warning: Some store does not exist.')
    end
end)

function getStoreServer(name, coordinate)
    local x = tonumber(string.format("%.2f", tonumber(coordinate.x)))*1.0
    local y = tonumber(string.format("%.2f", tonumber(coordinate.y)))*1.0
    local z = tonumber(string.format("%.2f", tonumber(coordinate.z)))*1.0
    local pos = vector3(x,y,z)

    for i,k in pairs(server_stores) do
        local x2 = tonumber(string.format("%.2f", tonumber(k.coordinate.x)))*1.0
        local y2 = tonumber(string.format("%.2f", tonumber(k.coordinate.y)))*1.0
        local z2 = tonumber(string.format("%.2f", tonumber(k.coordinate.z)))*1.0

        local pos2 = vector3(x2, y2, z2)

        if k.name == name and pos2 == pos then
            return k, i
        end
    end

    return nil, -1
end

function isOwnerStore(source, store)
    local identifier = getIdentifier(source)

    if store then
        return store.owner == identifier
    end

    return false
end