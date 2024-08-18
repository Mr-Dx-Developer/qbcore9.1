if GetResourceState("qb-target") ~= "started" or GetResourceState("ox_target") == "started" then return end

AddTarget = function (coords, radius, options)
    local optionsTbl = {}
    local distance = 2.0
    for _, v in pairs(options) do
        table.insert(optionsTbl, {
            label = v.label,
            name = v.name,
            event = v.event or nil,
            icon = v.icon,
            canInteract = v.canInteract or nil,
            action = v.onSelect or nil,
            currentZone = v.currentZone
        })
        distance = v.distance
    end
    exports['qb-target']:AddCircleZone(options[1].name, coords, radius, {
        name = options[1].name,
        debugPoly = KloudDev.Debug
    }, {
        options = optionsTbl,
        distance = distance
    })
end

AddEntityTarget = function (entity, options)
    local optionsTbl = {}
    local distance = 2.0
    for _, v in pairs(options) do
        table.insert(optionsTbl, {
            type = "client",
            event = v.event or nil,
            icon = v.icon,
            label = v.label,
            action = v.onSelect or nil,
            canInteract = v.canInteract or nil,
            currentZone = v.currentZone
        })
    end
    if NetworkGetEntityIsNetworked(entity) then
        local netId = NetworkGetNetworkIdFromEntity(entity)
        exports["qb-target"]:AddTargetEntity(netId, {options = optionsTbl, distance = distance})
    else
        exports["qb-target"]:AddTargetEntity(entity, {options = optionsTbl, distance = distance})
    end
end

AddTargetModel = function(model, options)
    local optionsTbl = {}
    local distance = 2.0
    for _, v in pairs(options) do
        distance = v.distance or 2.0
        table.insert(optionsTbl, {
            type = "client",
            event = v.event or nil,
            icon = v.icon,
            label = v.label,
            action = v.onSelect or nil,
            canInteract = v.canInteract or nil,
            currentZone = v.currentZone
        })
    end
    exports["qb-target"]:AddTargetModel(model, {options = optionsTbl, distance = distance})
end

RemoveEntityTarget = function(entity, optionNames, labels)
    if NetworkGetEntityIsNetworked(entity) then
        local netId = NetworkGetNetworkIdFromEntity(entity)
        exports["qb-target"]:RemoveTargetEntity(netId, labels)
    else
        exports["qb-target"]:RemoveTargetEntity(entity, labels)
    end
end