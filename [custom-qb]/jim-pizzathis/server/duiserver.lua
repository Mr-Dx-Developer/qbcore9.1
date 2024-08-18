local QBCore = exports['qb-core']:GetCoreObject()

local Size = {
	["big"] = { 1024, 1024 },
	["medium"] = { 512, 512 },
}
--This is the list that loads at server start
--it's updated in server memory as people change them
--When ClearDui is run, it sets the url to "" making it load nothing

-- Default images
-- Targets for these are in dui.lua
local duiList = {
	-- The exterior sign isn't just the logo, its the metal aswell, use this to make a new one for easy edits here: https://i.imgur.com/3GoamzI.png
	["Exterior_Sign_Maldinis_d"] = { url = "-", size = Size["medium"], texd = "sm_pizzeria_exterior_txd", },
	["maldini-logo"] = { url = "-", size = Size["medium"], texd = "sm_pizzeria_txd_01", },
	["pizzeria_dinks"] = { url = "-", size = Size["big"], texd = "sm_pizzeria_txd_02", },
	["pizzeria_menu"] = { url = "-", size = Size["big"], texd = "sm_pizzeria_txd_02", },
}

AddEventHandler('onResourceStart', function(r) if r ~= GetCurrentResourceName() then return end
	-- Tidier way of duplicating the original url at startup to make "presets"
	for k in pairs(duiList) do duiList[k].preset = duiList[k].url end
end)

RegisterServerEvent("jim-pizzathis:Server:ChangeDUI", function(data)
	-- if no url given, "reset" it back to preset
	if not data.url then
		if Config.Debug then print("^5Debug^7: ^2Preset^7: ^6"..tostring(duiList[tostring(data.tex)].preset).."^7") end
		data.url = duiList[tostring(data.tex)].preset
		data.size = duiList[tostring(data.tex)].size
	end
	-- if it has a url, update server DUI list and send to players
	duiList[tostring(data.tex)] = { url = data.url, preset = duiList[tostring(data.tex)].preset, size = data.size, texd = data.texd }
	if Config.Debug then print("^5Debug^7: ^3DUI^2 Sending new DUI to all players^7 - ^6"..data.url.."^7") end
	TriggerClientEvent("jim-pizzathis:ChangeDUI", -1, data)
end)
RegisterServerEvent("jim-pizzathis:Server:ClearDUI", function(data)
	if data.url == "-" then duiList[data.tex].url = "-" end
	-- Clear the DUI from loading
	TriggerClientEvent("jim-pizzathis:ClearDUI", -1, data)
	--duiList[tostring(data.tex)].url = ""
end)

QBCore.Functions.CreateCallback('jim-pizzathis:Server:duiList', function(source, cb) cb(duiList) end)