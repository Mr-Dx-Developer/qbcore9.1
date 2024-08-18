local QBCore = exports['qb-core']:GetCoreObject()

local teqseat = 0
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["TeqChair"..k] =
		exports['qb-target']:AddBoxZone("TeqChair"..k, v.coords.xyz, 0.7, 0.7, { name="TeqChair"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "jim-tequilala:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].targetinfo["sit_down"], loc = v.coords, stand = v.stand }, },
				distance = 2.2
		})
	end
end)

RegisterNetEvent('jim-tequilala:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", Loc[Config.Lan].error["someone_already_sitting"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		teqseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if teqseat then SetEntityCoords(ped, teqseat) end
				teqseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

if Config.MLO == "hass" then
	Config.Chairs = {
		{ coords = vector4(-553.05, 277.1, 82.18, 355.0) },
		{ coords = vector4(-554.0, 277.18, 82.18, 355.0) },
		{ coords = vector4(-554.99, 277.28, 82.18, 355.0) },
		{ coords = vector4(-555.9, 277.37, 82.18, 355.0) },

		{ coords = vector4(-556.34, 292.53, 82.18, 175.0) },
		{ coords = vector4(-555.44, 291.51, 82.18, 85.0) },

		{ coords = vector4(-561.71, 290.94, 85.38, 175.0) },
		{ coords = vector4(-560.86, 290.84, 85.38, 175.0) },
		{ coords = vector4(-559.86, 290.77, 85.38, 175.0) },
		{ coords = vector4(-558.93, 290.69, 85.38, 175.0) },

		{ coords = vector4(-570.92, 290.84, 79.18, 120.0) },
		{ coords = vector4(-571.18, 288.29, 79.18, 85.0) },
		{ coords = vector4(-571.27, 287.1, 79.18, 85.0) },
		{ coords = vector4(-571.72, 286.05, 79.18, 40.0) },
		{ coords = vector4(-572.75, 285.74, 79.18, 355.0) },
		{ coords = vector4(-573.95, 285.87, 79.18, 355.0) },
		{ coords = vector4(-575.63, 293.39, 79.18, 225.0) },


		{ coords = vector4(-561.44, 284.71, 85.38, 269.0) },
		{ coords = vector4(-560.55, 283.38, 85.38, 342.0) },
		{ coords = vector4(-559.49, 283.25, 85.38, 16.0) },
		{ coords = vector4(-559.55, 280.96, 85.68, 95.0) },
		{ coords = vector4(-562.72, 281.19, 85.68, 271.0) },
	}
elseif Config.MLO == "base" then
	Config.Chairs = {
		{ coords = vector4(-553.05, 277.1, 82.18, 355.0) },
		{ coords = vector4(-554.0, 277.18, 82.18, 355.0) },
		{ coords = vector4(-554.99, 277.28, 82.18, 355.0) },
		{ coords = vector4(-555.9, 277.37, 82.18, 355.0) },

		{ coords = vector4(-558.41, 292.71, 82.18, 175.0) },
		{ coords = vector4(-557.47, 292.63, 82.18, 175.0) },
		{ coords = vector4(-556.34, 292.53, 82.18, 175.0) },
		{ coords = vector4(-555.44, 291.51, 82.18, 85.0) },


		{ coords = vector4(-570.92, 287.96, 79.18, 85.0) },
		{ coords = vector4(-571.0, 287.26, 79.18, 85.0) },
		{ coords = vector4(-571.09, 286.53, 79.18, 85.0) },

		{ coords = vector4(-574.16, 285.75, 79.18, 345.0) },
		{ coords = vector4(-574.88, 285.84, 79.18, 345.0) },
		{ coords = vector4(-575.6, 285.97, 79.18, 345.0) },

		{ coords = vector4(-576.82, 287.88, 79.18, 265.0) },
		{ coords = vector4(-576.77, 288.58, 79.18, 265.0) },
		{ coords = vector4(-576.69, 289.32, 79.18, 265.0) },

		{ coords = vector4(-561.71, 290.94, 85.38, 175.0) },
		{ coords = vector4(-560.86, 290.84, 85.38, 175.0) },
		{ coords = vector4(-559.86, 290.77, 85.38, 175.0) },
		{ coords = vector4(-558.93, 290.69, 85.38, 175.0) },
	}
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
end)