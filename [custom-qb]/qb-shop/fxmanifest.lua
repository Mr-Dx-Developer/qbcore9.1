fx_version 'bodacious'
game 'gta5'

lua54 'yes'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

shared_script 'config.lua'
client_script 'client/main.lua'
server_script 'server/main.lua'

ui_page{
    'html/index.html'
}
files {
    'html/index.html',
    'html/js/*.js',
    'html/style.css',
    'html/img/*.png',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
}

escrow_ignore {
    'config.lua'
}server_scripts { '@mysql-async/lib/MySQL.lua' }