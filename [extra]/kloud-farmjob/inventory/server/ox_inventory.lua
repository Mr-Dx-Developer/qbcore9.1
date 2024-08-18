if GetResourceState("ox_inventory") ~= "started" then return end

Inventory = exports.ox_inventory

AddItem = function(inv, item, amount, metadata)
    return Inventory:AddItem(inv, item, amount, metadata)
end

RemoveItem = function(inv, item, amount, metadata, slot)
    return Inventory:RemoveItem(inv, item, amount, metadata, slot)
end

CanCarryItem = function(inv, item, amount)
    return Inventory:CanCarryItem(inv, item, amount)
end

GetItemCount = function(inv, item)
    if Inventory:GetItemCount(inv, item, nil, false) >= 1 then return true end
    return false
end

GetSlotWithItem = function(inv, item, metadata, strict)
    return Inventory:GetSlotWithItem(inv, item, metadata, strict)
end

SetDurability = function(inv, slot, durability)
    return Inventory:SetDurability(inv, slot, durability)
end