local QBCore = exports[Config.Core]:GetCoreObject()

local vseat = 0
local Chairs = {}
local chairlist = {}


for _, v in pairs(Config.Locations) do
	if v.zoneEnable then
		if v.MLO == "gabz" then
			--BAR STOOLS
			chairlist[#chairlist+1] = { coords = vec4(126.39, -1282.71, 29.27+0.2, 300.0), stand = vec3(126.17, -1282.86, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(127.23, -1284.14, 29.27+0.2, 300.0), stand = vec3(126.99, -1284.28, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(127.89, -1285.33, 29.27+0.2, 300.0), stand = vec3(127.69, -1285.48, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(128.57, -1286.48, 29.27+0.2, 300.0), stand = vec3(128.34, -1286.61, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(129.75, -1287.62, 29.27+0.2, 300.0), stand = vec3(129.01, -1287.77, 29.27-0.5) }
			--MAIN BOOTHS
			chairlist[#chairlist+1] = { coords = vec4(124.49, -1293.7, 29.27, 120.0), stand = vec3(123.71, -1294.05, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(124.99, -1294.55, 29.27, 120.0), stand = vec3(124.31, -1295.18, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(124.62, -1295.98, 29.29, 30.0), stand = vec3(124.31, -1295.18, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(123.75, -1296.48, 29.29, 30.0), stand = vec3(122.57, -1294.81, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(122.31, -1296.08, 29.27, 300.0), stand = vec3(122.57, -1294.81, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(121.82, -1295.23, 29.27, 300.0), stand = vec3(122.57, -1294.81, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(121.09, -1295.67, 29.27, 120.0), stand = vec3(120.22, -1296.02, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(121.58, -1296.52, 29.27, 120.0), stand = vec3(120.22, -1296.02, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(121.24, -1297.95, 29.27, 30.0), stand = vec3(120.22, -1296.02, 29.27-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(120.36, -1298.45, 29.27, 30.0), stand = vec3(120.09, -1297.49, 29.35-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(118.92, -1298.05, 29.27, 300.0), stand = vec3(119.58, -1297.78, 29.24-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(118.44, -1297.21, 29.27, 300.0), stand = vec3(119.58, -1297.78, 29.24-0.5) }
			--DANCEFLOOR
			chairlist[#chairlist+1] = { coords = vec4(123.42, -1289.31, 28.26, 30.0), stand = vec3(123.08, -1288.69, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(124.23, -1288.5, 28.26, 75.0), stand = vec3(123.6, -1288.34, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(123.96, -1287.38, 28.26, 120.0), stand = vec3(123.6, -1288.34, 28.26-0.5)  }
			chairlist[#chairlist+1] = { coords = vec4(123.14, -1286.66, 28.26, 165.0), stand = vec3(123.02, -1287.21, 28.32-0.5) }
			-----
			chairlist[#chairlist+1] = { coords = vec4(121.72, -1286.38, 28.26, 30.0), stand = vec3(121.45, -1285.76, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(122.48, -1285.56, 28.26, 75.0), stand = vec3(121.45, -1285.76, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(122.25, -1284.46, 28.26, 120.0), stand = vec3(120.68, -1284.57, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(121.45, -1283.74, 28.26, 165.0), stand = vec3(120.68, -1284.57, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(120.36, -1283.98, 28.26, 210.0), stand = vec3(120.68, -1284.57, 28.25-0.5) }
			--------
			chairlist[#chairlist+1] = { coords = vec4(119.44, -1282.63, 28.26, 100.0), stand = vec3(118.52, -1282.74, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(119.05, -1281.76, 28.26, 130.0), stand = vec3(118.52, -1282.74, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(118.26, -1281.18, 28.26, 160.0), stand = vec3(117.6, -1281.95, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(117.33, -1281.01, 28.26, 180.0), stand = vec3(117.6, -1281.95, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(116.41, -1281.34, 28.26, 210.0), stand = vec3(117.6, -1281.95, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(115.75, -1282.07, 28.26, 240.0), stand = vec3(116.34, -1282.84, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(115.49, -1282.99, 28.26, 270.0), stand = vec3(116.34, -1282.84, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(115.73, -1283.97, 28.26, 300.0), stand = vec3(116.31, -1283.67, 28.25-0.5) }
			------
			chairlist[#chairlist+1] = { coords = vec4(111.3, -1281.78, 28.26, 229.0), stand = vec3(112.11, -1282.27, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(112.11, -1281.24, 28.26, 200.0), stand = vec3(112.7, -1281.88, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(113.06, -1281.12, 28.26, 170.0), stand = vec3(112.7, -1281.88, 28.26-0.5)  }
			chairlist[#chairlist+1] = { coords = vec4(113.98, -1281.51, 28.26, 140.0), stand = vec3(113.56, -1282.03, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(114.59, -1282.29, 28.26, 110.0), stand = vec3(113.74, -1282.6, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(114.78, -1283.21, 28.26, 90.0), stand = vec3(113.98, -1283.52, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(114.51, -1284.14, 28.26, 60.0), stand = vec3(113.98, -1283.52, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(113.87, -1284.83, 28.26, 30.0), stand = vec3(113.98, -1283.52, 28.26-0.5)  }
			---------
			chairlist[#chairlist+1] = { coords = vec4(117.52, -1285.67, 28.26, 125.0), stand = vec3(116.94, -1286.67, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(117.87, -1286.57, 28.26, 98.0), stand = vec3(116.94, -1286.67, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(117.74, -1287.52, 28.26, 70.0), stand = vec3(116.76, -1287.18, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(117.17, -1288.33, 28.26, 30.0), stand = vec3(116.76, -1287.18, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(116.3, -1288.79, 28.26, 10.0), stand = vec3(116.01, -1287.96, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(115.32, -1288.73, 28.26, 345.0), stand = vec3(116.01, -1287.96, 28.26-0.5) }
			------
			chairlist[#chairlist+1] = { coords = vec4(117.32, -1292.84, 28.31, 30.0), stand = vec3(117.04, -1291.86, 28.3-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(116.22, -1293.14, 28.36, 345.0), stand = vec3(117.04, -1291.86, 28.3-0.5)  }
			chairlist[#chairlist+1] = { coords = vec4(115.4, -1292.33, 28.26, 300.0), stand = vec3(117.04, -1291.86, 28.3-0.5)  }
			--CENTER
			chairlist[#chairlist+1] = { coords = vec4(108.2, -1293.5, 28.26, 30.0), stand = vec3(107.83, -1292.86, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(109.9, -1292.53, 28.26, 30.0), stand = vec3(109.41, -1291.82, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(111.75, -1290.85, 28.26, 70.0), stand = vec3(110.84, -1290.41, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(111.99, -1288.48, 28.26, 100.0), stand = vec3(111.1, -1288.78, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(110.72, -1286.64, 28.26, 145.0), stand = vec3(110.31, -1287.22, 28.25-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(108.48, -1286.0, 28.26, 180.0), stand = vec3(108.6, -1286.95, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(106.37, -1286.72, 28.26, 205.0), stand = vec3(106.81, -1287.48, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(104.72, -1287.6, 28.26, 210.0), stand = vec3(105.28, -1288.42, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(116.16, -1303.23, 29.29, 120.0), stand = vec3(115.29, -1304.01, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(116.38, -1304.3, 29.29, 75.0), stand = vec3(115.29, -1304.01, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(115.6, -1305.15, 29.29, 30.0), stand = vec3(115.29, -1304.01, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(113.81, -1306.22, 29.29, 30.0), stand = vec3(115.29, -1304.01, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(112.7, -1306.46, 29.29, 345.0), stand = vec3(113.11, -1305.25, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(111.86, -1305.69, 29.29, 300.0), stand = vec3(113.11, -1305.25, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(110.43, -1303.19, 29.29, 300.0), stand = vec3(113.11, -1305.25, 29.29-0.5)  }
			chairlist[#chairlist+1] = { coords = vec4(110.17, -1302.06, 29.29, 255.0), stand = vec3(110.8, -1302.24, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(110.94, -1301.22, 29.29, 210.0), stand = vec3(110.8, -1302.24, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(111.8, -1300.72, 29.29, 210.0), stand = vec3(110.8, -1302.24, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(112.66, -1300.21, 29.29, 210.0), stand = vec3(112.3, -1301.58, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(98.85, -1290.32, 29.26, 120.0), stand = vec3(98.14, -1290.61, 29.24-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(98.23, -1289.37, 29.26, 120.0), stand = vec3(97.39, -1289.85, 29.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(95.14, -1293.57, 29.26, 321.0), stand = vec3(94.65, -1292.76, 29.26-0.5) }
		elseif v.MLO == "van" then
			--BAR
			chairlist[#chairlist+1] = { coords = vec4(125.05, -1282.64, 29.28, 121.0), stand = vec3(123.73, -1282.59, 29.28-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(123.39, -1283.58, 29.29, 299.0), stand = vec3(123.73, -1282.59, 29.28-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(124.96, -1284.63, 29.29, 122.0) }
			chairlist[#chairlist+1] = { coords = vec4(125.31, -1285.84, 29.29, 75.0), stand = vec3(124.63, -1286.36, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(126.38, -1287.04, 29.28, 131.0), stand = vec3(125.27, -1287.11, 29.29-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(126.11, -1288.57, 29.29, 33.0), stand =  vec3(126.55, -1287.89, 29.29-0.5) }
			--MAIN BOOTHS
			chairlist[#chairlist+1] = { coords = vec4(124.8, -1294.34, 29.27, 120.0) }
			chairlist[#chairlist+1] = { coords = vec4(124.44, -1295.68, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(123.72, -1296.11, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(122.38, -1295.72, 29.27, 300.0) }
			chairlist[#chairlist+1] = { coords = vec4(121.55, -1296.23, 29.27, 120.0) }
			chairlist[#chairlist+1] = { coords = vec4(121.2, -1297.53, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(120.47, -1297.95, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(119.16, -1297.61, 29.27, 300.0) }
			--DOOR Guard
			chairlist[#chairlist+1] = { coords = vec4(118.0, -1296.22, 29.27, 330.0) }
			--BACk ROOM
			chairlist[#chairlist+1] = { coords = vec4(119.19, -1302.77, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(117.04, -1304.01, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(114.96, -1305.23, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(113.14, -1306.27, 29.27, 30.0) }
			chairlist[#chairlist+1] = { coords = vec4(110.54, -1301.69, 29.27, 210.0) }
			chairlist[#chairlist+1] = { coords = vec4(112.32, -1300.68, 29.27, 210.0) }
			chairlist[#chairlist+1] = { coords = vec4(114.21, -1299.59, 29.27, 210.0) }
			--DANCEFLOOR
			chairlist[#chairlist+1] = { coords = vec4(123.72, -1288.85, 28.26, 25.0) }
			chairlist[#chairlist+1] = { coords = vec4(123.07, -1286.63, 28.26, 112.0) }
			chairlist[#chairlist+1] = { coords = vec4(122.19, -1285.17, 28.27, 131.0) }
			chairlist[#chairlist+1] = { coords = vec4(121.41, -1283.82, 28.28, 130.0) }
			chairlist[#chairlist+1] = { coords = vec4(119.87, -1283.71, 28.28, 89.0) }
			chairlist[#chairlist+1] = { coords = vec4(118.43, -1281.07, 28.27, 143.0) }
			--LEFT
			chairlist[#chairlist+1] = { coords = vec4(106.48, -1297.09, 28.26, 300.0) }
			chairlist[#chairlist+1] = { coords = vec4(109.34, -1295.45, 28.26, 81.0) }
			chairlist[#chairlist+1] = { coords = vec4(110.24, -1294.89, 28.26, 297.0) }
			chairlist[#chairlist+1] = { coords = vec4(113.05, -1293.3, 28.26, 89.0) }
			--CENTER LEFT
			chairlist[#chairlist+1] = { coords = vec4(109.11, -1292.4, 28.26, 30.0), stand = vec3(109.42, -1292.83, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(110.19, -1291.79, 28.26, 30.0), stand = vec3(110.38, -1292.28, 28.26-0.5) }
			chairlist[#chairlist+1] = { coords = vec4(111.45, -1291.08, 28.26, 30.0), stand = vec3(111.73, -1291.48, 28.26-0.5) }
			--CENTER MIDDLE
			chairlist[#chairlist+1] = { coords = vec4(116.89, -1288.53, 28.26, 90.0) }
			chairlist[#chairlist+1] = { coords = vec4(116.13, -1286.46, 28.26, 112.0) }
			chairlist[#chairlist+1] = { coords = vec4(115.1, -1284.65, 28.26, 118.0) }
			chairlist[#chairlist+1] = { coords = vec4(113.83, -1282.91, 28.27, 142.0) }

			--RIGHT
			chairlist[#chairlist+1] = { coords = vec4(101.07, -1286.3, 28.26, 294.0) }
			chairlist[#chairlist+1] = { coords = vec4(103.31, -1284.89, 28.26, 208.0) }
			chairlist[#chairlist+1] = { coords = vec4(104.79, -1284.2, 28.26, 288.0) }
			chairlist[#chairlist+1] = { coords = vec4(107.15, -1282.83, 28.26, 165.0) }

			--CENTER RIGHT
			chairlist[#chairlist+1] = { coords = vec4(104.87, -1287.78, 28.26, 180.0) }
			chairlist[#chairlist+1] = { coords = vec4(106.67, -1286.69, 28.26, 211.0) }
			chairlist[#chairlist+1] = { coords = vec4(108.34, -1285.69, 28.26, 232.0) }

			chairlist[#chairlist+1] = { coords = vec4(95.14, -1293.57, 29.26, 321.0), stand = vec3(94.65, -1292.76, 29.26-0.5) }
		elseif v.MLO == "gabzbm" then
		-- Backroom --
			chairlist[#chairlist+1] = { coords = vec4(-1384.49, -634.52, 30.66, 325.17), stand = vec3(-1383.97, -633.95, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1382.48, -633.25, 30.66, 258.27), stand = vec3(-1381.8, -633.44, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1380.65, -631.97, 30.66, 56.5), stand = vec3(-1379.96, -632.56, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1378.63, -630.59, 30.66, 29.0), stand = vec3(-1378.26, -631.3, 30.32)}
		-- Bossroom
			chairlist[#chairlist+1] = { coords = vec4(-1369.79, -626.71, 30.36, 30.0), stand = vec3(-1370.44, -626.89, 30.36)}
			chairlist[#chairlist+1] = { coords = vec4(-1375.03, -625.21, 30.36, 308.24), stand = vec3(-1374.54, -624.94, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1375.51, -624.44, 30.36, 308.24), stand = vec3(-1375.06, -624.11, 30.32)}
		-- Center stools
			chairlist[#chairlist+1] = { coords = vec4(-1381.93, -623.84, 30.66, 77.32), stand = vec3(-1381.4, -623.94, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1382.18, -620.01, 30.66, 119.37), stand = vec3(-1381.67, -619.71, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1384.10, -616.75, 30.66, 133.07), stand = vec3(-1383.66, -616.49, 30.32)}
		-- Center Stools
			chairlist[#chairlist+1] = { coords = vec4(-1388.2, -610.53, 30.66, 130.0), stand = vec3(-1387.68, -610.26, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1390.35, -607.44, 30.66, 137.0), stand = vec3(-1389.96, -607.0, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1393.85, -605.82, 30.66, 180.0), stand = vec3(-1393.84, -605.28, 30.32)}
		-- Center Stools Right
			chairlist[#chairlist+1] = { coords = vec4(-1399.66, -609.6, 30.66, 260.0), stand = vec3(-1400.13, -609.48, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1399.67, -613.46, 30.66, 292.0), stand = vec3(-1400.11, -613.66, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.72, -616.75, 30.66, 309.0), stand = vec3(-1398.02, -617.07, 30.32)}
		-- Center Stools Right
			chairlist[#chairlist+1] = { coords = vec4(-1393.68, -622.95, 30.66, 305.34), stand = vec3(-1394.12, -623.27, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1391.51, -626.09, 30.66, 315.45), stand = vec3(-1391.81, -626.52, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1388.09, -627.87, 30.66, 356.33), stand = vec3(-1388.09, -628.4, 30.32)}
		-- Stip stools 1
			chairlist[#chairlist+1] = { coords = vec4(-1388.97, -623.16, 30.0, 326.44), stand = vec3(-1389.27, -623.55, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1389.86, -621.69, 30.0, 286.04), stand = vec3(-1390.44, -621.83, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1387.46, -623.54, 30.0, 21.50), stand = vec3(-1387.27, -624.07, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1386.14, -622.54, 30.0, 57.54), stand = vec3(-1385.58, -622.75, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1385.79, -621.14, 30.0, 112.21), stand = vec3(-1385.16, -620.89, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1386.72, -619.66, 30.0, 142.69), stand = vec3(-1386.38, -619.22, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1388.23, -619.34, 30.0, 192.57), stand = vec3(-1388.38, -618.74, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1389.64, -620.24, 30.0, 235.0), stand = vec3(-1390.11, -619.79, 29.72)}
		-- Strip Stools 2
			chairlist[#chairlist+1] = { coords = vec4(-1391.97, -618.45, 30.0, 327.55), stand = vec3(-1392.32, -618.88, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1390.49, -618.85, 30.0, 29.72), stand = vec3(-1390.5, -619.37, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1389.05, -617.94, 30.0, 61.09), stand = vec3(-1388.65, -618.24, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1388.72, -616.55, 30.0, 97.52), stand = vec3(-1388.16, -616.47, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1389.66, -615.07, 30.0, 146.0), stand = vec3(-1389.41, -614.66, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1391.2, -614.84, 30.0, 194.05), stand = vec3(-1391.32, -614.34, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.57, -615.65, 30.0, 236.87), stand = vec3(-1392.83, -615.33, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.93, -617.13, 30.0, 271.71), stand = vec3(-1393.38, -617.08, 29.72)}
		-- Strip Stools 3
			chairlist[#chairlist+1] = { coords = vec4(-1394.77, -614.02, 30.0, 337.0), stand = vec3(-1395.1, -614.51, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1393.57, -614.28, 30.0, 5.29), stand = vec3(-1393.53, -614.89, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.03, -613.18, 30.0, 73.0), stand = vec3(-1391.6, -613.39, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1391.76, -611.81, 30.0, 112.56), stand = vec3(-1391.24, -611.65, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.87, -610.54, 30.0, 148.18), stand = vec3(-1392.47, -610.23, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1393.92, -609.80, 30.0, 181.06), stand = vec3(-1393.92, -609.8, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1395.46, -611.15, 30.0, 228.41), stand = vec3(-1395.77, -610.66, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1395.81, -612.57, 30.0, 277.31), stand = vec3(-1396.25, -612.64, 29.72)}
		-- Outer Chairs
			chairlist[#chairlist+1] = { coords = vec4(-1384.98, -617.69, 29.75, 124.67), stand = vec3(-1385.53, -618.0, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1384.17, -618.98, 29.75, 117.79), stand = vec3(-1384.68, -619.22, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1391.45, -623.73, 29.75, 306.0), stand = vec3(-1391.31, -623.64, 29.37)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.41, -622.34, 29.75, 300.72), stand = vec3(-1392.35, -622.31, 29.28)}
			chairlist[#chairlist+1] = { coords = vec4(-1396.56, -615.81, 29.75, 307.59), stand = vec3(-1396.1, -615.48, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.04, -614.49, 29.75, 301.55), stand = vec3(-1396.55, -614.21, 29.72)}
			chairlist[#chairlist+1] = { coords = vec4(-1390.03, -610.09, 29.75, 122.87), stand = vec3(-1390.52, -610.37, 29.73)}
			chairlist[#chairlist+1] = { coords = vec4(-1389.28, -611.09, 29.75, 123.92), stand = vec3(-1389.76, -611.39, 29.72)}
		-- Bar chairs

		-- Outer Outer Chairs
			chairlist[#chairlist+1] = { coords = vec4(-1399.5, -596.15, 30.30, 289.32), stand = vec3(-1398.97, -595.99, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1398.88, -595.17, 30.30, 221.73), stand = vec3(-1398.52, -595.61, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.81, -594.46, 30.30, 212.84), stand = vec3(-1397.52, -594.95, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1396.58, -593.67, 30.30, 209.17), stand = vec3(-1396.32, -594.17, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1395.1, -592.72, 30.30, 214.02), stand = vec3(-1394.8, -593.2, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1394.2, -592.13, 30.30, 212.38), stand = vec3(-1393.92, -592.61, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1392.79, -592.22, 30.30, 126.09), stand = vec3(-1393.26, -592.53, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1382.14, -614.88, 30.30, 213.83), stand = vec3(-1381.85, -615.36, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1388.02, -605.66, 30.30, 216.46), stand = vec3(-1387.71, -606.12, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1386.53, -606.33, 30.30, 120.06), stand = vec3(-1387.03, -606.59, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1385.54, -607.89, 30.30, 124.0), stand = vec3(-1386.02, -608.19, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1385.35, -609.52, 30.30, 33.07), stand = vec3(-1385.63, -609.04, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1380.51, -615.5, 30.30, 123.21), stand = vec3(-1380.99, -615.78, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1379.64, -616.96, 30.30, 127.92), stand = vec3(-1380.1, -617.29, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1379.26, -617.83, 30.30, 108.66), stand = vec3(-1379.76, -617.98, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1379.83, -626.97, 30.30, 121.32), stand = vec3(-1380.33, -627.25, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1380.59, -628.45, 30.30, 37.14), stand = vec3(-1380.92, -627.98, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1382.39, -629.62, 30.30, 33.79), stand = vec3(-1382.69, -629.14, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1383.28, -630.19, 30.30, 35.59), stand = vec3(-1383.59, -629.72, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1384.36, -630.89, 30.30, 32.96), stand = vec3(-1385.6, -631.02, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1385.33, -631.52, 30.30, 31.19), stand = vec3(-1385.6, -631.02, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1386.72, -631.44, 30.30, 307.1), stand = vec3(-1386.26, -631.12, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1387.77, -633.73, 30.30, 31.23), stand = vec3(-1388.18, -633.30, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1388.74, -634.35, 30.30, 33.68), stand = vec3(-1389.03, -633.87, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1390.04, -635.27, 30.30, 44.85), stand = vec3(-1390.32, -634.75, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1391.96, -635.66, 30.30, 350.43), stand = vec3(-1391.85, -635.11, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1393.6, -634.71, 30.30, 312.02), stand = vec3(-1393.17, -634.35, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1394.45, -633.4, 30.30, 299.26), stand = vec3(-1393.95, -633.15, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1395.1, -632.28, 30.30, 307.31), stand = vec3(-1394.64, -631.96, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1394.81, -629.71, 30.30, 42.21), stand = vec3(-1395.17, -629.27, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1394.9, -629.69, 30.30, 33.58), stand = vec3(-1395.19, -629.21, 30.34)}
			chairlist[#chairlist+1] = { coords = vec4(-1396.16, -629.22, 30.30, 305.63), stand = vec3(-1395.69, -628.92, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1396.79, -628.25, 30.30, 303.71), stand = vec3(-1396.31, -627.95, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.26, -627.52, 30.30, 302.02), stand = vec3(-1396.78, -627.24, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.91, -626.52, 30.30, 300.6), stand = vec3(-1397.42, -626.25, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1398.39, -625.8, 30.30, 306.94), stand = vec3(-1397.93, -625.48, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1399.03, -624.81, 30.30, 306.47), stand = vec3(-1398.56, -624.49, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1400.0, -623.22, 30.30, 303.58), stand = vec3(-1399.52, -622.93, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1401.16, -621.43, 30.30, 301.69), stand = vec3(-1400.67, -621.16, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1400.64, -619.57, 30.30, 213.41), stand = vec3(-1400.35, -620.06, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1411.97, -604.98, 30.30, 303.02), stand = vec3(-1411.49, -604.7, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1411.31, -603.65, 30.30, 213.42), stand = vec3(-1411.02, -604.13, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1410.65, -603.22, 30.30, 210.17), stand = vec3(-1410.42, -603.65, 30.25)}
			chairlist[#chairlist+1] = { coords = vec4(-1409.36, -602.41, 30.30, 210.86), stand = vec3(-1409.09, -602.91, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1408.33, -601.71, 30.30, 213.42), stand = vec3(-1408.03, -602.19, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1407.24, -601.01, 30.30, 210.18), stand = vec3(-1406.98, -601.51, 30.33)}
			chairlist[#chairlist+1] = { coords = vec4(-1406.34, -600.44, 30.30, 198.88), stand = vec3(-1406.18, -600.98, 30.32)}

			-- Stripper Booths
			chairlist[#chairlist+1] = { coords = vec4(-1402.81, -619.04, 30.65, 303.84), stand = vec3(-1402.33, -618.74, 30.68)}
			chairlist[#chairlist+1] = { coords = vec4(-1403.35, -618.18, 30.65, 306.43), stand = vec3(-1402.88, -617.86, 30.69)}
			chairlist[#chairlist+1] = { coords = vec4(-1405.47, -615.61, 30.65, 309.3), stand = vec3(-1405.02, -615.27, 31.14)}
			chairlist[#chairlist+1] = { coords = vec4(-1405.18, -615.37, 30.65, 304.39), stand = vec3(-1404.7, -615.07, 30.69)}
			chairlist[#chairlist+1] = { coords = vec4(-1406.94, -612.65, 30.65, 306.13), stand = vec3(-1406.94, -612.65, 30.18)}
			chairlist[#chairlist+1] = { coords = vec4(-1406.24, -613.63, 30.65, 305.94), stand = vec3(-1405.78, -613.32, 30.68)}
			chairlist[#chairlist+1] = { coords = vec4(-1408.62, -610.06, 30.65, 312.61), stand = vec3(-1408.25, -609.83, 30.68)}
			chairlist[#chairlist+1] = { coords = vec4(-1407.99, -610.98, 30.65, 302.92), stand = vec3(-1407.51, -610.69, 30.68)}
			-- Stripper Bar
			chairlist[#chairlist+1] = { coords = vec4(-1404.48, -602.76, 30.65, 303.84), stand = vec3(-1404.81, -603.16, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1402.63, -604.28, 30.65, 336.29), stand = vec3(-1402.76, -604.82, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1400.27, -604.37, 30.65, 8.63), stand = vec3(-1400.14, -604.88, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1398.29, -603.07, 30.65, 45.77), stand = vec3(-1397.73, -603.33, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.45, -600.85, 30.65, 82.91), stand = vec3(-1396.91, -600.81, 30.32)}
			chairlist[#chairlist+1] = { coords = vec4(-1397.94, -598.7, 30.65, 117.81), stand = vec3(-1397.42, -598.4, 30.32)}

		end
	end
end


CreateThread(function()
	local i = 0
	for _, v in pairs(chairlist) do i += 1
		Chairs["VanChair"..i] =
			exports['qb-target']:AddBoxZone("VanChair"..i, vec3(v.coords.x, v.coords.y , v.coords.z-1.03), 0.6, 0.6, { name= "VanChair"..i, heading = v.coords[4], debugPoly = Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.2, },
				{ options = { { event = "jim-vanillaunicorn:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].targetinfo["sit"], loc = v.coords, stand = v.stand }, },
					distance = 2.2 })
	end
end)

RegisterNetEvent('jim-vanillaunicorn:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then triggerNotify(nil, Loc[Config.Lan].error["someone_sitting"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		vseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if vseat then SetEntityCoords(ped, vseat) end
				vseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

AddEventHandler('onResourceStop', function(r) if r == GetCurrentResourceName() then for k, v in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end end end)


