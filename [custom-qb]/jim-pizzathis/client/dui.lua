local QBCore = exports['qb-core']:GetCoreObject()

-- Dont touch these
local inZone
local Targets = {}
local txd = CreateRuntimeTxd('pizzTxd')
local dui = {}
local duiList = {}
local Size = {
	["big"] = { 1024, 1024 },
	["medium"] = { 512, 512 },
}

-- Set this the lowest job grade that can change the images.
-- Default is 4 - "Boss"
local JobGrade = { ["pizzathis"] = 4, ["police"] = 4, }

-- This list is used to set up the targets, and hold other information
-- Default images are in duiserver.lua
local PresetList = {
	{ coords = vector3(792.8, -748.3, 32.15), radius = 2.0, tex = { texd = "sm_pizzeria_exterior_txd", texn = "Exterior_Sign_Maldinis_d", size = Size["medium"], }, distance = 10.0 },
	{ coords = vector3(813.53, -752.88, 28.78), radius = 0.65, tex = { texd = "sm_pizzeria_txd_01", texn = "maldini-logo", size = Size["medium"], }, },
	{ coords = vector3(813.5, -751.04, 28.78), radius = 0.5, tex = { texd = "sm_pizzeria_txd_02", texn = "pizzeria_dinks", size = Size["medium"], }, },
	{ coords = vector3(813.96, -755.04, 28.18), radius = 0.7, tex = { texd = "sm_pizzeria_txd_02", texn = "pizzeria_menu", size = Size["medium"], }, },
}
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	local p = promise.new()
	QBCore.Functions.TriggerCallback('jim-pizzathis:Server:duiList', function(cb) p:resolve(cb) end)
	duiList = Citizen.Await(p)
	if inZone then
		for k, v in pairs(duiList) do TriggerEvent("jim-pizzathis:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
	end
end)
AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	local p = promise.new()
	QBCore.Functions.TriggerCallback('jim-pizzathis:Server:duiList', function(cb) p:resolve(cb) end)
	duiList = Citizen.Await(p)
	if inZone then
		for k, v in pairs(duiList) do TriggerEvent("jim-pizzathis:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
	end
end)
CreateThread(function()
	PizzathisDUI = PolyZone:Create({
				vector2(776.45977783203, -734.53753662109),
				vector2(815.66552734375, -733.91662597656),
				vector2(819.54748535156, -747.50708007812),
				vector2(827.40344238281, -760.18341064453),
				vector2(829.70361328125, -769.6220703125),
				vector2(830.78997802734, -775.21801757812),
				vector2(776.12048339844, -774.75408935547)},
		{ name = "PizzathisDUI", debugPoly = Config.Debug })

	--Polyzone to help update/optimze the loading
	PizzathisDUI:onPlayerInOut(function(isPointInside)
		if isPointInside then inZone = true
			-- If in polyzone, grab new list from server side, and show new DUI's
			local p = promise.new() QBCore.Functions.TriggerCallback('jim-pizzathis:Server:duiList', function(cb) p:resolve(cb) end)
			duiList = Citizen.Await(p)
			for k, v in pairs(duiList) do TriggerEvent("jim-pizzathis:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
		else inZone = false
			-- If outside polyzone, attempt to unload all DUI's to help optimization
			for k, v in pairs(duiList) do
				v.tex = k
				TriggerEvent("jim-pizzathis:ClearDUI", v)
			end
			dui = {}
			duiList = {}
		end
	end)
	for k, v in pairs(PresetList) do
		local distance = 4.0
		if v["distance"] then distance = v["distance"] end
		Targets[v["tex"].texn] =
		exports['qb-target']:AddCircleZone(v["tex"].texn, v["coords"], v["radius"], { name=v["tex"].texn, debugPoly=Config.Debug, useZ=true, },
			{ options = {
					{ type = "client", event = "jim-pizzathis:DuiSelect", icon = "fas fa-circle-check", label = Loc[Config.Lan].targetinfo["add_image"], job = JobGrade, tex = v["tex"].texn, size = v["tex"].size, texd = v["tex"].texd },
					{ type = "server", event = "jim-pizzathis:Server:ChangeDUI", icon = "fas fa-circle-minus", label = Loc[Config.Lan].targetinfo["reset_image"], job = JobGrade, tex = v["tex"].texn, texd = v["tex"].texd },
					{ type = "server", event = "jim-pizzathis:Server:ClearDUI", icon = "fas fa-circle-xmark", label = Loc[Config.Lan].targetinfo["clear_image"], job = JobGrade, tex = v["tex"].texn, texd = v["tex"].texd, url = "-" },
			}, distance = distance })
	end
end)

RegisterNetEvent("jim-pizzathis:DuiSelect", function(data)
	local image = "" if duiList[tostring(data.tex)] then
		image = "<center>- Current Image -<br>"..
				"<img src="..duiList[tostring(data.tex)].url.." width=150px><br>"..
				"Size: ["..tonumber(data.size[1])..", "..tonumber(data.size[2]).."]<br><br>"
		end
	local dialog = exports['qb-input']:ShowInput({
        header = image..Loc[Config.Lan].menu["enter_new_image"],
        submitText = Loc[Config.Lan].menu["change"],
        inputs = { { type = 'text', isRequired = true, name = 'url', text = Loc[Config.Lan].menu["html_link"] } } })
    if dialog then
        if not dialog.url then return end
		data.url = dialog.url
		--Scan the link to see if it has an image extention otherwise, stop here.
		local searchList = { "png", "jpg", "jpeg", "gif", "webp", "bmp" }
		--Scan the link for certain terms that will flag it and refuse to show it
		local banList = { "porn" } -- I dunno, let me know what links people manage to find
		local searchFound = false
		for k,v in pairs(searchList) do	if string.find(tostring(data.url), tostring(v)) then searchFound = true	end end
		for k,v in pairs(banList) do if string.find(tostring(data.url), tostring(v)) then searchFound = false print("BANNED WORD: "..v) end end
        if searchFound then TriggerServerEvent('jim-pizzathis:Server:ChangeDUI', data) end
    end
end)

RegisterNetEvent("jim-pizzathis:ChangeDUI", function(data)
	if Config.Debug then print("^5Debug^7: ^2Recieving new DUI ^7- ^6"..data.url.."^7") end
	if (dui[tostring(data.tex)] or inZone) and tostring(data.url) ~= "-" then
		TriggerEvent("jim-pizzathis:ClearDUI", data)
		--Add DUI to table
		dui[tostring(data.tex)] = CreateDui(tostring(data.url), data.size[1], data.size[2])
		local duihandle = GetDuiHandle(dui[tostring(data.tex)])
		if GetDuiHandle(dui[tostring(data.tex)]) then
			--Generate a random texture name, so it doesn't load the same one every time
			local txname = tostring(data.tex)..math.random(1000,9999)
			local tx = CreateRuntimeTextureFromDuiHandle(txd, tostring(txname), duihandle)
			AddReplaceTexture(tostring(data.texd), tostring(data.tex), "pizzTxd", tostring(txname))
		end
	end
end)

RegisterNetEvent("jim-pizzathis:ClearDUI", function(data)
	if dui[tostring(data.tex)] then
		RemoveReplaceTexture(tostring(data.texd), tostring(data.tex))
		DestroyDui(dui[tostring(data.tex)])
		dui[tostring(data.tex)] = nil
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k, v in pairs(duiList) do
		exports['qb-target']:RemoveZone(k)
		RemoveReplaceTexture(tostring(v.texd), tostring(k))
	end
end)