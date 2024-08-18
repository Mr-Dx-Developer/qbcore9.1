RegisterNetEvent("kloud-farm:client:openSell", function()
    local optionsTbl = {}
    for k, v in pairs(KloudDev.Shops) do
        if k == "sell" then
            for _, data in pairs(v.prices) do
                if GetItemCount(data[1], nil, false) > 0 then
                    local values = {}
                    for i = 1, GetItemCount(data[1], nil, false) do
                        if i <= KloudDev.WashLocations.maxWash then
                            table.insert(values, i)
                        end
                    end
                    table.insert(optionsTbl, {
                        label = FormatStr(data[1]) .. " $".. data[2],
                        icon = KloudDev.ImagePath .. data[1] .. ".png",
                        values = values,
                        args = {
                            item = data[1],
                            price = data[2]
                        }
                    })
                else
                    table.insert(optionsTbl, {
                        label = FormatStr(data[1]),
                        icon = KloudDev.ImagePath .. data[1] .. ".png",
                        close = false
                    })
                end
            end
        end
    end
    lib.registerMenu({
        id = "kloud-farm:sell",
        title = locale("sell_crops"),
        position = "top-right",
        options = optionsTbl,
        disableInput = true,
    }, function(selected, scrollIndex, args)
        if scrollIndex then
            local sold = lib.callback.await("kloud-farm:callback:sellItem", false, {item = args.item, price = args.price, amount = scrollIndex})
            if sold then
                lib.hideMenu(false)
            end
        end
    end)

    lib.showMenu("kloud-farm:sell")
end)

RegisterNetEvent("kloud-farm:client:openShop", function()
    local optionsTbl = {}
    for k, v in pairs(KloudDev.Shops) do
        if k == "shop" then
            for _, data in pairs(v.prices) do
                local values = {}
                for i = 1, 10 do
                    table.insert(values, i)
                end
                table.insert(optionsTbl, {
                    label = "$" .. data[2] .." ".. FormatStr(data[1]),
                    icon = KloudDev.ImagePath .. data[1] .. ".png",
                    values = values,
                    args = {
                        item = data[1],
                        price = data[2]
                    }
                })
            end
        end
    end
    lib.registerMenu({
        id = "kloud-farm:shop",
        title = locale("farmer_shop"),
        position = "top-right",
        options = optionsTbl,
        disableInput = true,
    }, function(selected, scrollIndex, args)
        if scrollIndex then
            local sold = lib.callback.await("kloud-farm:callback:buyItem", false, {item = args.item, price = args.price, amount = scrollIndex})
            if sold then
                lib.hideMenu(false)
            end
        end
    end)

    lib.showMenu("kloud-farm:shop")
end)