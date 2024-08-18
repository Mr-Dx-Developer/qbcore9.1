fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'kloud'
description 'Advanced Farming Job Made for QB/Qbox/ESX by Kloud'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua'
}

client_scripts {
    'target/*.lua',
    'modules/**/*.lua',
    'inventory/client/*.lua',
    'framework/client/*.lua',
    'init.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'inventory/server/*.lua',
    'framework/server/*.lua',
    'server.lua',
}

files {
    'locales/*.json'
}

dependencies {
    'oxmysql',
    'ox_lib'
}
