fx_version 'cerulean'
games {'gta5'}
author 'QBCore#4011'
description 'discord.gg/qbcoreframework -- Only Buy The V9 From Here'
version 'V.9.0'

files{
	'metas/**/*.meta'
}

data_file 'WEAPONCOMPONENTSINFO_FILE' 'metas/**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' 'metas/**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'metas/**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' 'metas/**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' 'metas/**/weapons.meta'

client_script 'cl_weaponNames.lua'
