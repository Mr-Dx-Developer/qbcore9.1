local QBCore = exports["qb-core"]:GetCoreObject()

local Action = {
    name = "",
    duration = 0,
    label = "",
    useWhileDead = false,
    canCancel = true,
	disarm = true,
    controlDisables = {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    },
    animation = {
        animDict = nil,
        anim = nil,
        flags = 0,
        task = nil,
    },
    prop = {
        model = nil,
        bone = nil,
        coords = { x = 0.0, y = 0.0, z = 0.0 },
        rotation = { x = 0.0, y = 0.0, z = 0.0 },
    },
    propTwo = {
        model = nil,
        bone = nil,
        coords = { x = 0.0, y = 0.0, z = 0.0 },
        rotation = { x = 0.0, y = 0.0, z = 0.0 },
    },
}

local isDoingAction = false
local wasCancelled = false
local isAnim = false
local isProp = false
local isPropTwo = false
local prop_net = nil
local propTwo_net = nil
local runProgThread = false

RegisterNetEvent('progressbar:client:ToggleBusyness', function(bool)
    isDoingAction = bool
end)

function ActionCleanup()
    local ped = PlayerPedId()

    if Action.animation then
        if Action.animation.task or (Action.animation.animDict and Action.animation.anim) then
            ClearPedSecondaryTask(ped)
            StopAnimTask(ped, Action.animDict, Action.anim, 1.0)
        end
    end
    if prop_net then
        DetachEntity(NetToObj(prop_net), 1, 1)
        DeleteEntity(NetToObj(prop_net))
        prop_net = nil
    end

    if propTwo_net then
        DetachEntity(NetToObj(propTwo_net), 1, 1)
        DeleteEntity(NetToObj(propTwo_net))
        propTwo_net = nil
    end

    runProgThread = false
end

local function Cancel()
    TriggerEvent('progressbar:setstatus', false)
    isDoingAction = false
    wasCancelled = true

    LocalPlayer.state:set("inv_busy", false, true) -- Not Busy
    ActionCleanup()

    SendNUIMessage({
        action = "cancel"
    })
end

local function Finish()
    TriggerEvent('progressbar:setstatus', false)
    isDoingAction = false
    ActionCleanup()
    LocalPlayer.state:set("inv_busy", false, true) -- Not Busy
end

local function DisableActions()
    if Action.controlDisables.disableMouse then
        DisableControlAction(0, 1, true) -- LookLeftRight
        DisableControlAction(0, 2, true) -- LookUpDown
        DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
    end

    if Action.controlDisables.disableMovement then
        DisableControlAction(0, 30, true) -- disable left/right
        DisableControlAction(0, 31, true) -- disable forward/back
        DisableControlAction(0, 36, true) -- INPUT_DUCK
        DisableControlAction(0, 21, true) -- disable sprint
    end

    if Action.controlDisables.disableCarMovement then
        DisableControlAction(0, 63, true) -- veh turn left
        DisableControlAction(0, 64, true) -- veh turn right
        DisableControlAction(0, 71, true) -- veh forward
        DisableControlAction(0, 72, true) -- veh backwards
        DisableControlAction(0, 75, true) -- disable exit vehicle
    end

    if Action.controlDisables.disableCombat then
        DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
        DisableControlAction(0, 24, true) -- disable attack
        DisableControlAction(0, 25, true) -- disable aim
        DisableControlAction(1, 37, true) -- disable weapon select
        DisableControlAction(0, 47, true) -- disable weapon
        DisableControlAction(0, 58, true) -- disable weapon
        DisableControlAction(0, 140, true) -- disable melee
        DisableControlAction(0, 141, true) -- disable melee
        DisableControlAction(0, 142, true) -- disable melee
        DisableControlAction(0, 143, true) -- disable melee
        DisableControlAction(0, 263, true) -- disable melee
        DisableControlAction(0, 264, true) -- disable melee
        DisableControlAction(0, 257, true) -- disable melee
    end
end

local function loadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        while not HasAnimDictLoaded(dict) do
            RequestAnimDict(dict)
            Wait(25)
        end
    end
end

local function loadModel(model)
    if not HasModelLoaded(model) then
        while not HasModelLoaded(model) do
            RequestModel(model)
            Wait(25)
        end
    end
end

local function ActionStart()
    runProgThread = true
    LocalPlayer.state:set("inv_busy", true, true) -- Busy

    CreateThread(function()
        while runProgThread do
            if isDoingAction then
                if not isAnim then
                    if Action.animation then
                        if Action.animation.task then
                            TaskStartScenarioInPlace(PlayerPedId(), Action.animation.task, 0, true)
                        elseif Action.animation.animDict and Action.animation.anim then
                            if Action.animation.flags == nil then
                                Action.animation.flags = 1
                            end

                            local player = PlayerPedId()
                            if (DoesEntityExist(player) and not IsEntityDead(player)) then
                                loadAnimDict( Action.animation.animDict)
                                TaskPlayAnim(player, Action.animation.animDict, Action.animation.anim, 3.0, 3.0, -1, Action.animation.flags, 0, 0, 0, 0 )
                            end
                        end
                    end

                    isAnim = true
                end
                if not isProp and Action.prop and Action.prop.model then
                    loadModel(joaat(Action.prop.model))

                    local pCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                    local modelSpawn = CreateObject(joaat(Action.prop.model), pCoords.x, pCoords.y, pCoords.z, true, true, true)

                    local netid = ObjToNet(modelSpawn)
                    SetNetworkIdExistsOnAllMachines(netid, true)
                    NetworkSetNetworkIdDynamic(netid, true)
                    SetNetworkIdCanMigrate(netid, false)
                    if Action.prop.bone == nil then
                        Action.prop.bone = 60309
                    end

                    if Action.prop.coords == nil then
                        Action.prop.coords = { x = 0.0, y = 0.0, z = 0.0 }
                    end

                    if Action.prop.rotation == nil then
                        Action.prop.rotation = { x = 0.0, y = 0.0, z = 0.0 }
                    end

                    AttachEntityToEntity(modelSpawn, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), Action.prop.bone), Action.prop.coords.x, Action.prop.coords.y, Action.prop.coords.z, Action.prop.rotation.x, Action.prop.rotation.y, Action.prop.rotation.z, 1, 1, 0, 1, 0, 1)
                    prop_net = netid

                    isProp = true

                    if not isPropTwo and Action.propTwo and Action.propTwo.model then
                        loadModel(joaat(Action.propTwo.model))

                        local pCoords2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 0.0)
                        local modelSpawn2 = CreateObject(joaat(Action.propTwo.model), pCoords2.x, pCoords2.y, pCoords2.z, true, true, true)

                        local netid2 = ObjToNet(modelSpawn2)
                        SetNetworkIdExistsOnAllMachines(netid2, true)
                        NetworkSetNetworkIdDynamic(netid2, true)
                        SetNetworkIdCanMigrate(netid2, false)
                        if Action.propTwo.bone == nil then
                            Action.propTwo.bone = 60309
                        end

                        if Action.propTwo.coords == nil then
                            Action.propTwo.coords = { x = 0.0, y = 0.0, z = 0.0 }
                        end

                        if Action.propTwo.rotation == nil then
                            Action.propTwo.rotation = { x = 0.0, y = 0.0, z = 0.0 }
                        end

                        AttachEntityToEntity(modelSpawn2, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), Action.propTwo.bone), Action.propTwo.coords.x, Action.propTwo.coords.y, Action.propTwo.coords.z, Action.propTwo.rotation.x, Action.propTwo.rotation.y, Action.propTwo.rotation.z, 1, 1, 0, 1, 0, 1)
                        propTwo_net = netid2

                        isPropTwo = true
                    end
                end

                DisableActions(PlayerPedId())
            end
            Wait(0)
        end
    end)
end

local function Process(action, start, tick, finish)
	ActionStart()
    Action = action
	if Action.icon then
		if QBCore.Shared.Items[tostring(Action.icon)] then
			local img = "nui://qb-inventory/html/" -- default qb-core inventory link
			if not string.find(QBCore.Shared.Items[tostring(Action.icon)].image, "http") then -- 👀 Slipped in support for custom html links too
				if not string.find(QBCore.Shared.Items[tostring(Action.icon)].image, "images/") then --search for if the icon images have /images in the listing
					img = img.."images/"
				end
				Action.icon = img..QBCore.Shared.Items[tostring(Action.icon)].image
			end
		end
	end
    if not IsEntityDead(PlayerPedId()) or Action.useWhileDead then
        if not isDoingAction then
            isDoingAction = true
            wasCancelled = false
            isAnim = false
            isProp = false
            TriggerEvent('progressbar:setstatus', true)
            SendNUIMessage({
                action = "progress",
                duration = Action.duration,
                label = Action.label,
                icon = Action.icon
            })
            CreateThread(function ()
                if start then
                    start()
                end
                while isDoingAction do
                    Wait(1)
                    if tick then
                        tick()
                    end
                    if IsControlJustPressed(0, 177) and Action.canCancel then -- IsControlJustPressed(0, 177) BACKSPACE
                        TriggerEvent("progressbar:client:cancel")
                    end

                    if IsEntityDead(PlayerPedId()) and not Action.useWhileDead then
                        TriggerEvent("progressbar:client:cancel")
                    end
                end
                if finish then
                    finish(wasCancelled)
                end
            end)
        else
            TriggerEvent("QBCore:Notify", "You are already doing something!", "error")
        end
    else
        TriggerEvent("QBCore:Notify", "Cant do that action!", "error")
    end
end


RegisterNetEvent("progressbar:client:progress", function(action, finish)
	Process(action, nil, nil, finish)
end)

RegisterNetEvent("progressbar:client:ProgressWithStartEvent", function(action, start, finish)
	Process(action, start, nil, finish)
end)

RegisterNetEvent("progressbar:client:ProgressWithTickEvent", function(action, tick, finish)
	Process(action, nil, tick, finish)
end)

RegisterNetEvent("progressbar:client:ProgressWithStartAndTick", function(action, start, tick, finish)
	Process(action, start, tick, finish)
end)

RegisterNetEvent("progressbar:client:cancel", function()
	Cancel()
end)

RegisterNUICallback('FinishAction', function(_, cb)
	Finish()
    cb("ok")
end)


local function Progress(action, finish)
	Process(action, nil, nil, finish)
end exports("Progress", Progress)

local function ProgressWithStartEvent(action, start, finish)
	Process(action, start, nil, finish)
end exports("ProgressWithStartEvent", ProgressWithStartEvent)

local function ProgressWithTickEvent(action, tick, finish)
	Process(action, nil, tick, finish)
end exports("ProgressWithTickEvent", ProgressWithTickEvent)

local function ProgressWithStartAndTick(action, start, tick, finish)
	Process(action, start, tick, finish)
end exports("ProgressWithStartAndTick", ProgressWithStartAndTick)
