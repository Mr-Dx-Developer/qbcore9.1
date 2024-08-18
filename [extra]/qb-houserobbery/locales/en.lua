local Translations = {
    error = {
        ["missing_something"] = "You Are Missing A Required Item",
        ["not_enough_police"] = "There Not enough Police On Duty.",
        ["door_open"] = "The Door Is Already Unlocked",
        ["process_cancelled"] = "Be Careful You Don't Leave Finger Prints!",
        ["didnt_work"] = "You Failed To Pick The Lock!",
        ["emty_box"] = "You Found Nothing Of Interest When Searching",
    },
    success = {
        ["worked"] = "You Picked The Lock!",
    },
    info = {
        ["palert"] = "Attempted House Robbery",
        ["henter"] = "~g~E~w~ - To Enter House",
        ["hleave"] = "~g~E~w~ - To Leave House",
        ["aint"] = "~g~E~w~ - ",
        ["hsearch"] = "Searching Area For Items",
        ["hsempty"] = "You Have Already Searched Here",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
