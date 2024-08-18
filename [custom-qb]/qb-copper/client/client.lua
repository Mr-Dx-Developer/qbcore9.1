local QBCore = exports['qb-core']:GetCoreObject()

local function PoliceCall()
    local chance = 75
    if GetClockHours() >= 1 and GetClockHours() <= 6 then
        chance = 50
    end
    if math.random(1, 100) <= chance then
        TriggerServerEvent('police:server:policeAlert', Lang:t("stealboxes.police_notification"))
        QBCore.Functions.Notify(Lang:t("stealboxes.police_notified"), 'error')
    end
end

local function RemoveBoxFromScene(entity)
    NetworkRegisterEntityAsNetworked(entity)
    Wait(100)
    NetworkRequestControlOfEntity(entity)
    SetEntityAsMissionEntity(entity)
    Wait(100)
    DeleteEntity(entity)
end

local function startStealingBox(entity)
    QBCore.Functions.Progressbar("stealingBox", Lang:t("stealboxes.stealing_animation_label"), Config.searchTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 49,
    }, {}, {}, function()
        if DoesEntityExist(entity) then
            local pos = GetEntityCoords(entity)
            local objectCoords = pos.x .. pos.y .. pos.z
            TriggerServerEvent("qb-copper:server:stealedbox", objectCoords)
            RemoveBoxFromScene(entity)
            QBCore.Functions.Notify(Lang:t("stealboxes.box_removed"), "primary")
            if Config.policeCall then PoliceCall() end
        end
    end, function()
        Lang:t("stealboxes.stealing_animation_canceled")
    end)
end

CreateThread(function()
    exports['qb-target']:AddTargetModel(
        Config.searchableModels, 
        {
            options = {
                {
                    targeticon = 'fa-solid fa-screwdriver-wrench', 
                    icon = "fas fa-mask",
                    type = "client",
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        TriggerEvent('qb-copper:client:steal', entity)
                    end,
                    label = Lang:t("stealboxes.target_label"),
                    ----item = Config.stealItem,
                }
            },
            distance = Config.boxDistance,
        }
    )
end)

RegisterNetEvent("qb-copper:client:steal", function(entity)
    local pos = GetEntityCoords(entity)
    local objectCoords = pos.x .. pos.y .. pos.z
	QBCore.Functions.TriggerCallback('qb-copper:server:getbox', function(occupied)
		if occupied then
            RemoveBoxFromScene(entity)
			QBCore.Functions.Notify(Lang:t("stealboxes.already_stolen_error"), 'error')
		else
            exports['ps-ui']:Circle(function(success)
                if success then
                    startStealingBox(entity)
                else
                    QBCore.Functions.Notify(Lang:t("stealboxes.messed_up_error"), 'error')
                end
            end, 5, 7) -- NumberOfCircles, MS
		end
	end, objectCoords)
end)
