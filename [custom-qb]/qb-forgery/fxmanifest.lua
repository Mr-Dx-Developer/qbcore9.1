fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

client_scripts {
	'config.lua',
	'client/*.lua',
}
server_script 'server/*.lua'
shared_scripts {
    'config.lua',
	'@ox_lib/init.lua'
}
