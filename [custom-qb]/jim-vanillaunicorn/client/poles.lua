local QBCore = exports[Config.Core]:GetCoreObject()

local Poles = {}
local Dancers = {}
local polelist = {}
local dancerslist = {}

CreateThread(function()
	local i = 0
	local s = 0
	for _, v in pairs(polelist) do i += 1
		Poles["UniDance"..i] =
		exports['qb-target']:AddBoxZone("UniDance"..i, vec3(v.coords.x, v.coords.y, v.coords.z-1.5), 0.6, 0.6, { name="UniDance"..i, heading = v.coords.w, debugPoly = Config.Debug, minZ = v.minZ, maxZ = v.maxZ, },
			{ options = { { event = "jim-vanillaunicorn:Dance", icon = "fas fa-chair", label = Loc[Config.Lan].info["dance"], job = v.job, loc = v.coords, pole = v.pole }, },
				distance = 1.7 })
	end
	for _, v in pairs(dancerslist) do s += 1
		Dancers["UniPvtDance"..s] =
			exports['qb-target']:AddBoxZone("UniPvtDance"..s, v.coords.xyz, 0.7, 0.7, { name="UniPvtDance"..s, heading = v.coords.w, debugPoly = Config.Debug, minZ = v.minZ, maxZ = v.maxZ, },
				{ options = { { event = "jim-vanillaunicorn:PvtDance", icon = "fas fa-chair", label = Loc[Config.Lan].info["dance"], job = v.job, loc = v.coords, }, },
					distance = 1.7 })
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Dance', function(data)
	local canDance = true
	local dancing = false
	if data.pole > 3 then data.pole = math.random(1,3) end
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		if #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz) <= 0.4 then
			triggerNotify(nil, Loc[Config.Lan].error["someone_dance"])
			canDance = false
		end
	end
	if canDance then
		loadAnimDict('mini@strip_club@pole_dance@pole_dance'..data.pole)
		local scene = NetworkCreateSynchronisedScene(vec3(data.loc.x, data.loc.y, data.loc.z), vec3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@pole_dance@pole_dance' .. data.pole, 'pd_dance_0' .. data.pole, 1.5, -4.0, 1, 1, 1148846080, 0)
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	while dancing do
		if dancing then
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 3) or
				IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) or
				IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 3) then
					dancing = false
					ClearPedTasks(PlayerPedId())
					for i = 1, 3 do unloadAnimDict("mini@strip_club@pole_dance@pole_dance"..i) end
				end
			end
		Wait(5)
		if not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance1", "pd_dance_01", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance2", "pd_dance_02", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@pole_dance@pole_dance3", "pd_dance_03", 3) then
				dancing = false
				for i = 1, 3 do unloadAnimDict("mini@strip_club@pole_dance@pole_dance"..i) end
			end
		end
	end
end)

RegisterNetEvent('jim-vanillaunicorn:PvtDance', function(data)
	local canDance = true
	local dancing = false
	for k in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		if #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz) <= 0.4 then
			triggerNotify(nil, Loc[Config.Lan].error["someone_dance"])
			canDance = false
		end
	end
	if canDance then
		local dancenumber = math.random(1,2)
		loadAnimDict('mini@strip_club@private_dance@part'..dancenumber)
		local scene = NetworkCreateSynchronisedScene(vec3(data.loc.x, data.loc.y, data.loc.z+1), vec3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@private_dance@part'..dancenumber, 'priv_dance_p'..dancenumber, 1.5, -4.0, 1, 1, 1148846080, 0)
		SetEntityHeading(PlayerPedId(), data.loc[4])
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	while dancing do
		if dancing then
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part1", "priv_dance_p1", 3) or IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part2", "priv_dance_p2", 3) or IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part3", "priv_dance_p3", 3) then
					dancing = false
					ClearPedTasks(PlayerPedId())
					for i = 1, 3 do unloadAnimDict("mini@strip_club@private_dance@part"..i) end
				end
			end
			Wait(5)
			if not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part1", "priv_dance_p1", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part2", "priv_dance_p2", 3) and
			not IsEntityPlayingAnim(PlayerPedId(), "mini@strip_club@private_dance@part3", "priv_dance_p3", 3) then
				dancing = false
				for i = 1, 3 do unloadAnimDict("mini@strip_club@private_dance@part"..i) end
			end
		end
	end
end)

for _, v in pairs(Config.Locations) do
	if v.zoneEnable then
		if v.MLO == "gabz" then
			polelist[#polelist+1] = { coords = vec4(104.76, -1294.18, 29.65, 30.0), minZ = 28.00, maxZ = 32.85, pole = 1 }
			polelist[#polelist+1] = { coords = vec4(108.83, -1289.02, 29.65, 30.0), minZ = 28.00, maxZ = 32.85, pole = 2 }
			polelist[#polelist+1] = { coords = vec4(102.22, -1289.87, 29.65, 30.0), minZ = 28.00, maxZ = 32.85, pole = 3 }
			dancerslist[#dancerslist+1] = { coords = vec4(123.37, -1294.8, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(120.0, -1296.83, 29.73-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(113.68, -1299.87, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(111.23, -1304.38, 29.69-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(114.61, -1305.55, 29.77-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(113.37, -1303.06, 29.89-1, 30.0), minZ= 28.29, maxZ= 29.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(112.83, -1283.06, 28.88-1, 270.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(117.53, -1283.03, 28.9-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(120.99, -1285.14, 28.68-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(121.97, -1286.96, 28.76-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(116.63, -1291.47, 28.68-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(115.89, -1286.76, 28.88-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
		elseif v.MLO == "van" then
			polelist[#polelist+1] = { coords = vec4(104.2, -1294.0, 28.26, 30.0), minZ = 28.06, maxZ = 32.85, pole = 1 }
			polelist[#polelist+1] = { coords = vec4(102.24, -1290.63, 28.25, 30.0), minZ = 28.00, maxZ = 32.85, pole = 2 }
			polelist[#polelist+1] = { coords = vec4(112.61, -1286.76, 27.46, 30.0), minZ = 27.30, maxZ = 31.26, pole = 3 }
			dancerslist[#dancerslist+1] = { coords = vec4(118.48, -1301.7, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(116.36, -1302.87, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(114.2, -1304.06, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(112.45, -1305.3, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(111.04, -1302.68, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(112.96, -1301.75, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
			dancerslist[#dancerslist+1] = { coords = vec4(114.86, -1300.71, 29.27-1, 30.0), minZ= 27.68-1, maxZ= 28.49 }
		elseif v.MLO == "gabzbm" then
			polelist[#polelist+1] = { coords = vec4(-1393.79, -611.91, 30.7, 30.0), minZ = 28.0, maxZ = 32.85, pole = 1 }
			polelist[#polelist+1] = { coords = vec4(-1390.84, -616.5, 30.7, 30.0), minZ = 28.0, maxZ = 32.85, pole = 2 }
			polelist[#polelist+1] = { coords = vec4(-1387.9, -621.09, 30.7, 30.0), minZ = 28.0, maxZ = 32.85, pole = 3 }
			polelist[#polelist+1] = { coords = vec4(-1391.35, -631.98, 31.3, 30.0), minZ = 28.0, maxZ = 32.85, pole = 4 }
			polelist[#polelist+1] = { coords = vec4(-1409.18, -606.51, 30.5, 30.0), minZ = 28.0, maxZ = 32.85, pole = 5 }
			polelist[#polelist+1] = { coords = vec4(-1370.03, -621.02, 30.5, 30.0), minZ = 28.0, maxZ = 32.85, pole = 6 }
			dancerslist[#dancerslist+1] = { coords = vec4(-1405.37, -612.42, 30.05, 123.68), minZ= 29.0, maxZ= 31.4 }
			dancerslist[#dancerslist+1] = { coords = vec4(-1403.72, -615.13, 30.05, 123.68), minZ = 29.0, maxZ = 31.4}
			if not Config.Strippers then
				dancerslist[#dancerslist+1] = { coords = vec4(-1407.26, -609.67, 30.05, 123.68), minZ= 29.0, maxZ= 31.4 }
				dancerslist[#dancerslist+1] = { coords = vec4(-1402.08, -618.03, 30.05, 139.09), minZ = 29.0, maxZ = 31.4}
			end
		end
	end
end

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Poles) do exports['qb-target']:RemoveZone(k) end
	for v in pairs(Dancers)  do exports['qb-target']:RemoveZone(v) end
end)