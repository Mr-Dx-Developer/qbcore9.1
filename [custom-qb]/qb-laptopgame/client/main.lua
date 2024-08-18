local IsHacking = false

AddEventHandler('open:minigame', function(callback)
    Callbackk = callback
    openHack()
end)

function OpenHackingGame(puzzleDuration, puzzleLength, puzzleAmount, callback)
    Callbackk = callback
    openHack(puzzleDuration, puzzleLength, puzzleAmount)
end

RegisterNUICallback('callback', function(data, cb)
    closeHack()
    Callbackk(data.success)
    cb('ok')
end)

function openHack(puzzleDuration, puzzleLength, puzzleAmount)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open",
        duration = puzzleDuration,
        length = puzzleLength,
        amount = puzzleAmount,
    })
    IsHacking = true
end

function closeHack()
    SetNuiFocus(false, false)
    IsHacking = false
end

function GetHackingStatus()
    return IsHacking
end

RegisterCommand('laptopgame', function()
    exports['qb-laptopgame']:OpenHackingGame(20, 4, 2, function(Success)
        print(Success)
        if Success then
            print("1")
        else
            print("2")
        end
    end)
end)


-- Example 

-- TIME = Time to failed
-- SQUARE = Amount of square (4 minimum)
-- AMOUNT = Amount of good answer to Success

-- exports['qb-laptopgame']:OpenHackingGame(TIME, SQUARE, AMOUNT, function(Success)
--     if Success then
--         CODE HERE IF SUCCESS
--     else
--         CODE HERE IF FAILED
--     end
-- end)