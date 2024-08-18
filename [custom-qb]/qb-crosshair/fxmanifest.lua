fx_version 'adamant'
games { 'gta5' }
author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'
ui_page 'ui/ui.html'

files {
    'ui/ui.html',
	'ui/common/**.**'
}


client_scripts {
	"config.lua",
	"client/main.lua",
}
lua54 'yes'

escrow_ignore {
    'config.lua',
}