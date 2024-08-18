local spawnedProps = 0

GetZCoord = function (x, y, groundHeights)
	local groundCheckHeights = groundHeights

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height, true)

		if foundGround then
			return z
		end
	end

	return 76
end

ValidateCoord = function(coord)
	local validate = true
	if spawnedProps > 0 then
		for _, v in pairs(_T.Props) do
			if #(coord - GetEntityCoords(v)) < 5 then
				validate = false
			end
		end
	end
	return validate
end

GetCoords = function (zone)
    local loc = KloudDev.Locations[zone]
    local groundHeight = {}
    local value = loc.coords.z - 15
    local radius = math.floor(loc.zoneRadius / 2)
    for i = 1, 30 do
        value += 1
        table.insert(groundHeight, value)
    end
	while true do
		Wait(1)
		local propCoordX, propCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(radius * -1 , radius)

		Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-35, 35)

		propCoordX = loc.coords.x + modX
		propCoordY = loc.coords.y + modY

		local coordZ = GetZCoord(propCoordX, propCoordY, groundHeight)
		local coord = vector3(propCoordX, propCoordY, coordZ)

		if ValidateCoord(coord) then
			return coord
		end
	end
end

SpawnProps = function(zone)
    local loc = KloudDev.Locations[zone]
    while spawnedProps < loc.max do
        Wait(0)
        lib.requestModel(loc.prop, 10000)
        local propCoords = GetCoords(zone)
		local obj = CreateObject(joaat(loc.prop), propCoords.x, propCoords.y, propCoords.z, false, true, false)
        while not DoesEntityExist(obj) do Wait(100) end
        AddEntityTarget(obj, {
            {
                event = 'kloud-farm:client:pickProp',
                label = loc.target.label,
                name = "PickProps",
                icon = loc.target.icon,
                currentZone = _G.CurrentZone,
                canInteract = function()
                    if not _G.IsBusy and _G.CurrentZone == zone then return true end
                    return false
                end,
                distance = 2,
            }
        })
        SetEntityAsMissionEntity(obj, true, true)
		PlaceObjectOnGroundProperly(obj)
		FreezeEntityPosition(obj, true)
		table.insert(_T.Props, obj)
        spawnedProps = #_T.Props
    end
    SetModelAsNoLongerNeeded(joaat(loc.prop))
end

WashCrops = function(data)
    local zoneData = KloudDev.WashLocations
    local canCarry, msg = lib.callback.await("kloud-farm:callback:canCarry", false, data)
    local duration = zoneData.duration * data.amount
    if not canCarry then Notify(msg, "error") return end
    _G.IsBusy = true
    if zoneData.anim.scenario then
        TaskStartScenarioInPlace(cache.ped, zoneData.anim.scenario, 0, false)
    else
        PlayAnim(cache.ped, zoneData.anim.dict, zoneData.anim.clip, -1, zoneData.anim.upperBody)
    end

    if not Progress(duration, locale("washing", FormatStr(data.itemRequired))) then 
        ClearPedTasksImmediately(cache.ped)
        _G.IsBusy = false
        return
    end
    ClearPedTasksImmediately(cache.ped)
    _G.IsBusy = false
    lib.callback("kloud-farm:callback:washed", 3000, nil, data)
end

ClearProps = function()
    for k, v in pairs(_T.Props) do
        if DoesEntityExist(v) then
            if not DeleteObject(v) then DeleteObject(v) end
            table.remove(_T.Props, k)
            spawnedProps = #_T.Props
        else
            table.remove(_T.Props, k)
            spawnedProps = #_T.Props
        end
    end
end

DeleteProp = function(prop)
    for k, v in pairs(_T.Props) do
        if prop == v then
            if not DoesEntityExist(v) then table.remove(_T.Props, k) end

            if not DeleteObject(v) then DeleteObject(v) end
            table.remove(_T.Props, k)
            spawnedProps = #_T.Props
            SpawnProps(_G.CurrentZone)
        end
    end
end

CanPick = function(entity)
    for _, info in pairs(_T.PickedTrees) do
        for k, v in pairs(info) do
            if v == entity then return false end
        end
    end
    return true
end