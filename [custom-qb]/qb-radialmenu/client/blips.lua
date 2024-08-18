local QBCore = exports['qb-core']:GetCoreObject()

local showTattoo = false
local showClothes = false
local showBarber = false
local showAtm = false
local showBenzin = false
local showMarket = false
local showGunShop = false
local showGarajS = false
local showCekilmisS = false
local showMekaniks = false
local showMekan = false


CreateThread(function()
    currentSettings = json.decode(GetResourceKvpString("bayqusBlips"))
    if not currentSettings then
        SetResourceKvp("bayqusBlips", json.encode({
            toggleTattoo = false,
            toggleClothes = false,
            toggleBarber = false, 
            toggleAtm = false,
            toggleMarket = false,
            -- toggleGunShop = false, 
            toggleGaraj = false,
            toggleBenzin = false,
            toggleMarket = false,
            toggleMekan = false,
        }))

        currentSettings = json.decode(GetResourceKvpString("bayqusBlips"))
    end

    for k, v in pairs(currentSettings) do
        if v then
            TriggerEvent("blips:"..k, true)
        else
            if k == "toggleTattoo" then
                for k, v in pairs(tattoShops) do
                    blipOlustur(v, 75, 1, 2, 0.5, 'Dövme Salonu', 'Dövmeciler')
                end
                showTattoo = true

            elseif k == "toggleClothes" then
                for k, v in pairs(clotheShops) do
                    blipOlustur(v, 73, 24, 2, 0.5, 'Kıyafet Dükkanı', 'Kıyafet')
                end
                showClothes = true
            

            elseif k == "toggleBarber" then
                for k, v in pairs(barberShops) do
                    blipOlustur(v, 71, 73, 2, 0.5, 'Berber Dükkanı', 'Berber')
                end
                showBarber = true

            elseif k == "toggleAtm" then
                for k, v in pairs(barberShops) do
                    blipOlustur(v, 71, 73, 2, 0.5, 'Berber Dükkanı', 'Berber')
                end
                showBarber = true

            elseif k == "toggleMarket" then
                for k, v in pairs(Market) do
                    blipOlustur(v, 59, 43, 2, 0.5, 'Market', 'Market')
                end
                showMarket = true
            elseif k == "toggleBenzin" then
                for k, v in pairs(BenzinS) do
                    blipOlustur(v, 361, 36, 2, 0.5, 'Benzin İstasyonu', 'Benzin')
                end
                showBenzin = true

            elseif k == "toggleGaraj" then
                for k, v in pairs(GarajS) do
                    blipOlustur(v, 357, 13, 4, 0.5, 'Garaj', 'Garaj')
                end
                showGarajS = true

            elseif k == "toggleCekilmis" then
                for k, v in pairs(CekilmisS) do
                    blipOlustur(v, 357, 13, 4, 0.5, 'Çekilmiş', 'Çekilmiş')
                end
                showMekan = true
            elseif k == "toggleMekan" then
                for k, v in pairs(Mekan) do
                    blipOlustur(v, 357, 13, 4, 0.5, 'mekan', 'mekan')
                end
                showCekilmisS = true
            elseif k == "toggleMekanik" then
                for k, v in pairs(Mekanik) do
                    blipOlustur(v, 357, 13, 4, 0.5, 'mekanik', 'mekanik')
                end
                showMekaniks = true
            end
        end        
    end
end)

blipsTattoo = {}
blipsClothes = {}
blipsBarber = {}
blipsAtm = {}
blipsBenzin = {}
blipsMarket = {}
blipsSilahci = {}
blipsGarajS = {}
blipsCekilmisS = {}
blipsMekanik = {}
blipsMeslek = {}
blipsMekan = {}



function blipOlustur(coords, sprite, colour, disp, scale, text, which)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
	SetBlipDisplay(blip, disp)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
	if which == 'Dövmeciler' then
		table.insert(blipsTattoo, blip)
	elseif which == 'Kıyafet' then
		table.insert(blipsClothes, blip)
	elseif which == 'Berber' then
		table.insert(blipsBarber, blip)
	elseif which == 'Atm' then
        table.insert(blipsAtm, blip)
    elseif which == 'Benzin' then
		table.insert(blipsBenzin, blip)
	elseif which == 'Market' then
		table.insert(blipsMarket, blip)
    elseif which == 'Silahci' then
		table.insert(blipsSilahci, blip)
    elseif which == 'Garaj' then
		table.insert(blipsGarajS, blip)
    elseif which == 'Cekilmis' then
		table.insert(blipsCekilmisS, blip)
    elseif which == 'Meslek' then
		table.insert(blipsMeslek, blip)
    elseif which == 'Mekan' then
		table.insert(blipsMekan, blip)
	end
end




RegisterNetEvent('blips:toggleNone')
AddEventHandler('blips:toggleNone',function()
    QBCore.Functions.Notify('Ne yaptığını sanıyorsun blip geleceğini mi?', "info")
end)

RegisterNetEvent('blips:toggleGunShop')
AddEventHandler('blips:toggleGunShop',function(first)
	showGunShop = not showGunShop

    if not first then
        currentSettings.toggleGunShop = not currentSettings.toggleGunShop
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end
    if showGunShop then
        for k, v in pairs(silahcikordinat) do
            blipOlustur(v, 110, 31, 4, 0.5, 'Silah Dükkanı', 'Silahci')
        end
        QBCore.Functions.Notify('Silahçı blipleri açıldı!', "success")

        SetResourceKvp("bayqusBlips", json.encode({
            showGunShop = true,
            bank = false
        })) 

    else
        for k, v in pairs(blipsSilahci) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('Silahçı blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleTattoo')
AddEventHandler('blips:toggleTattoo',function(first)
	showTattoo = not showTattoo

    if not first then

        currentSettings.toggleTattoo = not currentSettings.toggleTattoo
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end

    if showTattoo then
        for k, v in pairs(tattoShops) do
            blipOlustur(v, 75, 1, 4, 0.5, 'Dövme Salonu', 'Dövmeciler')
        end
        QBCore.Functions.Notify('Dövmeci blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsTattoo) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('Dövmeci blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleClothes')
AddEventHandler('blips:toggleClothes',function()
	showClothes = not showClothes

    if not first then
        currentSettings.toggleClothes = not currentSettings.toggleClothes
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end

    if showClothes then
        for k, v in pairs(clotheShops) do
            blipOlustur(v, 73, 24, 4, 0.5, 'Kıyafet Dükkanı', 'Kıyafet')
        end
        QBCore.Functions.Notify('Kıyafet Dükkanı blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsClothes) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('Kıyafet Dükkanı blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleBarber')
AddEventHandler('blips:toggleBarber',function(first)
	showBarber = not showBarber

    if not first then
        currentSettings.toggleBarber = not currentSettings.toggleBarber
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end

    if showBarber then
        for k, v in pairs(barberShops) do
            blipOlustur(v, 71, 73, 4, 0.5, 'Berber Dükkanı', 'Berber')
        end
        QBCore.Functions.Notify('Berber Dükkanı blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsBarber) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('Berber Dükkanı blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleMarket')
AddEventHandler('blips:toggleMarket',function(first)
	showMarket = not showMarket

    if not first then
        currentSettings.toggleMarket = not currentSettings.toggleMarket
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end

    if showMarket then
        for k, v in pairs(Market) do
            blipOlustur(v, 59, 43, 4, 0.5, 'Market', 'Market')
        end
        QBCore.Functions.Notify('Market blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsMarket) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('Market blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleAtm')
AddEventHandler('blips:toggleAtm',function(first)
	showAtm = not showAtm

    if not first then
        currentSettings.toggleAtm = not currentSettings.toggleAtm
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end

    if showAtm then
        for k, v in pairs(ATMs) do
            blipOlustur(v, 277, 5, 4, 0.5, 'ATM', 'Atm')
        end
        QBCore.Functions.Notify('ATM blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsAtm) do
            RemoveBlip(v)
        end
        QBCore.Functions.Notify('ATM blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleBenzin')
AddEventHandler('blips:toggleBenzin',function(first)
	showBenzin = not showBenzin
    if not first then
        currentSettings.toggleBenzin = not currentSettings.toggleBenzin
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end
   
    if showBenzin then
        for k, v in pairs(BenzinS) do
            blipOlustur(v, 361, 36, 4, 0.5, 'Benzin İstasyonu', 'Benzin')
        end
        QBCore.Functions.Notify('Benzin İstasyonu blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsBenzin) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Benzin İstasyonu blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleGaraj')
AddEventHandler('blips:toggleGaraj',function(first)
	showGarajS = not showGarajS

    if not first then
        currentSettings.toggleGaraj = not currentSettings.toggleGaraj
        SetResourceKvp("bayqusBlips", json.encode(currentSettings)) 
    end

    if showGarajS then
        for k, v in pairs(GarajS) do
            blipOlustur(v, 357, 13, 2, 0.5, 'Garaj', 'Garaj')
        end
        QBCore.Functions.Notify('Garaj blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsGarajS) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Garaj blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:toggleCekilmis')
AddEventHandler('blips:toggleCekilmis',function(first)
	showCekilmisS = not showCekilmisS

    if not first then
        currentSettings.toggleCekilmis = not currentSettings.toggleCekilmis
        SetResourceKvp("bayqusBlips", json.encode(currentSettings)) 
    end

    if showCekilmisS then
        for k, v in pairs(CekilmisS) do
            blipOlustur(v, 357, 2, 2, 0.5, 'Çekilmiş', 'Çekilmiş')
        end
        QBCore.Functions.Notify('Çekilmiş blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsCekilmisS) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Çekilmiş blipleri kapatıldı!', "error")
    end
end)

RegisterNetEvent('blips:mekanikCekilmis')
AddEventHandler('blips:mekanikCekilmis',function(first)
	showMekaniks = not showMekaniks

    if not first then
        currentSettings.toglleMekanik = not currentSettings.toglleMekanik
        SetResourceKvp("bayqusBlips", json.encode(currentSettings)) 
    end

    if showMekaniks then
        for k, v in pairs(Mekanik) do
            blipOlustur(v.coords, v.sprite, v.color, v.disp, v.scale, v.label, 'Mekanik')
        end
        QBCore.Functions.Notify('Mekanik blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsMekanik) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Mekanik blipleri kapatıldı!', "error")
    end
end)

local showMeslek = false
RegisterNetEvent('blips:toggleMeslek')
AddEventHandler('blips:toggleMeslek',function(first)
	showMeslek = not showMeslek
    if not first then
        currentSettings.toggleMeslek = not currentSettings.toggleMeslek
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end
   
    if showMeslek then
        for k, v in pairs(Meslek) do
            blipOlustur(v.coords, v.sprite, v.color, v.disp, v.scale, v.label, 'Meslek')
        end
        QBCore.Functions.Notify('Meslek blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsMeslek) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Meslek blipleri kapatıldı!', "error")
    end
end)

local showMekan = false
RegisterNetEvent('blips:toggleMekan')
AddEventHandler('blips:toggleMekan',function(first)
	showMekan = not showMekan
    if not first then
        currentSettings.toggleMekan = not currentSettings.toggleMekan
        SetResourceKvp("bayqusBlips", json.encode(currentSettings))
    end
   
    if showMekan then
        for k, v in pairs(Mekan) do
            blipOlustur(v.coords, v.sprite, v.color, v.disp, v.scale, v.label, 'Mekan')
        end
        QBCore.Functions.Notify('Mekan blipleri açıldı!', "success")
    else
        for k, v in pairs(blipsMekan) do
            RemoveBlip(v)
        end
		QBCore.Functions.Notify('Mekan blipleri kapatıldı!', "error")
    end
end)

Meslek = {

    -- {coords = vector3(926.47, -1560.25, 30.74), label = 'İnşaat Mesleği', color = 36, disp = 4, scale = 0.6, sprite = 566},

    {coords = vector3(-2170.83, 4275.59, 48.96), label = 'Plastik Toplama', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(-3040.75, 99.08, 12.35), label = 'Plastik Satış', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(-654.48, 5472.87, 52.0), label = 'Avcılık Bölgesi', color = 81, disp = 4, scale = 0.6, sprite = 141},
    {coords = vector3(-124.53476715088, 2792.041015625, 53.10774230955), label = 'Av Toptancısı', color = 81, disp = 4, scale = 0.6, sprite = 141},
    {coords = vector3(-328.42, 6081.05, 31.45), label = 'Av Malzeme Satıcısı', color = 81, disp = 4, scale = 0.6, sprite = 141},
    {coords = vector3(2960.92, 2754.06, 43.71), label = 'Maden Kazma', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(1074.94, -1988.79, 30.88), label = 'Maden Eritme', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(-432.59, 2936.84, 13.87), label = 'Maden Yıkama', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(-1656.67, 2074.85, 87.37), label = 'Altın Çıkarma', color = 81, disp = 4, scale = 0.6, sprite = 651},
    {coords = vector3(-629.86, -240.34, 38.15), label = 'Mücehver Alıcısı', color = 81, disp = 4, scale = 0.6, sprite = 651},
}

Mekan = {

    -- {coords = vector3(926.47, -1560.25, 30.74), label = 'İnşaat Mesleği', color = 36, disp = 4, scale = 0.6, sprite = 566},

    {coords = vector3(-3023.47, 37.74, 10.12), label = 'Bahama Clup', color = 81, disp = 4, scale = 0.6, sprite = 279},
    {coords = vector3(-1520.58, -1493.69, 6.24), label = 'S Beach Clup', color = 81, disp = 4, scale = 0.6, sprite = 279},
    {coords = vector3(4892.35, -4926.29, 3.36), label = 'Adaland Beach Clup', color = 81, disp = 4, scale = 0.6, sprite = 279},

}

Mekanik = {

    -- {coords = vector3(926.47, -1560.25, 30.74), label = 'İnşaat Mesleği', color = 36, disp = 4, scale = 0.6, sprite = 566},
    {coords = vector3(-211.49, -1327.46, 31.29), label = 'Boş Mekanik', color = 81, disp = 4, scale = 0.6, sprite = 402},
    {coords = vector3(535.4, -182.68, 54.31), label = 'Boş Mekanik', color = 81, disp = 4, scale = 0.6, sprite = 402},
    {coords = vector3(-341.55, -138.95, 39.81), label = 'Boş Mekanik', color = 81, disp = 4, scale = 0.6, sprite = 402},

}

CekilmisS = {
    vector3(-152.91, -1170.13, 23.14),
}

GarajS = {
    vector3(37.08, -616.99, 34.19),
    vector3(341.7, -623.33, 29.29),
    vector3(1037.65, -771.62, 58.01),
    vector3(888.47, -37.44, 78.76),
    vector3(52.41, -874.53, 30.42),
    vector3(273.43, -343.99, 44.91),
    vector3(-330.01, -780.33, 33.96),
    vector3(-1160.86, -741.41, 19.63),
    vector3(69.84, 12.6, 68.96),
    vector3(-475.31, -818.73, 30.46),
    vector3(364.37, 297.83, 103.49),
    vector3(-796.86, -2024.85, 8.88),
    vector3(-1183.1, -1511.11, 4.36),
    vector3(1137.77, 2663.54, 37.9),
    vector3(934.95, 3606.59, 32.81),
    vector3(78.34, 6418.74, 31.28),
    vector3(215.9499, -809.698, 30.731),
    vector3(-838.49, -1131.15, 6.8)
}



BenzinS = {
    vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

ATMs = {
    vector3(89.75, 2.35, 68.31),
    vector3(1167.02, -456.32, 66.79),
    vector3(-386.733, 6045.953, 31.501),
    vector3(-284.037, 6224.385, 31.187),
    vector3(-135.165, 6365.738, 31.101),
    vector3(-110.753, 6467.703, 31.784),
    vector3(-94.9690, 6455.301, 31.784),
    vector3(155.4300, 6641.991, 31.784),
    vector3(174.6720, 6637.218, 31.784),
    vector3(1703.138, 6426.783, 32.730),
    vector3(1735.114, 6411.035, 35.164),
    vector3(1702.842, 4933.593, 42.051),
    vector3(1967.333, 3744.293, 32.272),
    vector3(1821.917, 3683.483, 34.244),
    vector3(1174.532, 2705.278, 38.027),
    vector3(540.0420, 2671.007, 42.177),
    vector3(2564.399, 2585.100, 38.016),
    vector3(2558.683, 349.6010, 108.050),
    vector3(2558.051, 389.4817, 108.660),
    vector3(1077.692, -775.796, 58.218),
    vector3(1139.018, -469.886, 66.789),
    vector3(1153.884, -326.540, 69.245),
    vector3(381.2827, 323.2518, 103.270),
    vector3(285.2029, 143.5690, 104.970),
    vector3(157.7698, 233.5450, 106.450),
    vector3(-164.568, 233.5066, 94.919),
    vector3(-1827.04, 785.5159, 138.020),
    vector3(-1409.39, -99.2603, 52.473),
    vector3(-1205.35, -325.579, 37.870),
    vector3(-1215.64, -332.231, 37.881),
    vector3(-2072.41, -316.959, 13.345),
    vector3(-2975.72, 379.7737, 14.992),
    vector3(-2962.60, 482.1914, 15.762),
    vector3(-2955.70, 488.7218, 15.486),
    vector3(-3044.22, 595.2429, 7.595),
    vector3(-3144.13, 1127.415, 20.868),
    vector3(-3241.10, 996.6881, 12.500),
    vector3(-3241.11, 1009.152, 12.877),
    vector3(-1305.40, -706.240, 25.352),
    vector3(-538.225, -854.423, 29.234),
    vector3(-711.156, -818.958, 23.768),
    vector3(-717.614, -915.880, 19.268),
    vector3(-526.566, -1222.90, 18.434),
    vector3(-256.831, -719.646, 33.444),
    vector3(-203.548, -861.588, 30.205),
    vector3(112.4102, -776.162, 31.427),
    vector3(112.9290, -818.710, 31.386),
    vector3(119.9000, -883.826, 31.191),
    vector3(149.4551, -1038.95, 29.366),
    vector3(-846.304, -340.402, 38.687),
    vector3(-56.1935, -1752.53, 29.452),
    vector3(-261.692, -2012.64, 30.121),
    vector3(-273.001, -2025.60, 30.197),
    vector3(314.187, -278.621, 54.170),
    vector3(-351.534, -49.529, 49.042),
    vector3(24.589, -946.056, 29.357),
    vector3(-254.112, -692.483, 33.616),
    vector3(-1570.197, -546.651, 34.955),
    vector3(-1415.909, -211.825, 46.500),
    vector3(-1430.112, -211.014, 46.500),
    vector3(33.232, -1347.849, 29.497),
    vector3(129.216, -1292.347, 29.269),
    vector3(287.645, -1282.646, 29.659),
    vector3(289.012, -1256.545, 29.440),
    vector3(295.839, -895.640, 29.217),
    vector3(1686.753, 4815.809, 42.008),
    vector3(-302.408, -829.945, 32.417),
    vector3(300.2973, -589.219, 43.261),
    vector3(-433.14, 265.18, 83.02),
    vector3(5.134, -919.949, 29.557)
}

tattoShops = {
	vector3(1322.6, -1651.9, 52.3),
	vector3(-1153.6, -1425.6, 4.9),
	vector3(322.1, 180.4, 103.5),
	vector3(-3170.0, 1075.0, 20.8),
	vector3(1864.6, 3747.7, 33.0),
	vector3(-293.7, 6200.0, 31.4)
}

clotheShops = {
  vector3(72.254, -1399.102, 28.376),
  vector3(-703.776, -152.258, 36.415),
  vector3(-167.863, -298.969, 38.733),
  vector3(428.694, -800.106, 28.491),
  vector3(-829.413, -1073.710, 10.328),
  vector3(-1447.797, -242.461, 48.820),
  vector3(11.632, 6514.224, 30.877),
  vector3(123.646, -219.440, 53.557),
  vector3(1696.291, 4829.312, 41.063),
  vector3(618.093, 2759.629, 41.088),
  vector3(1190.550, 2713.441, 37.222),
  vector3(-1193.429, -772.262, 16.324),
  vector3(-3172.496, 1048.133, 19.863),
  vector3(-1108.441, 2708.923, 18.107)
}

barberShops = {
	vector3(-814.308, -183.823, 36.568),
	vector3(136.826, -1708.373, 28.291),
	vector3(-1282.604, -1116.757, 5.990),
	vector3(1931.513, 3729.671, 31.844),
	vector3(1212.840, -472.921, 65.208),
	vector3(-32.885, -152.319, 56.076),
	vector3(-278.077, 6228.463, 30.595)
}

Market = {
	vector3(25.73, -1347.27, 29.5),
    vector3(-48.37, -1757.93, 29.42),
    vector3(-1222.26, -906.86, 12.33),
    vector3(-1487.62, -378.60, 40.16),
    vector3(-707.31, -914.66, 19.22),
    vector3(1135.7, -982.79, 46.42),
    vector3(373.55, 325.52, 103.57),
    vector3(1163.67, -323.92, 69.21),
    vector3(2557.44, 382.03, 108.62),
    vector3(-3039.16, 585.71, 7.91),
    vector3(-3242.11, 1001.20, 12.83),
    vector3(-2967.78, 391.49, 15.04),
    vector3(-1820.38, 792.69, 138.11),
    vector3(547.75, 2671.53, 42.16),
    vector3(1165.36, 2709.45, 38.16),
    vector3(2678.82, 3280.36, 55.24),
    vector3(1961.17, 3740.5, 32.34),
    vector3(1393.13, 3605.2, 34.98),
    vector3(1697.92, 4924.46, 42.06),
    vector3(1728.78, 6414.41, 35.04),
}

silahcikordinat = {
    -- vector3(21.92, -1106.92, 29.8),
    -- vector3(252.14, -50, 69.94),
    -- vector3(-662.3, -935.39, 21.83),
    -- -- vector3(1693.7, 3759.71, 34.71),
    -- -- vector3(-330.3, 6083.65, 31.45),
    -- -- vector3(810.0469, -2157.77, 29.618),
    -- vector3(-1305.6, -394.45, 36.6957),
    -- vector3(2567.69, 294.007, 108.734),
    -- vector3(-3172.2, 1088.16, 20.8387),
    -- vector3(-1117.8, 2699.08, 18.5489),
}
