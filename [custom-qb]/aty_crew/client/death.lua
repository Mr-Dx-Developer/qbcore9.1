AddEventHandler('gameEventTriggered', function(eName, data)
	if eName == "CEventNetworkEntityDamage" then
		local victimDied = tonumber(data[6]) == 1 and true

		if victimDied then
			local victim = tonumber(data[1])
			local attacker = tonumber(data[2])

			if victim == PlayerPedId() and IsPedAPlayer(attacker) then
				TriggerEvent(GetCurrentResourceName() .. ':onDied')
				TriggerServerEvent(GetCurrentResourceName() .. ':onDied', GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker)))
			end
		end
	end
end)



-- QBCore#4011 V9 The Best