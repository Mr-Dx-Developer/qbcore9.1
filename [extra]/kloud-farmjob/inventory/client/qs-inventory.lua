if GetResourceState("qs-inventory") ~= "started" then return end

Inventory = exports["qs-inventory"]

GetItemCount = function(itemName, metadata, strict)
    local count = lib.callback.await("GetItemCount", false, itemName)
    return count
end