--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 


local QBCore = exports['qb-core']:GetCoreObject()

--<+>-- --<+>--  --<+>--  --<+>-- COUNTER CALLBACK --<+>-- --<+>--  --<+>--  --<+>-- 

RegisterNUICallback('CounterCallback', function(data, cb)
    SetNuiFocus(false, false)
    Callback(data.success)
    SendNUIMessage({open = false})
    cb('ok')
end)


--<+>-- --<+>--  --<+>--  --<+>--  START GAME --<+>-- --<+>--  --<+>--  --<+>-- 

local function StartGame(callback, piezas, timer)
    Callback = callback
    SendNUIMessage({
        open = true,
        piezasencontradas = piezas,
        timer = timer,
    })
    SetNuiFocus(true, true)
end



--<+>-- --<+>--  --<+>--  --<+>--  CLOSE GAME --<+>-- --<+>--  --<+>--  --<+>-- 

RegisterNUICallback('CloseGame', function(data, cb)
    SetNuiFocus(false, false)
    Callback(data.success)
    SendNUIMessage({open = false})
    cb('ok')
end)

--<+>-- --<+>--  --<+>--  --<+>--  EXPORT --<+>-- --<+>--  --<+>--  --<+>-- 

exports('StartGame', StartGame)

--<+>-- --<+>--  --<+>--  --<+>-- TEST EVENTS/COMMANDS THESE CAN BE DELETED --<!>-- --<!>-- --<!>-- --<!>--

RegisterCommand('TESTHACKam', function()
    exports['am_hackgame']:StartGame(function(success)
        if success then
            QBCore.Functions.Notify('COMPLETED')
        else
            QBCore.Functions.Notify('Failed, forgot how to hack?')
        end
    end, 9, 60) 
end)
