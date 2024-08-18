fx_version 'cerulean'
game 'gta5'

author 'TreyTrey23'
description 'discord.gg/allinrp -- Only Buy The V9 From Here'
version 'V.9.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}
client_script 'client/main.lua'

ui_page {
    'html/ui.html'
}

files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/app.js',
    'html/images/*.png',
    'html/images/*.jpg',
    'html/cloth/*.png',
	'html/cloth/*.svg',
    'html/ammo_images/*.png',
    'html/attachment_images/*.png',
    'html/*.ttf'
}
dependecy 'qb-weapons'

escrow_ignore {
    'config.lua',
    'client/main.lua',
    'server/main.lua',
    'README.md',
}

lua54 'yes'

dependency '/assetpacks'