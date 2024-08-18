fx_version 'cerulean'
game 'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/*.lua',
}

client_script {
    'client/*.lua'
}

server_scripts {
	'server/*.lua',
}


lua54 'yes'