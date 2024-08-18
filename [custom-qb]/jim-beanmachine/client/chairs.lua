local QBCore = exports[Config.Core]:GetCoreObject()

local beanseat = nil
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["beanmachine"..k] =
		exports['qb-target']:AddBoxZone("beanmachine"..k, vec3(v.coords.x, v.coords.y, v.coords.z-1), 0.7, 0.7, { name="beanmachine"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "jim-beanmachine:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].targetinfo["sit_down"], loc = v.coords, stand = v.stand }, },
				distance = 2.2 })
	end
end)

RegisterNetEvent('jim-beanmachine:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then triggerNotify(nil, Loc[Config.Lan].error["someone_already_sitting"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		beanseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if beanseat then SetEntityCoords(ped, beanseat) end
				beanseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.Chairs = {}
for k, v in pairs(Config.Locations) do
	if v.zoneEnable and k == "beangabzlegion" then
		--STOOLS
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(124.5, -1032.41, 29.27+0.3, 160.0), stand = vec3(124.7, -1031.93, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(122.95, -1032.34, 29.28+0.3, 205.0), stand = vec3(122.79, -1031.92, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(122.19, -1033.4, 29.28+0.3, 250.0), stand = vec3(121.61, -1033.26, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(121.76, -1034.44, 29.28+0.3, 250.0), stand = vec3(121.31, -1034.31, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(119.12, -1041.75, 29.28+0.3, 250.0), stand = vec3(118.58, -1041.51, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(118.74, -1042.75, 29.28+0.3, 235.0), stand = vec3(118.33, -1042.5, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(118.71, -1044.01, 29.28+0.3, 295.0), stand = vec3(118.27, -1044.17, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(119.9, -1044.98, 29.28+0.3, 340.0), stand = vec3(119.69, -1045.51, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(122.45, -1046.87, 29.28+0.3, 86.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(121.74, -1048.66, 29.28+0.3, 18.0), stand = vec3(121.35, -1048.28, 29.28-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(117.91, -1047.8, 29.28+0.3, 18.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(116.28, -1047.11, 29.28+0.3, 317.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(125.15, -1029.07, 29.28+0.3, 118.0), stand = vec3(125.21, -1029.64, 29.28-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(123.61, -1028.61, 29.28+0.3, 188.0), stand = vec3(123.35, -1029.11, 29.28-0.5) }

		--SEATING
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(120.67, -1027.8, 29.28, 165.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(119.02, -1028.51, 29.28, 245.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(119.15, -1031.58, 29.28, 175.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(117.74, -1032.55, 29.28, 250.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(117.39, -1033.47, 29.28, 250.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(117.04, -1034.42, 29.28, 250.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(117.66, -1035.97, 29.28, 335.0), }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(113.5, -1044.37, 28.92, 265.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(114.34, -1045.99, 28.92, 325.0), }
	end
	if v.zoneEnable and k == "beanunclejust" then
		--STOOLS
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.64, 234.67, 81.88+0.2, 92.0), stand = vec3(-633.09, 234.73, 81.88-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.75, 235.63, 81.88+0.2, 92.0), stand = vec3(-633.33, 235.65, 81.88-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-634.03, 236.75, 81.88+0.2, 182.0), stand = vec3(-633.18, 236.42, 81.88-0.5) }

		--Downstairs
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-631.62, 236.27, 81.88, 275.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-628.6, 236.73, 81.88, 95.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-626.22, 235.22, 81.88, 300.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-624.47, 234.09, 81.88, 355.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-622.67, 235.11, 81.88, 55.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-626.85, 229.71, 81.88, 0.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.7, 229.69, 81.88, 0.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-624.6, 231.15, 81.88, 90.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-618.61, 232.89, 81.88, 145.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-620.51, 230.18, 81.88, 320.0), }

		--Upstairs
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-623.7, 233.62, 86.33, 130.0), stand = vec3(-623.28, 234.17, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.21, 233.45, 86.33, 220.0), stand = vec3(-625.67, 233.94, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.64, 232.02, 86.33, 310.0), stand = vec3(-626.22, 231.48, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-626.82, 231.09, 86.33, 130.0), stand = vec3(-626.22, 231.48, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-628.39, 230.97, 86.33, 220.0), stand = vec3(-628.8, 231.53, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-628.82, 229.51, 86.33, 310.0), stand = vec3(-629.37, 229.13, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-624.59, 237.18, 86.33, 120.0), stand = vec3(-624.06, 237.63, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.31, 235.85, 86.33, 30.0), stand = vec3(-624.83, 235.34, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-626.81, 236.01, 86.33, 300.0), stand = vec3(-627.37, 235.66, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.4, 232.16, 86.33, 150.0), stand = vec3(-632.88, 231.85, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.4, 230.55, 86.33, 60.0), stand = vec3(-632.9, 230.19, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-634.76, 229.97, 86.33, 330.0), stand = vec3(-634.17, 229.69, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.4, 227.58, 86.33, 85.0), stand = vec3(-632.73, 227.6, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-634.7, 226.83, 86.33, 355.0), stand = vec3(-634.97, 226.02, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-635.75, 227.74, 86.33, 265.0), stand = vec3(-634.97, 226.02, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-635.67, 225.62, 86.33, 180.0), stand = vec3(-634.97, 226.02, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-634.9, 224.33, 86.33, 90.0), stand = vec3(-634.29, 224.31, 86.33-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-635.68, 223.1, 86.33, 0.0), stand = vec3(-634.99, 223.01, 86.33-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.07, 222.61, 86.33, 0.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-631.93, 222.61, 86.33, 0.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-630.54, 223.7, 86.33, 75.0), }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-630.29, 224.82, 86.33, 75.0), }
		--UPPER BALCONY
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-636.72, 231.8, 86.08, 4.0), stand = vec3(-635.86, 231.68, 86.07-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-636.77, 233.65, 86.06, 184.0), stand = vec3(-635.83, 233.58, 86.06-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-634.11, 237.08, 86.06, 300.0), stand = vec3(-633.6, 236.49, 86.06-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-632.86, 236.82, 86.06, 30.0), stand = vec3(-633.6, 236.49, 86.06-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-632.59, 238.04, 86.05, 120.0), stand = vec3(-633.11, 238.64, 86.06-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-633.83, 238.35, 86.06, 210.0), stand = vec3(-633.11, 238.64, 86.06-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-630.14, 240.02, 86.04, 15.0), stand = vec3(-630.85, 239.81, 86.05-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-631.28, 240.54, 86.05, 285.0), stand = vec3(-630.85, 239.81, 86.05-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-629.63, 241.17, 86.04, 105.0), stand = vec3(-629.39, 240.55, 86.05-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-627.25, 241.95, 86.04, 285.0), stand = vec3(-626.88, 241.24, 86.03-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-626.05, 241.39, 86.03, 15.0), stand = vec3(-626.88, 241.24, 86.03-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.36, 242.58, 86.01, 105.0), stand = vec3(-625.29, 241.79, 86.01-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-622.15, 242.37, 86.01, 260.0), stand = vec3(-622.11, 241.57, 86.01-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-621.37, 241.42, 86.01, 350.0), stand = vec3(-622.11, 241.57, 86.01-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-620.39, 242.2, 86.01, 80.0), stand = vec3(-620.5, 241.43, 86.01-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-624.04, 238.96, 86.01, 120.0), stand = vec3(-624.4, 239.71, 86.01-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-625.59, 238.09, 86.02, 300.0), stand = vec3(-626.01, 238.73, 86.02-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-627.76, 237.1, 86.03, 120.0), stand = vec3(-628.09, 237.79, 86.03-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-629.32, 236.25, 86.04, 300.0), stand = vec3(-629.75, 236.94, 86.03-0.5) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-627.61, 227.61, 81.88, 180.0), stand = vec3(-628.61, 227.59, 81.88-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-628.46, 226.75, 81.88, 270.0), stand = vec3(-628.61, 227.59, 81.88-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-628.45, 225.91, 81.88, 270.0), stand = vec3(-628.31, 225.18, 81.88-0.5) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(-627.53, 224.93, 81.88, 0.0), stand = vec3(-628.31, 225.18, 81.88-0.5) }
	end
	if v.zoneEnable and k == "beanrflx" then
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(279.53, -969.18, 29.42, 0.0), stand = vec3(280.63, -969.1, 29.42) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(279.51, -966.31, 29.42, 200.0) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(283.36, -971.17, 29.42, 0.0), stand = vec3(282.39, -970.87, 29.42) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(283.31, -968.57, 29.42, 180.0), stand = vec3(282.11, -968.12, 29.42) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(283.3, -967.58, 29.42, 0.0), stand = vec3(282.11, -968.12, 29.42) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(283.31, -964.97, 29.42, 180.0), stand = vec3(282.05, -965.13, 29.42) }

		Config.Chairs[#Config.Chairs+1] = { coords = vec4(287.83, -974.44, 29.42, 90.0) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(287.83, -975.25, 29.42, 90.0) }
		Config.Chairs[#Config.Chairs+1] = { coords = vec4(287.83, -976.10, 29.42, 90.0) }
	end
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k, v in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
	end
end)