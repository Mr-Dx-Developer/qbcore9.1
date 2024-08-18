local crews, crew_members = {}, {}

CreateThread(function()
	while GetResourceState(Config.MySQL) ~= "started" do
		Wait(50)
	end

	crews = mysqlQuery("SELECT * FROM crews")
	crew_members = mysqlQuery("SELECT * FROM crew_members")
end)

----------------------------------------------------------------------------
--                          AUXILIARY FUNCS                               --
----------------------------------------------------------------------------

function parseClientMember(member)
	local parsed = cloneTable(member)
	local memberServerId = getPlayerFromToken(member.token)

	if memberServerId then
		parsed["name"] = GetPlayerName(memberServerId)
		parsed["server_id"] = memberServerId
	end

	return parsed
end

function mergedCrew(crew)
	local merged = cloneTable(crew)
	merged.members = {}

	for _, member in ipairs(crew_members) do
		if member.crew_id == crew.id then
			table.insert(merged.members, parseClientMember(member))
		end
	end

	return merged
end

function mergedCrews()
	local merged = {}

	for _, crew in ipairs(crews) do
		table.insert(merged, mergedCrew(crew))
	end

	return merged
end

function getCrewById(id)
	for _, crew in ipairs(crews) do
		if crew.id == id then
			return crew
		end
	end
end

function getCrewByName(name)
	for _, crew in ipairs(crews) do
		if string.lower(crew.name) == string.lower(name) then
			return crew
		end
	end
end

function getFreeCrewId()
	local free = 1

	while getCrewById(free) do
		free = free + 1

		Wait(0)
	end

	return free
end

function isMemberHasPermission(member, permission)
	if member.rank == 0 then
		return true
	end

	local rankData = Config.MemberRanks[member.rank] or {}

	for _, perm in pairs(rankData.permissions) do
		if perm == permission then
			return true
		end
	end

	return false
end

function getPlayerCrew(player)
	local playerToken = tonumber(player) and getPlayerToken(player) or player

	for _, member in ipairs(crew_members) do
		if member.token == playerToken then
			return getCrewById(member.crew_id), member
		end
	end
end

----------------------------------------------------------------------------
--                          MAIN FUNCS                                    --
----------------------------------------------------------------------------

function createCrew(name, leaderPlayer)
	local crewId = getFreeCrewId()

	local crew = {
		id = crewId,
		name = name,
		leader = getPlayerToken(leaderPlayer),
		created_at = os.time()
	}

	table.insert(crews, crew)

	createCrewMember(crew, leaderPlayer, 0)

	mysqlQuery("INSERT INTO crews (id, `name`, leader, created_at) VALUES (?, ?, ?, ?)", {
		crew.id,
		crew.name,
		crew.leader,
		crew.created_at
	})

	TriggerClientEvent(GetCurrentResourceName() .. ':setCrewList', leaderPlayer, mergedCrews())

	return crews[#crews]
end

function deleteCrew(crew)
	for i, cr in ipairs(crews) do
		if cr.id == crew.id then
			mysqlQuery("DELETE FROM crews WHERE id = ?", {
				cr.id
			})

			table.remove(crews, i)

			break
		end
	end

	for i, member in ipairs(reverseArray(crew_members)) do
		if member.crew_id == crew.id then
			removeCrewMember(member)

			local player = getPlayerFromToken(member.token)

			if player then
				TriggerClientEvent(GetCurrentResourceName() .. ':setCrewList', player, mergedCrews())
			end
		end
	end
end

function createCrewMember(crew, player, rank)
	local createdMember = {
		crew_id = crew.id,
		token = getPlayerToken(player),
		kills = 0,
		deaths = 0,
		rank = rank or 1,
		avatar = getPlayerAvatar(player),
		name = GetPlayerName(player),
		server_id = player
	}

	for _, member in ipairs(crew_members) do
		if member.crew_id == crew.id then
			local pl = getPlayerFromToken(member.token)

			if pl then
				TriggerClientEvent(GetCurrentResourceName() .. ':memberJoined', pl, createdMember)
			end
		end
	end

	table.insert(crew_members, createdMember)

	TriggerClientEvent(GetCurrentResourceName() .. ':setCrew', player, mergedCrew(crew))

	mysqlQuery(
		"INSERT INTO crew_members (crew_id, `name`, token, avatar, kills, deaths, `rank`) VALUES (?, ?, ?, ?, ?, ?, ?)", {
			createdMember.crew_id,
			createdMember.name,
			createdMember.token,
			createdMember.avatar,
			createdMember.kills,
			createdMember.deaths,
			createdMember.rank
		})

	return crew_members[#crew_members]
end

function removeCrewMember(member)
	for i, mem in ipairs(reverseArray(crew_members)) do
		local player = getPlayerFromToken(mem.token)

		if mem.token == member.token then
			if player then
				TriggerClientEvent(GetCurrentResourceName() .. ':setCrew', player, {})
			end

			mysqlQuery("DELETE FROM crew_members WHERE token = ?", {
				mem.token
			})

			table.remove(crew_members, #crew_members - i + 1)
		elseif mem.crew_id == member.crew_id and player then
			TriggerClientEvent(GetCurrentResourceName() .. ':memberLeft', player, member)
		end
	end
end

function joinCrew(name)
	local player = source
	local playerCrew = getPlayerCrew(player)

	if not playerCrew then
		local crew = getCrewByName(name)

		if crew then
			createCrewMember(crew, player)
		else
			print("Player(" .. player .. ") tried to join a crew that doesn't exist [CREW NAME: " .. name .. "]")
		end
	else
		print("Player(" .. player .. ") tried to join another crew when had one [CREW NAME: " .. name .. "]")
	end
end

function leaveCrew()
	local player = source
	local playerCrew, playerMember = getPlayerCrew(player)

	if playerCrew then
		if playerCrew.leader == playerMember.token then
			deleteCrew(playerCrew)

			TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "success", _U("DeleteNotify"))
		else
			removeCrewMember(playerMember)

			TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "success", _U("LeaveNotify"))
		end
	else
		print("Player(" .. player .. ") tried to leave the crew even though didn't have a crew")
	end
end

function inviteCrew(target)
	local player = source
	local playerCrew, playerMember = getPlayerCrew(player)

	if playerCrew then
		if not isMemberHasPermission(playerMember, "invite") then
			TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "error", _U("DontHavePermission"))
		else
			local merged = mergedCrew(playerCrew)

			if #merged.members >= Config.MemberLimit then
				TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "error", _U("MemberLimitReached"))
			else
				local targetCrew = getPlayerCrew(target)

				if targetCrew then
					TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "error", _U("InvitedPlayerHasCrew"))
				else
					TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "success", _U("InviteSend"))
					TriggerClientEvent(GetCurrentResourceName() .. ':invite', target, playerCrew.name, playerMember.name)
				end
			end
		end
	end
end

----------------------------------------------------------------------------
--                          SERVER EVENTS                                 --
----------------------------------------------------------------------------

RegisterServerEvent(GetCurrentResourceName() .. ':getCrew', function()
	local player = source
	local playerCrew, playerMember = getPlayerCrew(player)

	if playerCrew then
		local merged = mergedCrew(playerCrew)
		local parsed = parseClientMember(playerMember)

		for _, member in ipairs(merged.members) do
			local memberServerId = getPlayerFromToken(member.token)

			if memberServerId then
				TriggerClientEvent(GetCurrentResourceName() .. ':updateMember', memberServerId, parsed)
			end
		end

		TriggerClientEvent(GetCurrentResourceName() .. ':setCrew', player, merged)
	end
end)

RegisterServerEvent(GetCurrentResourceName() .. ':getCrewList', function()
	TriggerClientEvent(GetCurrentResourceName() .. ':setCrewList', source, mergedCrews())
end)

RegisterServerEvent(GetCurrentResourceName() .. ':create', function(name)
	local player = source
	local playerCrew = getPlayerCrew(player)

	if not playerCrew then
		createCrew(name, player)

		TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "success", _U("CreateNotify", name))
	else
		print("Player(" .. player .. ") tried to create a crew while he had a crew already! [CREW NAME: " .. name .. "]")
	end
end)

RegisterServerEvent(GetCurrentResourceName() .. ':join', joinCrew)
RegisterServerEvent(GetCurrentResourceName() .. ':leave', leaveCrew)
RegisterServerEvent(GetCurrentResourceName() .. ':invite', inviteCrew)
RegisterServerEvent(GetCurrentResourceName() .. ':kickMember', function(targetToken)
	local player = source
	local playerCrew, playerMember = getPlayerCrew(player)

	if not playerCrew then
		print("Oyuncu(" .. player .. ") birini crewden atmaya calisti fakat crewi yok!")
		return
	end

	local targetCrew, targetMember = getPlayerCrew(targetToken)

	if not targetCrew then
		print("Oyuncu(" .. player .. ") kicklemeye calistigi kisinin bir crewi yok! [TARGET TOKEN: " .. targetToken .. "]")
		return
	end

	if playerCrew.id ~= targetCrew.id then
		print("Oyuncu(" .. player .. ") kicklemeye calistigi kisiyle ayni crewde degil! [TARGET TOKEN: " .. targetToken .. "]")
		return
	end

	if not isMemberHasPermission(playerMember, "kick") then
		TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "error", _U("DontHavePermission"))

		print("Oyuncu(" .. player .. ") birini kicklemeye çalıştı ama yetkisi yok. [TARGET TOKEN: " .. targetToken .. "]")

		return
	end

	removeCrewMember(targetMember)
end)

RegisterServerEvent(GetCurrentResourceName() .. ':promoteMember', function(targetToken, rankUp)
	local player = source
	local playerCrew, playerMember = getPlayerCrew(player)

	if playerCrew then
		if isMemberHasPermission(playerMember, "promote") then
			local targetCrew, targetMember = getPlayerCrew(targetToken)

			if targetCrew.id == playerCrew.id then
				local newRank = targetMember.rank + (rankUp and 1 or -1)
				local newRankData = Config.MemberRanks[newRank]

				if newRankData then
					targetMember.rank = newRank
					local parsed = parseClientMember(targetMember)

					TriggerClientEvent(GetCurrentResourceName() .. ':updateMember', player, parsed)

					mysqlQuery("UPDATE crew_members SET rank = ? WHERE token = ?", {
						newRank,
						targetMember.token
					})

					local targetPlayer = getPlayerFromToken(targetMember.token)

					if targetPlayer then
						TriggerClientEvent(GetCurrentResourceName() .. ':updateMember', targetPlayer, parsed)
					end

					TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "success",
						_U("ChangedMemberRank", targetMember.name, newRankData.name))
				else
					print("Oyuncu(" .. player
						      .. ") birinin rankını değiştirmeye çalıştı fakat böyle bir rank yok. [TARGET TOKEN: " .. targetToken
						      .. "]")
				end
			else
				print("Oyuncu(" .. player
					      .. ") rankını değiştirmeye çalıştığı kişiyle aynı ekipte değil. [TARGET TOKEN: " .. targetToken
					      .. "]")
			end
		else
			TriggerClientEvent(GetCurrentResourceName() .. ':notify', player, "error", _U("DontHavePermission"))

			print("Oyuncu(" .. player .. ") birinin rankını değiştirmeye çalıştı ama yetkisi yok. [TARGET TOKEN: "
				      .. targetToken .. "]")
		end
	else
		print("Oyuncu(" .. player .. ") birinin rankını değiştirmeye çalıştı ama ekibi yok. [TARGET TOKEN: "
			      .. targetToken .. "]")
	end
end)

----------------------------------------------------------------------------
--                           KD SYSTEM                                    --
----------------------------------------------------------------------------

RegisterServerEvent(GetCurrentResourceName() .. ':onDied', function(attacker)
	local victim = source
	local victimCrew, victimMember = getPlayerCrew(victim)
	local attackerCrew, attackerMember = getPlayerCrew(attacker)

	if attackerCrew and victimCrew and attackerCrew.id == victimCrew.id then
		return
	end

	if victimCrew then
		victimMember.deaths = victimMember.deaths + 1
	end

	if attackerCrew then
		attackerMember.kills = attackerMember.kills + 1
	end
end)

CreateThread(function()
	while true do
		for _, member in ipairs(crew_members) do
			mysqlQuery("UPDATE crew_members SET kills=?, deaths=? WHERE token = ?", {
				member.kills,
				member.deaths,
				member.token
			})
		end

		Wait(Config.SaveMinuteOfKD * 1000)
	end
end)


-- QBCore#4011 V9 -- Discord.gg/qbcoreframework