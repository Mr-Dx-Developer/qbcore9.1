local QBCore = exports['qb-core']:GetCoreObject()

local pizzaseat = nil
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["PizzChair"..k] =
		exports['qb-target']:AddBoxZone("PizzChair"..k, v.coords.xyz, 0.7, 0.7, { name="PizzChair"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "jim-pizzathis:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].targetinfo["sit_down"], loc = v.coords, stand = v.stand }, },
				distance = 2.2
		})
	end
end)

RegisterNetEvent('jim-pizzathis:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz
	)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", Loc[Config.Lan].error["someone_sitting_there"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		pizzaseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if pizzaseat then SetEntityCoords(ped, pizzaseat) end
				pizzaseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.Chairs = {
	--TableSeating
	{ coords = vector4(808.11, -751.56, 26.78, 84.0), stand = vector3(808.69, -751.55, 26.78-0.5) },
	{ coords = vector4(805.96, -751.59, 26.78, 276.0), stand = vector3(805.09, -751.64, 26.78-0.5) },

	{ coords = vector4(804.17, -751.56, 26.78, 86.0), stand = vector3(805.09, -751.64, 26.78-0.5) },
	{ coords = vector4(802.06, -751.55, 26.78, 275.0), stand = vector3(801.11, -751.54, 26.78-0.5) },

	{ coords = vector4(800.18, -751.55, 26.78, 85.0), stand = vector3(801.11, -751.54, 26.78-0.5) },
	{ coords = vector4(798.03, -751.55, 26.78, 270.0), stand = vector3(797.26, -751.56, 26.78-0.5) },

	{ coords = vector4(799.07, -748.83, 26.78, 95.0), stand = vector3(799.7, -748.8, 26.78-0.5) },
	{ coords = vector4(796.92, -748.78, 26.78, 265.0), stand = vector3(796.46, -748.66, 26.78-0.5) },

	{ coords = vector4(795.08, -750.45, 26.78, 205.0), stand = vector3(795.42, -749.88, 26.78-0.5) },
	{ coords = vector4(795.14, -752.68, 26.78, 355.0), stand = vector3(795.34, -753.39, 26.78-0.5) },

	{ coords = vector4(799.58, -754.03, 26.78, 161.0), stand = vector3(799.53, -753.53, 26.78-0.5) },
	{ coords = vector4(799.51, -756.1, 26.78, 7.0), stand = vector3(798.94, -756.07, 26.78-0.5) },

	--CORNER NEAR ATM
	{ coords = vector4(796.55, -767.47, 26.78, 0.0), },
	{ coords = vector4(795.12, -765.91, 26.78, 270.0), },
	{ coords = vector4(795.09, -764.92, 26.78, 270.0), },
	{ coords = vector4(795.1, -763.93, 26.78, 270.0), },

	--BOOTHS
	{ coords = vector4(808.50, -755.42, 26.78, 90.0), stand = vector3(808.29, -753.46, 26.78-0.5) },
	{ coords = vector4(808.50, -754.42, 26.78, 90.0), stand = vector3(808.29, -753.46, 26.78-0.5) },
	{ coords = vector4(806.96, -755.42, 26.78, 270.0), stand = vector3(807.06, -753.62, 26.78-0.5) },
	{ coords = vector4(806.96, -754.42, 26.78, 270.0), stand = vector3(807.06, -753.62, 26.78-0.5) },

	{ coords = vector4(806.36, -755.42, 26.78, 90.0), stand = vector3(806.31, -753.61, 26.78-0.5) },
	{ coords = vector4(806.36, -754.42, 26.78, 90.0), stand = vector3(806.31, -753.61, 26.78-0.5) },
	{ coords = vector4(804.85, -755.42, 26.78, 270.0), stand = vector3(804.93, -753.63, 26.78-0.5) },
	{ coords = vector4(804.85, -754.42, 26.78, 270.0), stand = vector3(804.93, -753.63, 26.78-0.5) },

	{ coords = vector4(804.25, -755.42, 26.78, 90.0), stand = vector3(804.14, -753.59, 26.78-0.5) },
	{ coords = vector4(804.25, -754.42, 26.78, 90.0), stand = vector3(804.14, -753.59, 26.78-0.5) },
	{ coords = vector4(802.74, -755.42, 26.78, 270.0), stand = vector3(802.9, -753.61, 26.78-0.5) },
	{ coords = vector4(802.74, -754.42, 26.78, 270.0), stand = vector3(802.9, -753.61, 26.78-0.5) },

	{ coords = vector4(802.14, -755.42, 26.78, 90.0), stand = vector3(802.11, -753.59, 26.78-0.5) },
	{ coords = vector4(802.14, -754.42, 26.78, 90.0), stand = vector3(802.11, -753.59, 26.78-0.5) },
	{ coords = vector4(800.63, -755.42, 26.78, 270.0), stand = vector3(800.74, -753.63, 26.78-0.5) },
	{ coords = vector4(800.63, -754.42, 26.78, 270.0), stand = vector3(800.74, -753.63, 26.78-0.5) },

	{ coords = vector4(799.70, -756.86, 26.78, 180.0), stand = vector3(798.24, -757.15, 26.78-0.5) },
	{ coords = vector4(799.08, -756.86, 26.78, 180.0), stand = vector3(798.24, -757.15, 26.78-0.5) },
	{ coords = vector4(799.70, -758.37, 26.78, 0.0), stand = vector3(798.36, -758.28, 26.78-0.5) },
	{ coords = vector4(799.08, -758.37, 26.78, 0.0), stand = vector3(798.36, -758.28, 26.78-0.5) },

	{ coords = vector4(799.70, -758.97, 26.78, 180.0), stand = vector3(798.32, -759.04, 26.78-0.5) },
	{ coords = vector4(799.08, -758.97, 26.78, 180.0), stand = vector3(798.32, -759.04, 26.78-0.5) },
	{ coords = vector4(799.70, -760.48, 26.78, 0.0), stand = vector3(798.36, -760.38, 26.78-0.5) },
	{ coords = vector4(799.08, -760.48, 26.78, 0.0), stand = vector3(798.36, -760.38, 26.78-0.5) },
	--OUTSIDE
	{ coords = vector4(796.57, -747.15, 26.78, 275.0), stand = vector3(796.12, -747.16, 26.78-0.5) },
	{ coords = vector4(799.28, -747.16, 26.78, 85.0), stand = vector3(799.78, -747.05, 26.78-0.5) },

	{ coords = vector4(796.74, -741.29, 26.78, 265.0), stand = vector3(796.33, -741.25, 26.78-0.5) },
	{ coords = vector4(799.63, -741.27, 26.78, 111.0), stand = vector3(800.3, -741.5, 26.78-0.5) },

	{ coords = vector4(803.11, -741.31, 26.78, 265.0), stand = vector3(802.65, -741.44, 26.78-0.5) },
	{ coords = vector4(805.97, -741.26, 26.78, 111.0), stand = vector3(806.46, -741.27, 26.78-0.5) },

	{ coords = vector4(808.64, -741.27, 26.78, 265.0), stand = vector3(808.05, -741.27, 26.78-0.5) },
	{ coords = vector4(811.52, -741.3, 26.78, 101.0), stand = vector3(811.95, -741.23, 26.78-0.5) },

	{ coords = vector4(809.6, -747.17, 26.78, 285.0), stand = vector3(809.14, -747.22, 26.78-0.5) },
	{ coords = vector4(812.41, -747.16, 26.78, 91.0), stand = vector3(812.85, -747.13, 26.78-0.5) },
	--Basement
	{ coords = vector4(809.75, -759.73, 22.3, 352.0), },
	{ coords = vector4(808.58, -758.5, 22.3, 270.0), },
	{ coords = vector4(809.78, -757.21, 22.3, 170.0), },

	--UPSTAIRS
	--Office
	{ coords = vector4(796.19, -767.65, 31.27, 357.0), },
	{ coords = vector4(795.36, -763.7, 31.27, 180.0), },
	{ coords = vector4(796.11, -763.7, 31.27, 180.0), },
	{ coords = vector4(796.85, -763.68, 31.27, 180.0), },
	--Main Area
	{ coords = vector4(796.4, -762.58, 31.27, 357.0), },
	{ coords = vector4(795.38, -761.42, 31.27, 267.0), },
	{ coords = vector4(795.33, -760.45, 31.27, 267.0), },
	{ coords = vector4(795.4, -759.43, 31.27, 267.0), },

	{ coords = vector4(803.91, -758.86, 31.27, 267.0), stand = vector3(803.35, -761.66, 31.27-0.5) },
	{ coords = vector4(803.85, -759.62, 31.27, 267.0), stand = vector3(803.35, -761.66, 31.27-0.5) },
	{ coords = vector4(803.87, -760.62, 31.27, 277.0), stand = vector3(803.35, -761.66, 31.27-0.5) },
	{ coords = vector4(804.85, -761.66, 31.27, 9.0), },
	{ coords = vector4(805.72, -760.58, 31.27, 81.0), stand = vector3(806.01, -761.49, 31.27-0.5) },
	{ coords = vector4(805.69, -759.62, 31.27, 91.0), stand = vector3(806.01, -761.49, 31.27-0.5) },
	{ coords = vector4(805.71, -758.86, 31.27, 91.0), stand = vector3(806.01, -761.49, 31.27-0.5) },
	--BOSS
	{ coords = vector4(797.9, -750.40, 31.27, 180.0), stand = vector3(798.56, -750.4, 31.27-0.5) },
	{ coords = vector4(798.58, -752.73, 31.27, 20.0), stand = vector3(798.86, -753.3, 31.27-0.5) },
	{ coords = vector4(797.19, -752.72, 31.27, 340.0), stand = vector3(797.04, -753.41, 31.27-0.5) },
	{ coords = vector4(802.57, -749.27, 31.27, 160.0), },
	{ coords = vector4(803.31, -756.31, 31.27, 81.0), },
	{ coords = vector4(802.2, -757.48, 31.27, 15.0), stand = vector3(800.41, -756.39, 31.27-0.5) },
	{ coords = vector4(800.83, -757.44, 31.27, 340.0), stand = vector3(800.41, -756.39, 31.27-0.5) },
}

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
end)