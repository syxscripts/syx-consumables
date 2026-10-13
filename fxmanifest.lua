fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'syx-consumables'
author 'SYX'
description 'Configurable food, drinks and alcohol for ESX + ox_inventory'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts { 'client/main.lua' }
server_scripts { 'server/main.lua' }

dependencies {
    'ox_lib',
    'ox_inventory',
    'es_extended',
    'esx_status'
}
