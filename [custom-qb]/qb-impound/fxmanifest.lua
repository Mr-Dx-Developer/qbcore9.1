fx_version 'cerulean'
game 'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/main.lua',
}

server_scripts {
	'server/main.lua',
}

dependencies {
	'PolyZone',
	'qb-target',
}
server_scripts { '@mysql-async/lib/MySQL.lua' }