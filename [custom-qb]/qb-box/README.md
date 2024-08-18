# qb-box
Simple mystery boxed script for QBCore full customizable

# Features:
- 4 types of boxes (small, medium. big and super)
- Small boxes only gives 1 item or 1 shit item or 2 values of money (can change item name or money value at config but not add items or money)
- Medium boxes gives 2 items or 2 shit items or 2 value of money (can change item name or money value at config but not add items or money)
- Big boxes gives 3 items or 3 shit items or 2 value of money (can change item name or money value at config but not add items or money)
- Super boxes gives 4 items or 3 shit items or 2 value of money (can change item name or money value at config but not add items or money)

# Preview: 
https://youtu.be/R6replrbknk

# Installation:

# Add to qb-core/shared/items.lua
```
	-- qb-box
	["mystery_smallbox"]  	= {["name"] = "mystery_smallbox", 			["label"] = "Small Mystery Box", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "mystery_smallBox.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["mystery_mediumbox"]  	= {["name"] = "mystery_mediumbox", 			["label"] = "Medium Mystery Box", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "mystery_mediumBox.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["mystery_bigbox"]  	= {["name"] = "mystery_bigbox", 			["label"] = "Big Mystery Box", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "mystery_bigBox.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["mystery_expensivebox"]  	= {["name"] = "mystery_expensivebox", 			["label"] = "Super Mystery Box", 								["weight"] = 100, 		["type"] = "item", 			["image"] = "mystery_expensiveBox.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Add images to qb-inventory/html/images

# Dependicies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-menu - https://github.com/qbcore-framework/qb-menu
