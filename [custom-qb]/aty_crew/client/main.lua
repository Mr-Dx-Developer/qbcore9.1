localPlayer = PlayerId()
localPlayerServerId = GetPlayerServerId(localPlayer)
local crew, crewList, closest_players = {}, {}, {}

function isCrewMember(serverId)
	if not table_is_empty(crew) then
		for _, member in ipairs(crew.members) do
			if member.server_id == serverId then
				return true
			end
		end
	end

	return false
end

function closestPlayers(dist)
	local ped = PlayerPedId()
	local peds = GetGamePool("CPed")
	local coords = GetEntityCoords(ped)
	local closest = {}

	for _, p in ipairs(peds) do
		if p ~= ped and IsPedAPlayer(p) then
			local netId = NetworkGetPlayerIndexFromPed(p)
			local serverId = GetPlayerServerId(netId)

			table.insert(closest, {
				ped = p,
				name = GetPlayerName(netId),
				server_id = serverId,
				distance = #(coords - GetEntityCoords(p)),
				is_crew_member = isCrewMember(serverId)
			})
		end
	end

	return closest
end

----------------------------------------------------------------------------
--                           CLIENT EVENTS                                --
----------------------------------------------------------------------------

RegisterNetEvent(GetCurrentResourceName() .. ":setCrew", function(data)
	crew = data
end)

RegisterNetEvent(GetCurrentResourceName() .. ":setCrewList", function(data)
	crewList = data
end)

RegisterNetEvent(GetCurrentResourceName() .. ":memberJoined", function(member)
	if not table_is_empty(crew) then
		table.insert(crew.members, member)

		SendNUIMessage({
			action = "NOTIFY",
			data = {
				type = "info",
				message = _U("PlayerJoinedCrew", member.name)
			}
		})
	end
end)

RegisterNetEvent(GetCurrentResourceName() .. ":memberLeft", function(member)
	if not table_is_empty(crew) then
		for i, mem in ipairs(crew.members) do
			if mem.token == member.token then
				SendNUIMessage({
					action = "NOTIFY",
					data = {
						type = "info",
						message = _U("PlayerLeftCrew", member.name)
					}
				})

				table.remove(crew.members, i)

				break
			end
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName() .. ":updateMember", function(member)
	if not table_is_empty(crew) then
		for i, mem in ipairs(crew.members) do
			if mem.token == member.token then
				crew.members[i] = member

				break
			end
		end
	end
end)

RegisterNetEvent(GetCurrentResourceName() .. ":invite", function(crewName, senderName)
	SendNUIMessage({
		action = "INVITED",
		data = {
			crewName = crewName,
			senderName = senderName
		}
	})

	SetNuiFocus(true, true)
end)

RegisterNetEvent(GetCurrentResourceName() .. ":notify", function(t, m)
	SendNUIMessage({
		action = "NOTIFY",
		data = {
			type = t,
			message = m
		}
	})
end)

----------------------------------------------------------------------------
--                           NUI CALLBACKS                                --
----------------------------------------------------------------------------

RegisterNUICallback('create', function(crewName)
	TriggerServerEvent(GetCurrentResourceName() .. ':create', crewName)
end)

RegisterNUICallback('join', function(crewName)
	TriggerServerEvent(GetCurrentResourceName() .. ':join', crewName)
end)

RegisterNUICallback('leave', function()
	TriggerServerEvent(GetCurrentResourceName() .. ':leave')
end)

RegisterNUICallback('invite', function(playerId)
	TriggerServerEvent(GetCurrentResourceName() .. ':invite', playerId)
end)

RegisterNUICallback('kickMember', function(memberToken)
	TriggerServerEvent(GetCurrentResourceName() .. ':kickMember', memberToken)
end)

RegisterNUICallback('promoteMember', function(data)
	TriggerServerEvent(GetCurrentResourceName() .. ':promoteMember', data.targetToken, data.rankUp)
end)

RegisterNUICallback('loaded', function(_, cb)
	cb({

		playerId = localPlayerServerId,
		locales = Locales[Config.Locale],
		memberRanks = Config.MemberRanks
	})

	CreateThread(function()
		while true do
			closest_players = closestPlayers()

			SendNUIMessage({
				action = "INIT_DATA",
				data = {
					crew = crew,
					crewList = crewList,
					closestPlayers = closest_players
				}
			})

			Wait(1000)
		end
	end)
end)

----------------------------------------------------------------------------
--                        MENU AND NAMETAGS                               --
----------------------------------------------------------------------------

local menuOpen = false

function openMenu()
	if not menuOpen then
		TriggerServerEvent(GetCurrentResourceName() .. ':getCrewList')

		SendNUIMessage({
			action = "OPEN_UI"
		})

		SetNuiFocus(true, true)

		menuOpen = true
	end
end

local nametags = {}

CreateThread(function()
	Wait(1000)

	NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(PlayerPedId(), true, true)

	TriggerServerEvent(GetCurrentResourceName() .. ':getCrew')

	RegisterCommand(Config.Command, function()
		openMenu()
	end)

	-- if Config.MenuKey then
	-- 	RegisterKeyMapping(Config.Command, 'Crew Menu', 'KEYBOARD', Config.MenuKey)
	-- end

	SetMpGamerTagsUseVehicleBehavior(true)
	SetMpGamerTagsVisibleDistance(50.0)

	while true do
		local sleep = 1000

		if not menuOpen then
			local friendlyFire = false

			for _, player in ipairs(closest_players) do
				local blip = GetBlipFromEntity(player.ped)
				local nametag = nametags[player.server_id]

				if player.is_crew_member then
					if blip == 0 then
						blip = AddBlipForEntity(player.ped)
						SetBlipDisplay(blip, 2)
						SetBlipAsFriendly(blip, 1)
						SetBlipShowCone(blip, 1)
						BeginTextCommandSetBlipName("BLIP")
						AddTextEntry('BLIP', "(" .. crew.name .. ") " .. player.name)
						EndTextCommandSetBlipName(blip)
					end

					if not nametag or not IsMpGamerTagActive(nametag.tag) or nametag.ped ~= player.ped then
						nametags[player.server_id] = {
							ped = player.ped,
							tag = CreateFakeMpGamerTag(player.ped, player.name .. "(" .. crew.name .. ") [" .. player.server_id .. "]", 0, 0,
								'', 0)
						}
					end

					tag = nametags[player.server_id].tag
					SetMpGamerTagVisibility(tag, 2, true)
					SetMpGamerTagHealthBarColour(tag, 18)
					SetMpGamerTagAlpha(tag, 2, 200)

					if IsPlayerTargettingEntity(localPlayer, player.ped) or IsPlayerFreeAimingAtEntity(localPlayer, player.ped) then
						friendlyFire = true
					end
				else
					if blip then
						RemoveBlip(blip)
					end

					if nametag then
						RemoveMpGamerTag(nametag.tag)
						nametags[player.server_id] = nil
					end
				end
			end

			if friendlyFire then
				NetworkSetFriendlyFireOption(false)
				SetCanAttackFriendly(PlayerPedId(), false, false)
			else
				NetworkSetFriendlyFireOption(true)
				SetCanAttackFriendly(PlayerPedId(), true, true)
			end

			sleep = 0
		end

		Wait(sleep)
	end
end)

RegisterNUICallback('close', function()
	menuOpen = false

	SetNuiFocus(false, false)
end)

AddEventHandler('onResourceStop', function(res)
	if res == GetCurrentResourceName() then
		for _, nametag in ipairs(nametags) do
			RemoveMpGamerTag(nametag.tag)
		end
	end
end)
