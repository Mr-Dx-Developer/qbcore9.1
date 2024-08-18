Config = {}
Config.Interior = vector3(2225.2681, 2917.2683, -84.7932) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector4(-1197.17, -2890.71, 13.95, 34.6) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(2338.49, 2907.88, -84.79, 182.78) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(1971.3318, 3029.8140, 47.0239, 95.5338) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(2338.50, 2906.30, -84.55, 357.7) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not
Config.LastLocationOnly = true -- Prevents the menu to select a location from coming up, will always spawn at last location

Config.DefaultNumberOfCharacters = 4 -- Define maximum amount of default characters, Max 4 //ST4LTH
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}
