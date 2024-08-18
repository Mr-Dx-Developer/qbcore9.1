fx_version 'cerulean'
game 'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'
ui_page 'html/index.html'

client_scripts {
    'client/main.lua',
}

files {
    'html/index.html',
    'html/*.css',
    'html/src/*.js',
    'html/assets/*.png',
    'html/assets/*.mp3'
}

exports {
    'OpenHackingGame',
    'GetHackingStatus',
}
