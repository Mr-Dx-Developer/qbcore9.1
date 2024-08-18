fx_version 'cerulean'
game 'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'
shared_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@qb-core/shared/locale.lua',
    'locale/en.lua',
    'locale/*.lua',
    'config.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

file 'json/shops-inventory.json'
lua54 'yes'
