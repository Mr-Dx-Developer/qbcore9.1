function mysqlQuery(query, params)
	if Config.MySQL == "oxmysql" then
		return exports["oxmysql"]:query_async(query, params)
	elseif Config.MySQL == "mysql-async" then
		local p = promise.new()

		exports['mysql-async'].mysql_execute(query, params, function(result)
			p:resolve(result)
		end)

		return Citizen.Await(p)
	elseif Config.MySQL == "ghmattimysql" then
		return exports['ghmattimysql'].executeSync(query, params)
	end
end

function reverseArray(array)
	local reversed = {}

	for i = #array, 1, -1 do
		reversed[#reversed + 1] = array[i]
	end

	return reversed
end

function cloneTable(array)
	local target = {}
	local meta = getmetatable(array)

	for k, v in pairs(array) do
		if type(v) == 'table' then
			target[k] = cloneArray(v)
		else
			target[k] = v
		end
	end

	setmetatable(target, meta)

	return target
end

function getPlayerToken(player)
	for i = 0, GetNumPlayerIdentifiers(player) - 1 do
		local id = GetPlayerIdentifier(player, i)

		if string.sub(id, 1, string.len(Config.Token)) == Config.Token then
			return id
		end
	end
end

function getPlayerFromToken(token)
	for _, player in ipairs(GetPlayers()) do
		player = tonumber(player)

		if getPlayerToken(player) == token then
			return player
		end
	end
end

function getPlayerAvatar(player)
	local discord

	for i = 0, GetNumPlayerIdentifiers(player) - 1 do
		local identifier = {}

		for id in string.gmatch(GetPlayerIdentifier(player, i), "([^:]+)") do
			table.insert(identifier, id)
		end

		if identifier[1] == "discord" then
			discord = identifier[2]
		end
	end

	if discord then
		local p = promise.new()

		PerformHttpRequest("https://discordapp.com/api/users/" .. discord, function(statusCode, data)
			data = json.decode(data or "{}")

			if data.avatar then
				local animated = data.avatar:gsub(1, 2) == "a_"

				avatar = "https://cdn.discordapp.com/avatars/" .. discord .. "/" .. data.avatar .. (animated and ".gif" or ".png")
			end

			p:resolve()
		end, "GET", "", {
			Authorization = "Bot MTA5MTc3Nzc2NjQ1OTk2OTY4OA.GAC-FX.uUtpxVouYkG4uzGHl3ErgXVpvXDrg3__xfgO14"
		})

		Citizen.Await(p)
	end

	return avatar
end


-- QBCore#4011 V9 -- Discord.gg/qbcoreframework