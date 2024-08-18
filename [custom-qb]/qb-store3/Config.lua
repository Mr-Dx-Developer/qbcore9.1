key_open = 'E'
radius_coord = 2.0

-- Disable this variable if you use system limits on your server
use_weight_system = true

-- If true, players can only have one store
player_can_only_own_one_store = true

-- If false, owners will not be able to carry out quests in their own stores.
own_missions = true

-- Set up your stores here
-- Only coordinates with vector3 are accepted, put the x,y,z values inside it.
stores = {
    -- NAME OF THE STORE (HEADER)
    ["WEE WOO FOOD & DRUG"] = {
        coordinates = {
            {
                buy_items = vector3(2741.04, 3497.78, 55.69),
                buy_store = vector3(2715.53, 3511.02, 55.69),
            },

        },

        -- Items that will be sold in this store
        items = {
-- name -> Item name in the Items table (if you are using ESX) or NameID (if you are using VRP)
  -- label -> Item table label (if you are using ESX) or item name (if you are using VRP)
  -- amount -> The amount of the original product that will be in stores at the beginning
  -- weight -> Item weight. If you use the restriction system, just ignore it.
  -- price -> Initial item price
  -- recommended_price-> recommended selling price of the item
  -- max_price -> The maximum price an owner can charge for a product
  -- request_price -> The price that will be charged to the store owner for ordering new products
  -- mission_money -> Cost the player will earn for completing the mission for this item
  -- max_request -> The maximum number of items that the owner can request for one quest
            {name = "water_bottle", label = "Bottle of Water", amount = 50, weight = 0.3, price = 1, recommended_price = 1, max_price = 100, request_price = 0, mission_money = 25, max_request = 50},
            {name = "beer", label = "Beer", amount = 50, weight = 0.3, price = 3, recommended_price = 3, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "coffee", label = "Coffee", amount = 50, weight = 0.3, price = 5, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "twerks_candy", label = "Twix", amount = 50, weight = 0.3, price = 2, recommended_price = 2, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "snikkel_candy", label = "Snickers", amount = 50, weight = 0.3, price = 2, recommended_price = 2, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "painkillers", label = "Painkillers", amount = 50, weight = 0.3, price = 3, recommended_price = 3, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "tosti", label = "Grilled Cheese Sandwich", amount = 50, weight = 0.3, price = 3, recommended_price = 3, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "kurkakola", label = "Cola", amount = 50, weight = 0.3, price = 2, recommended_price = 2, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "sandwich", label = "Sandwich", amount = 50, weight = 0.3, price = 2, recommended_price = 2, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "bandage", label = "Bandage", amount = 50, weight = 0.3, price = 5, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "kittybandage", label = "Kitty Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "swbandage", label = "SW Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "shrekbandage", label = "Shrek Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "carsbandage", label = "Cars Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "mousebandage", label = "Mouse Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "avengersbandage", label = "Avengers Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "baconbandage", label = "Bacon Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "pokemonbandage", label = "Pokemon Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "spongebobbandage", label = "Spongebob Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "toystorybandage", label = "Toystory Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "scoobydobandage", label = "Scoobydo Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
            {name = "packofbandaids", label = "Pack of Bandage", amount = 50, weight = 0.3, price = 50, recommended_price = 5, max_price = 100, request_price = 1, mission_money = 25, max_request = 50},
        },
    

        marker = 27,        -- type of marker
        use_blip = true,    -- enable blip in map
        blip = 59,          -- type of blip map
        blip_color = 1,     -- color blip map
        blip_name = "Super Shop",  -- name blip map

        ---color_header = "#03AE74",   -- color of store header
        ---color_buttons = "#03b67a",  -- color of store buttons
		
		color_header = "#dc143c",   -- color of store header
        color_buttons = "#ad0527",  -- color of store buttons

        price_store = 150000,         -- price of the store
        percentage_sell = 30,       -- Percentage that will be charged when selling the store
    },

}

missions_coords = {
    ['RANDOM_MISSION'] = {
        vector3(492.4845, -893.8429, 25.72052),
        vector3(760.8992, -708.9007, 28.399),
        vector3(-1271.777, -1214.021, 4.7875),
        vector3(-1053.958, -2013.681, 13.16245),
        vector3(-672.7007, -2386.075, 13.83678),
        vector3(-936.1968, -2544.441, 14.04701),
        vector3(438.2368, -1478.14, 29.30269),
    }
}

-- Here you can translate all messages and graphical interface.
-- Remember to save your settings whenever you update the Script.
translate = {
TR_TITLEWINDOW = "Items for Sale",
TR_TITLEWINDOW2 = "My Cart",
TR_SEARCH = "Search",
TR_MY_CART = "MY CART",
TR_ADD_TO_CART = "ADD TO CART",
TR_WEIGHT_SYMBOL = "kg",
  TR_PAYMENT = "PAYMENT",
TR_STORE_CART = "CART",
TR_PAYMENT_OPTIONS = "PAYMENT OPTIONS",
TR_BANK_ACCOUNT = "Bank account",
TR_WALLET_MONEY = "Money from Wallet",
TR_BUY_NOW = "Buy Now",
TR_CONTINUE_SHOPPING = "Continue Shopping",
  TR_TOTAL = "Total:",

TR_MONEY_SIMBOL = "$",
  TR_CONFIRM_TITLE = "Are you sure about this?",
  TR_CONFIR_MESSAGE = "The total amount is",
TR_CONFIR_MESSAGE2 = "and you have chosen to pay",
TR_CONFIR_MESSAGE3 = "Do you want to continue?",
TR_YES = "Yes",
  TR_NO = "No",
TR_PAYMENT_COMPLETE = "Payment completed!",
  TR_PAYMENT_NEGADE = "Payment rejected!",
TR_REMOVE = "remove",
TR_REASON = "Reason:",
TR_NOT_MONEY = "You have no money.",
TR_NOT_WEIGHT = "Your inventory is too full",

TR_CANCEL = "Cancel",
TR_STORE = "Shop",
TR_MANAGE_STORE = "MANAGE YOUR STORE",
TR_STOCK = "STOCK",
TR_BALANCE = "BALANCE",
TR_SELL_STORE = "SELL STORE",
TR_STORE_STOCK = "STORE STOCK",
TR_STORE_PRODUCTS = "STORE PRODUCTS IN STOCK",
TR_STORE_PRODUCTS2 = "STORE PRODUCTS FOR SALE",
TR_PUT_FOT_SALE = "Up for sale",
TR_MAX = "Max",
TR_TEXT_FOR_SALE = "Enter the quantity you want to put up for sale",
TR_REQUEST_ITEM = "Request Item",
TR_TEXT_REQUEST_ITEM = "Enter the quantity you would like to request",
TR_CURRENT = "Current",
TR_REMOVE_ITEM = "Remove Item",
TR_TEXT_REMOVE_ITEM = "Enter the quantity you want to remove",
TR_CHANGE_PRICE = "Change Price",
TR_TEXT_CHANGE_PRICE = "Enter the new price you want",
TR_STORE_BALANCE = "STORE BALANCE",


TR_STORE_TITLE_POP = "Add Money to Store",
TR_TEXT_ADD_MONEY = "Enter the amount of money you want to add to your store. This money must be in your bank account.",
TR_MONEY_BANK = "money from bank account",
TR_STORE_TITLE_POP2 = "Withdraw money to your bank account",
TR_TEXT_WITHDRAW = "Enter the amount of money you would like to transfer to your store.",
TR_MONEY_BALANCE = "money balance",
TR_ADD_MONEY = "Add Money",
TR_WITHDRAW = "Withdraw",
TR_SELL = "SELL",
TR_SELL_TEXT = "Your shop is currently priced at",
TR_SELL_TEXT2 = "If you sell, you will lose all rights to the goods that exist in it. Are you sure you want to sell your store?",
TR_CONFIRM_SELL = "Confirm Sale",
TR_CONFIR_SELL_MESSAGE = "Are you sure you want to sell your store? Money will be sent to your bank account and your store value is currently:",
TR_BUY = "BUY",
TR_BUY_TEXT = "Currently the price of the store is",
TR_BUY_TEXT2 = "When you purchase, you will be able to manage this store and request new items. Are you sure you want to buy this store?",
TR_CONFIRM_BUY = "Confirm Purchase",
TR_CONFIR_BUY_MESSAGE = "Are you sure you want to buy this store? Your bank account will be charged and this store is currently worth:",
TR_SOLD_OUT = "SOLD OUT",

TR_MISSIONS = "Work as a courier",
TR_STORE_MISSIONS = "Store Job",
TR_STORE_MISSIONS2 = "MERCHANT SHOP WORK",
TR_HAS_OWNER = "This store already has an owner.",
TR_PURCHASE_STORE = "You have purchased this store.",
TR_DONT_HAVE_MONEY = "You don't have the money to buy this shop.",
TR_DONT_HAVE_MONEY2 = "You have no money.",
TR_NOT_OWNER = "You are not the owner of this store.",
TR_SOLD_STORE = "You have sold the store.",
TR_DONT_BALANCE = "You don't have this amount on your balance",
TR_WITHDRAWED = "You are withdrawing money from the cash register.",
TR_WITHDRAWED2 = "You have added money to the cashier",
TR_STOCK_DONT_AMOUNT = "Store stock is not that high.",
TR_WAS_OFFERED = "Item has been offered for sale.",
TR_PRODUCTS_DONT_AMOUNT = "There is no such quantity in the goods store.",
TR_PUT_BACK = "Item has been returned to stock",
  TR_PRICE_HIGHER = "Price is higher than allowed for this item",
  TR_PRICE_CHANGED = "Item price has changed.",
  TR_DONT_BALANCE2 = "Your store does not have enough money to order this item.",
TR_PRODUCT_REQUEST = "You have placed a request for a product.",
TR_DONT_EXIST = "This quest has already been selected by another player or no longer exists.",
TR_RECEIVE_MISSION = "You have received a mission. Go to the location marked on the map to receive food.",
TR_ALREADY_MISSION = "You are already on a mission.",
TR_CANCEL_MISSION = "You have canceled the mission.",
TR_COMPLETE_MISSION = "You completed the mission and received:",
TR_DONT_AMOUNT = "The store does not have the specified quantity for the product: ",
TR_WAIT_PRODUCTS = "Please wait while products are being loaded into your vehicle.",
TR_GO_STORE = "Done! Deliver groceries to the store with your vehicle.",


TR_OPERATION_SUCCESFUL = "The operation was successful.",
TR_OPERATION_NEGADE = "Operation rejected",

  TR_REQUEST = "Request",
TR_ACCEPT_MISSION = "Accept Mission",
TR_CANCEL_MISSION2 = "Cancel Mission",

 TR_PRESS_BUTTON = "Press: E to open shop",
 TR_NOT_OWN_MISSION = "You cannot pick up quests from your own shop",

  TR_JUST_ONE_STORE = "You can only own one store",
  TR_PRICE_REQUEST = "Price for this request",

  TR_MISSIONS2 = "Work as a courier",
}