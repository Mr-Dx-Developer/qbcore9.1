if Config.Framework ~= 'qb-core' then return end

local framework = 'qb-core'
local state = GetResourceState(framework)

if state == 'missing' or state == "unknown" then
    -- Framework can't be used if it's missing or unknown
    return
end

local QBCore = exports['qb-core']:GetCoreObject()

-- https://github.com/qbcore-framework/dpemotes/blob/master/Server/Server.lua#L101-L141
QBCore.Commands.Add('e', 'Play an emote', {{ name="emotename", help="dance, camera, sit or any valid emote."}}, true, function(source, args)
    TriggerClientEvent('animations:client:PlayEmote', source, args)
end)

QBCore.Commands.Add('em', 'Open dpemotes menu', {}, false, function(source)
    TriggerClientEvent('animations:client:EmoteMenu', source)
end)