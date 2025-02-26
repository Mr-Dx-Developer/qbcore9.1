fx_version 'cerulean'
game 'gta5'

description 'qb-clothing'
version '1.2.0'

ui_page 'html/index.html'

shared_script 'config.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/script.js'
}

escrow_ignore { 
    'config.lua',
    'README.md',
  }

lua54 'yes'
