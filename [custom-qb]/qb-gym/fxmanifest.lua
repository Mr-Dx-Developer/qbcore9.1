fx_version 'cerulean'
game 'gta5'
author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

version '1.0.3'


server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/server.lua'
}

client_scripts {
    'client/skills.lua',
    'client/gym.lua',
	'client/functions.lua',
    'client/gui.lua'
}

shared_script 'config.lua'

exports {
    "UpdateSkill",
    "GetCurrentSkill"
}

lua54 'yes'