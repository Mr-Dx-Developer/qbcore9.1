local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

local time = 1000
function loadModel(model) if not HasModelLoaded(model) then
	if Config.Debug then print("^5Debug^7: ^2Loading Model^7: '^6"..model.."^7'") end
	while not HasModelLoaded(model) do
		if time > 0 then time -= 1 RequestModel(model)
		else time = 1000 print("^5Debug^7: ^3LoadModel^7: ^2Timed out loading model ^7'^6"..model.."^7'") break
		end
		Wait(10)
	end
end end
function unloadModel(model) if Config.Debug then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end
function loadAnimDict(dict)	if not HasAnimDictLoaded(dict) then if Config.Debug then print("^5Debug^7: ^2Loading Anim Dictionary^7: '^6"..dict.."^7'") end while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end end
function unloadAnimDict(dict) if Config.Debug then print("^5Debug^7: ^2Removing Anim Dictionary^7: '^6"..dict.."^7'") end RemoveAnimDict(dict) end
function loadPtfxDict(dict)	if not HasNamedPtfxAssetLoaded(dict) then if Config.Debug then print("^5Debug^7: ^2Loading Ptfx Dictionary^7: '^6"..dict.."^7'") end while not HasNamedPtfxAssetLoaded(dict) do RequestNamedPtfxAsset(dict) Wait(5) end end end
function unloadPtfxDict(dict) if Config.Debug then print("^5Debug^7: ^2Removing Ptfx Dictionary^7: '^6"..dict.."^7'") end RemoveNamedPtfxAsset(dict) end

function destroyProp(entity)
	if Config.Debug then print("^5Debug^7: ^2Destroying Prop^7: '^6"..entity.."^7'") end
	SetEntityAsMissionEntity(entity) Wait(5)
	--DetachEntity(entity, true, true) Wait(5)
	DeleteObject(entity)
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, 0.0, 0.0, 0.0, synced or false, synced or false, false)
    SetEntityHeading(prop, data.coords.w+180.0)
    --FreezeEntityPosition(prop, freeze or false)
    SetEntityCompletelyDisableCollision(prop, true, false)
    DisableCamCollisionForEntity(prop)
    DisableCamCollisionForObject(prop)
    if Config.Debug then print("^5Debug^7: ^6Prop ^2Created ^7: '^6"..prop.."^7'") end
    return prop
end
function triggerNotify(title, message, type, src)
	if Config.Notify == "okok" then
		if not src then	exports['okokNotify']:Alert(title, message, 6000, type)
		else TriggerClientEvent('okokNotify:Alert', src, title, message, 6000, type) end
	elseif Config.Notify == "qb" then
		if not src then	TriggerEvent("QBCore:Notify", message, type)
		else TriggerClientEvent("QBCore:Notify", src, message, type) end
	elseif Config.Notify == "t" then
		if not src then exports['t-notify']:Custom({title = title, style = type, message = message, sound = true})
		else TriggerClientEvent('t-notify:client:Custom', src, { style = type, duration = 6000, title = title, message = message, sound = true, custom = true}) end
	elseif Config.Notify == "infinity" then
		if not src then TriggerEvent('infinity-notify:sendNotify', message, type)
		else TriggerClientEvent('infinity-notify:sendNotify', src, message, type) end
	elseif Config.Notify == "rr" then
		if not src then exports.rr_uilib:Notify({msg = message, type = type, style = "dark", duration = 6000, position = "top-right", })
		else TriggerClientEvent("rr_uilib:Notify", src, {msg = message, type = type, style = "dark", duration = 6000, position = "top-right", }) end
	end
end

function countTable(table) local i = 0 for keys in pairs(table) do i += 1 end return i end

function toggleItem(give, item, amount) TriggerServerEvent("ns-bars:server:toggleItem", give, item, amount) end

--Screen Effects
local alienEffect = false
function AlienEffect()
    if alienEffect then return else alienEffect = true end
    if Config.Debug then print("^5Debug^7: ^3AlienEffect^7() ^2activated") end
    AnimpostfxPlay("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local Ped = PlayerPedId()
    local animDict = "MOVE_M@DRUNK@VERYDRUNK"
    loadAnimDict(animDict)
    SetPedCanRagdoll(Ped, true)
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(Ped, animDict, 1)
    SetPedMotionBlur(Ped, true)
    SetPedIsDrunk(Ped, true)
    Wait(1500)
    SetPedToRagdoll(Ped, 5000, 1000, 1, 0, 0, 0)
    Wait(13500)
    SetPedToRagdoll(Ped, 5000, 1000, 1, 0, 0, 0)
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(Ped, 0)
    SetPedIsDrunk(Ped, false)
    SetPedMotionBlur(Ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    AnimpostfxPlay("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))
    AnimpostfxPlay("DrugsMichaelAliensFightOut", 3.0, 0)
    AnimpostfxStop("DrugsMichaelAliensFightIn")
    AnimpostfxStop("DrugsMichaelAliensFight")
    AnimpostfxStop("DrugsMichaelAliensFightOut")
    alienEffect = false
    if Config.Debug then print("^5Debug^7: ^3AlienEffect^7() ^2stopped") end
end
local weedEffect = false
function WeedEffect()
    if weedEffect then return else weedEffect = true end
    if Config.Debug then print("^5Debug^7: ^3WeedEffect^7() ^2activated") end
    AnimpostfxPlay("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(3000, 20000))
    AnimpostfxPlay("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(15000, 20000))
    AnimpostfxPlay("DrugsMichaelAliensFightOut", 3.0, 0)
    AnimpostfxStop("DrugsMichaelAliensFightIn")
    AnimpostfxStop("DrugsMichaelAliensFight")
    AnimpostfxStop("DrugsMichaelAliensFightOut")
    weedEffect = false
    if Config.Debug then print("^5Debug^7: ^3WeedEffect^7() ^2stopped") end
end
local trevorEffect = false
function TrevorEffect()
    if trevorEffect then return else trevorEffect = true end
    if Config.Debug then print("^5Debug^7: ^3TrevorEffect^7() ^2activated") end
    AnimpostfxPlay("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    AnimpostfxPlay("DrugsTrevorClownsFight", 3.0, 0)
    Wait(30000)
	AnimpostfxPlay("DrugsTrevorClownsFightOut", 3.0, 0)
	AnimpostfxStop("DrugsTrevorClownsFight")
	AnimpostfxStop("DrugsTrevorClownsFightIn")
	AnimpostfxStop("DrugsTrevorClownsFightOut")
    trevorEffect = false
    if Config.Debug then print("^5Debug^7: ^3TrevorEffect^7() ^2stopped") end
end
local turboEffect = false
function TurboEffect()
    if turboEffect then return else turboEffect = true end
    if Config.Debug then print("^5Debug^7: ^3TurboEffect^7() ^2activated") end
    AnimpostfxPlay('RaceTurbo', 0, true)
    SetTimecycleModifier('rply_motionblur')
    ShakeGameplayCam('SKY_DIVING_SHAKE', 0.25)
    Wait(30000)
    StopGameplayCamShaking(true)
    SetTransitionTimecycleModifier('default', 0.35)
    Wait(1000)
    ClearTimecycleModifier()
    AnimpostfxStop('RaceTurbo')
    turboEffect = false
    if Config.Debug then print("^5Debug^7: ^3TurboEffect^7() ^2stopped") end
end
local rampageEffect = false
function RampageEffect()
    if rampageEffect then return else rampageEffect = true end
    if Config.Debug then print("^5Debug^7: ^3RampageEffect^7() ^2activated") end
    AnimpostfxPlay('Rampage', 0, true)
    SetTimecycleModifier('rply_motionblur')
    ShakeGameplayCam('SKY_DIVING_SHAKE', 0.25)
    Wait(30000)
    StopGameplayCamShaking(true)
    SetTransitionTimecycleModifier('default', 0.35)
    Wait(1000)
    ClearTimecycleModifier()
    AnimpostfxStop('Rampage')
    rampageEffect = false
    if Config.Debug then print("^5Debug^7: ^3RampageEffect^7() ^2stopped") end
end
local focusEffect = false
function FocusEffect()
    if focusEffect then return else focusEffect = true end
    if Config.Debug then print("^5Debug^7: ^3FocusEffect^7() ^2activated") end
    Wait(1000)
    AnimpostfxPlay('FocusIn', 0, true)
    Wait(30000)
    AnimpostfxStop('FocusIn')
    focusEffect = false
    if Config.Debug then print("^5Debug^7: ^3FocusEffect^7() ^2stopped") end
end
local NightVisionEffect = false
function NightVisionEffect()
    if NightVisionEffect then return else NightVisionEffect = true end
    if Config.Debug then print("^5Debug^7: ^3NightVisionEffect^7() ^2activated") end
    SetNightvision(true)
    Wait(math.random(3000, 4000))  -- FEEL FREE TO CHANGE THIS
    SetNightvision(false)
    SetSeethrough(false)
    NightVisionEffect = false
    if Config.Debug then print("^5Debug^7: ^3NightVisionEffect^7() ^2stopped") end
end
local thermalEffect = false
function ThermalEffect()
    if thermalEffect then return else thermalEffect = true end
    if Config.Debug then print("^5Debug^7: ^3ThermalEffect^7() ^2activated") end
    SetNightvision(true)
    SetSeethrough(true)
    Wait(math.random(2000, 3000))  -- FEEL FREE TO CHANGE THIS
    SetNightvision(false)
    SetSeethrough(false)
    thermalEffect = false
    if Config.Debug then print("^5Debug^7: ^3ThermalEffect^7() ^2stopped") end
end

--Built-in Buff effects
local healEffect = false
function HealEffect(data)
    if healEffect then return end
    if Config.Debug then print("^5Debug^7: ^3HealEffect^7() ^2activated") end
    healEffect = true
    local count = (data[1] / 1000)
    while count > 0 do
        Wait(1000)
        count -= 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + data[2])
    end
    healEffect = false
    if Config.Debug then print("^5Debug^7: ^3HealEffect^7() ^2stopped") end
end

local staminaEffect = false
function StaminaEffect(data)
    if staminaEffect then return end
    if Config.Debug then print("^5Debug^7: ^3StaminaEffect^7() ^2activated") end
    staminaEffect = true
    local startStamina = (data[1] / 1000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then RestorePlayerStamina(PlayerId(), data[2]) end
        startStamina -= 1
        if math.random(5, 100) < 51 then end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    staminaEffect = false
    if Config.Debug then print("^5Debug^7: ^3StaminaEffect^7() ^2stopped") end
end

function StopEffects() -- Used to clear up any effects stuck on screen
    if Config.Debug then print("^5Debug^7: ^2All screen effects stopped") end
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    SetPedToRagdoll(PlayerPedId(), 5000, 1000, 1, 0, 0, 0)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(PlayerPedId(), 0)
    SetPedIsDrunk(PlayerPedId(), false)
    SetPedMotionBlur(PlayerPedId(), false)
    SetNightvision(false)
    SetSeethrough(false)
    AnimpostfxStop("DrugsMichaelAliensFightIn")
    AnimpostfxStop("DrugsMichaelAliensFight")
    AnimpostfxStop("DrugsMichaelAliensFightOut")
	AnimpostfxStop("DrugsTrevorClownsFight")
	AnimpostfxStop("DrugsTrevorClownsFightIn")
	AnimpostfxStop("DrugsTrevorClownsFightOut")
    AnimpostfxStop('RaceTurbo')
    AnimpostfxStop('FocusIn')
    AnimpostfxStop('Rampage')
end

local time = 1000
function loadModel(model) if not HasModelLoaded(model) then
	if Config.Debug then print("^5Debug^7: ^3loadModel^7(): ^2Loading Model^7: '^6"..model.."^7'") end
		while not HasModelLoaded(model) do
			if time > 0 then time = time - 1 RequestModel(model)
			else time = 1000 print("^5Debug^7: ^3loadModel^7(): ^2Timed out loading model ^7'^6"..model.."^7'") break
			end
			Wait(10)
		end
	end
end
function unloadModel(model) if Config.Debug then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end
function loadAnimDict(dict) if Config.Debug then print("^5Debug^7: ^2Loading Anim Dictionary^7: '^6"..dict.."^7'") end while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(5) end end
function unloadAnimDict(dict) if Config.Debug then print("^5Debug^7: ^2Removing Anim Dictionary^7: '^6"..dict.."^7'") end RemoveAnimDict(dict) end
function loadPtfxDict(dict)	if Config.Debug then print("^5Debug^7: ^2Loading Ptfx Dictionary^7: '^6"..dict.."^7'") end while not HasNamedPtfxAssetLoaded(dict) do RequestNamedPtfxAsset(dict) Wait(5) end end
function unloadPtfxDict(dict) if Config.Debug then print("^5Debug^7: ^2Removing Ptfx Dictionary^7: '^6"..dict.."^7'") end RemoveNamedPtfxAsset(dict) end

function lookEnt(entity)
	if type(entity) == "vector3" then
		if not IsPedHeadingTowardsPosition(PlayerPedId(), entity, 10.0) then
			TaskTurnPedToFaceCoord(PlayerPedId(), entity, 1500)
			if Config.Debug then print("^5Debug^7: ^3lookEnt^7(): ^2Turning Player to^7: '^6"..json.encode(entity).."^7'") end
			Wait(1500)
		end
	else
		if DoesEntityExist(entity) then
			if not IsPedHeadingTowardsPosition(PlayerPedId(), GetEntityCoords(entity), 30.0) then
				TaskTurnPedToFaceCoord(PlayerPedId(), GetEntityCoords(entity), 1500)
				if Config.Debug then print("^5Debug^7: ^3lookEnt^7(): ^2Turning Player to^7: '^6"..entity.."^7'") end
				Wait(1500)
			end
		end
	end
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or false, synced or false, false)
    SetEntityHeading(prop, data.coords.w)
    FreezeEntityPosition(prop, freeze or 0)
	if Config.Debug then
		local coords = { string.format("%.2f", data.coords.x), string.format("%.2f", data.coords.y), string.format("%.2f", data.coords.z), (string.format("%.2f", data.coords.w or 0.0)) }
		print("^5Debug^7: ^1Prop ^2Created^7: '^6"..prop.."^7' | ^2Hash^7: ^7'^6"..(data.prop).."^7' | ^2Coord^7: ^5vec4^7(^6"..(coords[1]).."^7, ^6"..(coords[2]).."^7, ^6"..(coords[3]).."^7, ^6"..(coords[4]).."^7)")
	end
    return prop
end

function makePed(model, coords, freeze, collision, scenario, anim)
	loadModel(model)
	local ped = CreatePed(0, model, coords.x, coords.y, coords.z-1.03, coords.w, false, false)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, freeze or true)
    if collision then SetEntityNoCollisionEntity(ped, PlayerPedId(), false) end
    if scenario then TaskStartScenarioInPlace(ped, scenario, 0, true) end
    if anim then
        loadAnimDict(anim[1])
        TaskPlayAnim(ped, anim[1], anim[2], 1.0, 1.0, -1, 1, 0.2, 0, 0, 0)
    end
	if Config.Debug then
		local coords = { string.format("%.2f", coords.x), string.format("%.2f", coords.y), string.format("%.2f", coords.z), (string.format("%.2f", coords.w or 0.0)) }
		print("^5Debug^7: ^1Ped ^2Created^7: '^6"..ped.."^7' | ^2Hash^7: ^7'^6"..(model).."^7' | ^2Coord^7: ^5vec4^7(^6"..(coords[1]).."^7, ^6"..(coords[2]).."^7, ^6"..(coords[3]).."^7, ^6"..(coords[4]).."^7)")
	end
    return ped
end

function makeBlip(data)
	local blip = AddBlipForCoord(data.coords)
	SetBlipAsShortRange(blip, true)
	SetBlipSprite(blip, data.sprite or 1)
	SetBlipColour(blip, data.col or 0)
	SetBlipScale(blip, data.scale or 0.7)
	SetBlipDisplay(blip, (data.disp or 6))
    if data.category then SetBlipCategory(blip, data.category) end
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString(tostring(data.name))
	EndTextCommandSetBlipName(blip)
	if Config.Debug then print("^5Debug^7: ^6Blip ^2created for location^7: '^6"..data.name.."^7'") end
    return blip
end

function triggerNotify(title, message, type, src)
		if not src then	TriggerEvent("QBCore:Notify", message, type)
		else TriggerClientEvent("QBCore:Notify", src, message, type) end
end

function pairsByKeys(t) local a = {} for n in pairs(t) do a[#a+1] = n end table.sort(a) local i = 0 local iter = function() i += 1 if a[i] == nil then return nil else return a[i], t[a[i]] end end return iter end

function searchCar(vehicle)
	local newName = nil
	for k, v in pairs(QBCore.Shared.Vehicles) do
		if tonumber(v.hash) == GetHashKey(vehicle) then
		if Config.Debug then print("^5Debug^7: ^2Vehicle info found in^7 ^4vehicles^7.^4lua^7: ^6"..v.hash.. " ^7(^6"..QBCore.Shared.Vehicles[k].name.."^7)") end
		newName = QBCore.Shared.Vehicles[k].name.." "..QBCore.Shared.Vehicles[k].brand
		end
	end
	if Config.Debug then
		if not newName then print("^5Debug^7: ^2Vehicle ^1not ^2found in ^4vehicles^7.^4lua^7: ^6"..vehicle.." ^7(^6"..GetDisplayNameFromVehicleModel(vehicle):lower().."^7)") end
	end
	if not newName then
		local name = GetDisplayNameFromVehicleModel(vehicle):lower()
		local brand = GetMakeNameFromVehicleModel(vehicle):lower()
		newName = name:sub(1,1):upper()..name:sub(2).." "..brand:sub(1,1):upper()..brand:sub(2)
	end
	return newName
end
