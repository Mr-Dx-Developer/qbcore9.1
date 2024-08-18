fx_version 'cerulean'
game 'gta5'
author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'
client_script "client/client.lua"



server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_scripts {
    'config.lua'
}
server_scripts { '@mysql-async/lib/MySQL.lua' }