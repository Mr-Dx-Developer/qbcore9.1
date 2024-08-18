

AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! |  oxmysql / mysql-async
AK4Y.OpenMenuCommand = "donate" -- code to open the donate menu
AK4Y.WeaponType = "item" -- weapon or item
AK4Y.CustomPlatePriceOnBuyVehicle = 20 -- Customization price at the time of vehicle purchase
AK4Y.Phone = "qb-phone" -- gcphone or qb-phone
AK4Y.MinCharForPhoneNumber = 1 -- Minimum number of characters required for a special number
AK4Y.MinCharForPlate = 1 -- Minimum number of characters required for a custom plate
AK4Y.MaxCharForPhoneNumber = 7 -- Minimum number of characters required for a special number
AK4Y.MaxCharForPlate = 8 -- Minimum number of characters required for a custom plate
AK4Y.DefaultGarage = 'pillboxgarage' -- Garage name where the vehicle will be sent after purchase
AK4Y.WeaponType = "item" -- item or weapon
AK4Y.UseTebex = false -- Do you use tebex to sell code?

AK4Y.GiveAddKeys = true -- Automatic key issuance after changing the license plate of the vehicle
AK4Y.GiveAddKeysFunction = function(newPlate)
    TriggerEvent("vehiclekeys:client:SetOwner", newPlate)
end

AK4Y.ClientNotify = function(text, NotifType)
    QBCore.Functions.Notify(text, NotifType)
end

AK4Y.Translate = {
    title1 = "QBCore#4011",
    title2 = "V9",

    speed = "km/h",
    credit = "CR",

    customizeTitle = "Customize",
    customizeInfo = "You must have the car you want to customize.",

    thanksForPurchasing = "Thank you for your purchase!",

    buyCreditButton = "GET CREDIT",
    approveButton = "APPROVE",
    buyButtonText = "BUY",

    redeemCodeTitle1 = "COUPON",
    redeemCodeTitle2 = "CODE",
    redeemCodeDesc = "Enter your coupon code below..",
    redeemCodeBelow = "ENTER CODE",

    carDoYouNeedTitle1 = "CAR",
    carDoYouNeedTitle2 = "DO YOU NEED?",
    carButtonBelow = "YOU CAN VIEW BY CLICKING THE BUTTON BELOW",
    carAreaDesc = "CLICK THE BUTTON BELOW TO SEE THE VEHICLES.",
    carButtonText = "TOOLS",
    carButtonInfo = "See vehicles by clicking button",
    
    otherInfo = "Click for details",
    otherButton = "Others",
    otherDesc = "Click the button above to go to the customization menu.",

    moneyInfo = "Click for details",
    moneyButtonText = "Money",
    moneyDesc = "Click the button above to go to the money purchase menu.",

   gunTitle1 = "GUN",
    gunTitle2 = "DO I NEED?",
    gunInfo = "YOU CAN VIEW BY CLICKING THE BUTTON BELOW",
    gunDesc = "YOU CAN SEE WEAPONS BY CLICKING THE BUTTON BELOW.",
    gunButtonText = "Weapon",
    gunTinyInfo = "See the weapons by clicking the button.",

    vehBuyCustomPlateText = "Need custom plate? <span id='cstmPltPrice'></span>",
    customPlateText = "Enter your custom plate (6 Characters Max.)",
    privNumberText = "Enter your private number (Max 7 Characters.)<br>You will drop on game after purchasing!",
    dontHaveEnoughtCredit = "Not enough credits!",
    minimumChar = "Minimum character: ",
    MaximumChar = "Maximum character: ",
    typeNumber = "You need to type number!",
    errorDuringPurchase = "An error occurred while purchasing",
    insideVehicle = "You must be inside the vehicle to purchase this customization!",

    openSpam = "Wait a moment to reopen the menu",
    spamNotify = "Spam protection try again",
}

AK4Y.BuyCredits = {
    [1] = {
        title = "100 TL",
        image = "./images/firstBoxCash.png",
        credit = "300 CR",
        extraCredit = "+60 Bonus CR",
        link = "https://www.buy-code-link.com",
    },
    [2] = {
        title = "200 TL",
        image = "./images/secondBoxCash.png",
        credit = "500 CR",
        extraCredit = "+100 Bonus CR",
        link = "https://www.buy-code-link.com",
    },
    [3] = {
        title = "1000 TL",
        image = "./images/thirtBoxCash.png",
        credit = "2000 CR",
        extraCredit = "+500 Bonus CR",
        link = "https://ak4y.tebex.io/package/5286285",
    },
    [4] = {
        title = "500 TL",
        image = "./images/fourBoxCash.png",
        credit = "1000 CR",
        extraCredit = "+250 Bonus CR",
        link = "https://www.buy-code-link.com",
    },
}

-- Do not add new categories
-- If you want to remove a category, you can put it in the comment line
-- If you put a category in the comment line, put the products sold in that category in the comment line
-- you should not change categoryId
AK4Y.Categories = {
    { label = "TOOL", categoryId = "vehicle" },
    { label = "PLANES", categoryId = "helicopters" },
    { label = "ITEM", categoryId = "items" },
    { label = "GUN", categoryId = "weapon" },
    { label = "MONEY", categoryId = "money" },
    { label = "OTHER", categoryId = "other" },
}

AK4Y.Vehicles = {
    {
        id = 1,
        spawnName = "nissantitan17", -- Spawn code of the vehicle that will be given when the product is received
        brand = "Nissan titan",
        model = "",
        year = "2023 MODEL",
        costCredit = 2450, -- The price to be paid for the product
        topSpeed = 310, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/titan.png",
    },
    {
        id = 2,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2300, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 3,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2200, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 4,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2850, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 5,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2450, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 6,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2300, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 7,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2200, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
    {
        id = 8,
        spawnName = "zentorno", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2850, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "car", -- do not change
        carImage = "./images/audi.png",
    },
}

AK4Y.Helicopters = {
    {
        id = 1,
        spawnName = "frogger", -- Spawn code of the vehicle that will be given when the product is received
        brand = "Frogger",
        model = "",
        year = "2022 MODEL",
        costCredit = 2850, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 60, -- Percentage of product top speed
        brakingPower = 30, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "air", -- do not change
        carImage = "./images/helicopter.png",
    },
    {
        id = 2,
        spawnName = "frogger", -- Spawn code of the vehicle that will be given when the product is received
        brand = "AUDI",
        model = "RS Q8",
        year = "2022 MODEL",
        costCredit = 2850, -- The price to be paid for the product
        topSpeed = 250, -- Top speed of the product
        topSpeedGraph = 90, -- Percentage of product top speed
        brakingPower = 50, -- Percentage of braking power of the product
        robustness = 90, -- Percentage of product robustness
        vehType = "air", -- do not change
        carImage = "./images/helicopter.png",
    },
}

AK4Y.Items = {
    { 
        id = 1,
        itemName = "water",
        itemCount = 5,
        label = "Water",
        costCredit = 1000, 
        image = "./images/phone.png",
    },
}

AK4Y.Weapons = {
    { 
        id = 1,
        weaponName = "weapon_heavyshotgun",
        label = "HEAVY SHOTGUN",
        costCredit = 2550, 
        image = "./images/guns.png",
    },
    { 
        id = 2,
        weaponName = "weapon_pistol",
        label = "HEAVY SHOTGUN",
        costCredit = 2530, 
        image = "./images/guns.png",
    },
    { 
        id = 3,
        weaponName = "weapon_pistol",
        label = "HEAVY SHOTGUN",
        costCredit = 2150, 
        image = "./images/guns.png",
    },
    { 
        id = 4,
        weaponName = "weapon_pistol",
        label = "HEAVY SHOTGUN",
        costCredit = 2570, 
        image = "./images/guns.png",
    },
}

AK4Y.Money = {
    {
        id = 1,
        label = "100.000 DOLLAR",
        costCredit = 100, -- Credit to be paid for the product
        inGameMoney = 100000, -- In-game money to be given to the character after purchase
        image = "./images/moneyImage.png",
    },
    {
        id = 2,
        label = "200.000 DOLLAR",
        costCredit = 200, -- Credit to be paid for the product
        inGameMoney = 200000, -- In-game money to be given to the character after purchase
        image = "./images/moneyImage.png",
    },
    {
        id = 3,
        label = "300.000 DOLLAR",
        costCredit = 300, -- Credit to be paid for the product
        inGameMoney = 300000, -- In-game money to be given to the character after purchase
        image = "./images/moneyImage.png",
    },
    {
        id = 4,
        label = "400.000 DOLLAR",
        costCredit = 400, -- Credit to be paid for the product
        inGameMoney = 400000, -- In-game money to be given to the character after purchase
        image = "./images/moneyImage.png",
    },
}


-- do not change
-- do not change
-- If you want to close it, put it in the comment line
AK4Y.Customize = {
    {id = 1, label = "SPECIAL NUMBER", costCredit = 50, IType = "privNumber", image = "./images/phone.png"},
    {id = 2, label = "SPECIAL PLATE", costCredit = 50, IType = "customPlate", image = "./images/platee.png"}
}

