if GetResourceState("qs-inventory") ~= "started" then return end

Inventory = exports["qs-inventory"]

AddItem = function(inv, item, amount, metadata)
    return Inventory:AddItem(inv, item, amount, false, metadata)
end

RemoveItem = function(inv, item, amount, metadata, slot)
    return Inventory:RemoveItem(inv, item, amount, slot, metadata)
end

CanCarryItem = function(inv, item, amount)
    return Inventory:CanCarryItem(inv, item, amount)
end

GetItemCount = function(inv, item)
    if Inventory:GetItemTotalAmount(inv, item) >= 1 then return true end
    return false
end

GetSlotWithItem = function(inv, item, metadata, strict)
    local items = Inventory:GetInventory(inv)
    for itemData, slotData in pairs(items) do
        if slotData.name == item then
            slotData.metadata = slotData.info
            return slotData
        end
    end
    return false
end

SetDurability = function(inv, slot, durability)
    return true
end

lib.callback.register("GetItemCount", function(source, item)
    return Inventory:GetItemTotalAmount(source, item)
end)