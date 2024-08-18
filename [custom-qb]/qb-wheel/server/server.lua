RegisterNetEvent('qb-wheel:updatewheel')
AddEventHandler('qb-wheel:updatewheel', function(veh, index, offset, obj)
    TriggerClientEvent('qb-wheel:updatewheelclient', -1, veh, index, offset, obj)
end)

RegisterNetEvent('qb-wheel:setoffsetserver')
AddEventHandler('qb-wheel:setoffsetserver', function(veh, index, offset, obj)
    TriggerClientEvent('qb-wheel:setoffset', -1, veh, index, offset, obj)
end)