Config = {}

Config.Invincible = true -- Is the ped going to be invincible?
Config.Frozen = true -- Is the ped frozen in place?
Config.Stoic = true -- Will the ped react to events around them?
Config.FadeIn = true -- Will the ped fade in and out based on the distance. (Looks a lot better.)
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)

Config.MinusOne = true -- Leave this enabled if your coordinates grabber does not -1 from the player coords.

Config.GenderNumbers = { -- No reason to touch these.
	['male'] = 4,
	['female'] = 5
}

Config.PedList = {
	-- Barber Shops
	-- {
	-- 	model = `s_f_m_fembarber`, -- Model name as a hash.
	-- 	coords = vector4(-34.42, -151.15, 57.09, 180.0), -- Hawick Ave (X, Y, Z, Heading)
	-- 	gender = 'female' -- The gender of the ped, used for the CreatePed native.
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(, 6227.61, 31.71, 50.0), -- Paleto Bay
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(1933.71, 3730.42, 32.85, 210.0), -- Sandy Shores
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(-817.19, -183.30, 37.57, 130.0), -- Mad Wayne Thunder Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(-1283.62, -1119.24, 7.00, 110.0), -- Magellan Ave
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_fembarber`,
	-- 	coords = vector4(137.61, -1709.78, 29.30, 320.0), -- Carson Ave
	-- 	gender = 'female'
	-- },

	-- -- Clothing Stores
	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(1.20, 6508.53, 31.88, 330.0), -- Paleto Bay
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_low`,
	-- 	coords = vector4(1695.00, 4817.49, 42.06, 360.0), -- Grapeseed
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_y_shop_mid`,
	-- 	coords = vector4(126.91, -224.29, 54.56, 90.0), -- Hawick Ave
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_shop_high`,
	-- 	coords = vector4(-709.06, -151.46, 37.42, 120.0), -- Portola Drive
	-- 	gender = 'female'
	-- },

	-- {
	-- 	model = `s_f_m_shop_high`,
	-- 	coords = vector4(-1448.41, -237.54, 49.81, 60.0), -- Cougar Ave
	-- 	gender = 'female'
	-- },

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(247.5, -52.22, 69.94, 327.13), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(17.26, -1107.6, 29.8, 172.14), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(-326.19, 6081.26, 31.45, 136.18), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(1698.05, 3757.44, 34.71, 137.95), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(813.64, -2155.27, 29.62, 357.56), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(-659.17, -939.25, 21.83, 88.16), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(841.12, -1028.99, 28.19, 265.66), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(-1112.68, 2697.55, 18.55, 132.43), -- WeaponShopPed
		gender = 'male'
	},

	{
		model = `mp_m_weapexp_01`,
		coords = vector4(2564.72, 298.47, 108.74, 265.7), -- WeaponShopPed
		gender = 'male'
	},	
	
	{
	model = `u_m_m_jewelsec_01`,
		coords = vector4(-932.29, -1177.19, 5.03, 127.01), -- Cookie
		gender = 'male'
	},	
	{
	model = `u_m_m_jewelsec_01`,
		coords = vector4(2741.95, 3499.25, 55.69, 157.11), -- wallmart
		gender = 'male'
	},		
	{
	model = `u_m_m_jewelsec_01`,
		coords = vector4(122.17, -1038.74, 29.28, 67.78), -- beanmachine
		gender = 'female'
	},	
}

