name "Jim-BeanMachine"
author "Jimathy"
version "1.4.4"
description "BeanMachine Job Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

server_scripts { 'server/*.lua' }
shared_scripts { 'config.lua', 'locales/*.lua', 'shared/*.lua' }
client_scripts { '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }
escrow_ignore { '*.lua', 'client/*.lua', 'server/*.lua', 'locales/*.lua', }
dependency '/assetpacks'