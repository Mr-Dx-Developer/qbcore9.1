fx_version 'cerulean'
game 'gta5'

description 'QB-HouseRobbery Improved'
author 'Lusty94'
version '1.2.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies { -- if not using either of these then comment out this section
    'qb-lockpick',
    'qb-skillbar'
} --

lua54 'yes'

escrow_ignore {
    'config.lua',
    'client/**.lua',
    'server/**.lua',
    'locales/**.lua',
}
