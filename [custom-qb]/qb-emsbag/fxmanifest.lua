fx_version 'cerulean'
game 'gta5'

author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

shared_scripts {
    "configs/**.lua"
}

server_script {
    "server/**.lua"
}

client_script {
    "client/**.lua"
}

escrow_ignore {
    "configs/**.lua",
    "README.lua"
}

files {
    'stream/prop_cs_shopping_bag.ydr'
}

dependencies {
    'qb-core',
    'qb-target'
}

lua54 'yes'
this_is_a_map 'yes'
