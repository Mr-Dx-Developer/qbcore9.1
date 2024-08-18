if GetResourceState("ox_inventory") ~= "started" then return end

Inventory = exports.ox_inventory

GetItemCount = function(itemName, metadata, strict)
    return Inventory:GetItemCount(itemName, metadata, strict)
end