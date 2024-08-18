game 'gta5'
author 'Atiysu & frosty'
fx_version 'cerulean'
lua54 'yes'

shared_scripts {
	'config.lua',
	'locale.lua',
	'locales/*.lua'
}

server_scripts {
	'server/utils.lua',
	'server/main.lua'
}

client_scripts {
	'client/death.lua',
	'client/utils.lua',
	'client/main.lua'
}

ui_page 'ui/index.html'

files {
	'ui/fonts/**/*.ttf',
	'ui/assets/*.png',
	'ui/css/*.css',
	'ui/js/*.js',
	'ui/index.html'
}

escrow_ignore{
	'config.lua',
	'locale.lua',
	'locales/*.lua',
	'server/*.lua',
	'client/*.lua',
}
dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }