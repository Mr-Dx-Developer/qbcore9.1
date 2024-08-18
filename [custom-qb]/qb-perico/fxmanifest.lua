fx_version 'cerulean'
game 'gta5'

name 'CayoTwoIslands'
author 'TayMcKenzieNZ'
description 'Spawns Cayo Perico alongside Los Santos'

-- Server build must be on the LATEST recommended server build. You should be checking for and updating this at least once a month
-- Server MUST be on gamebuild 2189 or higher for this resource to run sucessfully

this_is_a_map 'yes'

client_scripts {
    'scripts/twoislands.lua', -- Both Islands Visible At One Time

    'scripts/cayo_perico_entitysets.lua', -- Responsible for spawning in heist props in El Rubio's Mansion safe. You can use this file to change the prop that appears.

    'scripts/zones.lua', -- Displays all map zones, fixing the 'bug' of showing North Yankton, and instead, showing Cayo Perico

    'scripts/static_emitters.lua' -- Disables annoying 'cheering' SFXs from Arena Wars location near North Yankton / Cayo Perico

}