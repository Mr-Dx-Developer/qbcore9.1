local qbVariations = {"qb-inventory", "ps-inventory", "lj-inventory"}
local Inventory = exports["qb-inventory"]
local foundInv = false

for i = 1, #qbVariations do
    if GetResourceState(qbVariations[i]) ~= "started" then
        if i == #qbVariations then
            if not foundInv then
                return
            end
        end
    else
        foundInv = true
        Inventory = exports[qbVariations[i]]
        KloudDev.ImagePath = "https://cfx-nui-".. qbVariations[i] .. "/html/images/"
    end
end


GetItemCount = function(itemName, metadata, strict)
    local count = lib.callback.await("GetItemCount", false, itemName)
    return count
end