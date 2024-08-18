name "Jim-VanillaUnicorn"
author "Jimathy"
version "v1.7"
description "Vanilla Unicorn Job Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 'config.lua', 'locales/*.lua',	'shared/*.lua' }
server_scripts { 'server/*.lua' }
client_scripts { '@PolyZone/client.lua','@PolyZone/BoxZone.lua','@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }