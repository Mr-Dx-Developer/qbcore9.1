fx_version 'cerulean'
game 'gta5'
version '1.0.0'
lua54 'yes'
ui_page 'web/ui.html'

files {
	'web/*.*',
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
	'ooc.lua',
}

server_scripts {
	'server.lua',
	'commands.lua',
}

