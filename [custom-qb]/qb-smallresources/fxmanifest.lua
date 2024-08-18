fx_version 'cerulean'
game 'gta5'

author 'TreyTrey23'
description 'discord.gg/allinrp -- Only Buy The V9 From Here'
version 'V.9.0'
ui_page 'html/index.html'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
    'config.lua'
}
server_script 'server/*.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
    'events.meta',
    'popgroups.ymt',
    'relationships.dat',
    'html/index.html',
    'html/index.js'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
