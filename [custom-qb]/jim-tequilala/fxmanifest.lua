name "Jim-Tequi-la-la"
author "Jimathy"
version "v1.6.3"
description "Tequi-la-la Job Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 'config.lua', 'locales/*.lua', 'shared/*.lua' }
server_scripts { 'server/server.lua' }
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}