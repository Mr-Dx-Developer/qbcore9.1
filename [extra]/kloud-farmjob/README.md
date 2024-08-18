# kloud-farmjob

Dive into the world of a simple farmer, gather crops and sell it for money!

# Features

* Highly Configurable
* Easily Add Locations
* Highly Optimized (0.00ms Idle & 0.00 ~ 0.09 ms Active)
* Usage of Targeting Script for more immersive experience
* Smooth Animations

# Preview

https://youtu.be/xaWnb6a1-Uc

# Dependencies

**Required**

* [ox_lib](https://github.com/overextended/ox_lib)

**Framework**

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qbx-core](https://github.com/Qbox-project/qbx-core)
- [es_extended](https://github.com/esx-framework/esx_core)

**Target**

- [qb-target](https://github.com/qbcore-framework/qb-target) 
- [ox_target](https://github.com/overextended/ox_target)

**Inventory**

- [qb-inventory](https://github.com/qbcore-framework/qb-inventory)
- [lj-inventory](https://github.com/loljoshie/lj-inventory)
- [ps-inventoy](https://github.com/Project-Sloth/ps-inventory)
- [ox_inventory](https://overextended.dev/ox_inventory) 

# Installation

Join my [Discord Server](https://discord.gg/DbqC2SWzJk) for updates

## Configuration

### Language

Add this to your server.cfg
```cfg
setr ox:locale en
```

## server.cfg

```cfg
ensure FRAMEWORK # es_extended / qb-core
ensure ox_lib
ensure TARGET # ox_target / qb-target
ensure INVENTORY # ox_inventory / qb-inventory / lj-inventory
ensure kloud-farm
```

## For qb-core

### qb-core\shared\items.lua

```lua
    ['potato']                              = {['name'] = 'potato',                                ['label'] = 'Potato',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'potato.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Po-ta-to'},
    ['dirty_potato']                              = {['name'] = 'dirty_potato',                                ['label'] = 'Dirty Potato',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'dirty_potato.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Po-ta-to'},
    ['tomato']                              = {['name'] = 'tomato',                                ['label'] = 'Tomato',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'tomato.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'To-ma-to'},
    ['dirty_tomato']                              = {['name'] = 'dirty_tomato',                                ['label'] = 'Dirty Tomato',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'dirty_tomato.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'To-ma-to'},
    ['coffee_beans']                              = {['name'] = 'coffee_beans',                                ['label'] = 'Coffee Beans',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'coffee_beans.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Wakey wakey!'},
    ['dirty_coffee_beans']                              = {['name'] = 'dirty_coffee_beans',                                ['label'] = 'Dirty Coffee Beans',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'dirty_coffee_beans.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Wakey wakey!'},
    ['cabbage']                              = {['name'] = 'cabbage',                                ['label'] = 'Cabbage',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'cabbage.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Let-tuce? No!'},
    ['dirty_cabbage']                              = {['name'] = 'dirty_cabbage',                                ['label'] = 'Dirty Cabbage',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'dirty_cabbage.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Let-tuce? No!'},
    ['orange']                              = {['name'] = 'orange',                                ['label'] = 'Orange',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'orange.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'The talking orange!'},
    ['dirty_orange']                              = {['name'] = 'dirty_orange',                                ['label'] = 'Dirty Orange',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'dirty_orange.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'The talking orange!'},
    ['trowel']                              = {['name'] = 'trowel',                                ['label'] = 'Trowel',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'trowel.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Mini-shovel yes'},
    ['shovel']                              = {['name'] = 'shovel',                                ['label'] = 'Shovel',             ['weight'] = 350,           ['type'] = 'item',         ['image'] = 'shovel.png',              ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'Legit shovel yes'},
```

## For ox_inventory

### ox_inventory\data\items.lua

```lua
	['trowel'] = {
		label = 'Trowel',
		weight = 500,
		decay = true,
		stack = false,
		close = false,
		description = 'Diggy Diggy Diggy?',
	},
	
	['shovel'] = {
		label = 'Shovel',
		weight = 1000,
		decay = true,
		stack = false,
		close = false,
		description = 'Diggy Diggy Diggy?',
	},
	
	['dirty_potato'] = {
		label = 'Dirty Potato',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Potato potato but dirty dirty?',
	},
	
	['potato'] = {
		label = 'Potato',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Potato potato?',
	},
	
	['dirty_cabbage'] = {
		label = 'Dirty Cabbage',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Cabby cabby but dirty dirty?',
	},
	
	['cabbage'] = {
		label = 'Cabbage',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Cabby cabby?',
	},
	
	['dirty_tomato'] = {
		label = 'Dirty Tomato',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'To-ma-to but dirty',
	},
	
	['tomato'] = {
		label = 'Tomato',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'To-ma-to',
	},
	
	['dirty_orange'] = {
		label = 'Dirty Orange',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'It talks!!!!',
	},
	
	['orange'] = {
		label = 'Orange',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'It talks!!!!',
	},
	
	['dirty_coffee_beans'] = {
		label = 'Dirty Coffee Beans',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Ohh wakey wakey but dirty',
	},
	
	['coffee_beans'] = {
		label = 'Coffee Beans',
		weight = 250,
		degrade = 7160,
		decay = true,
		stack = true,
		close = false,
		description = 'Ohh wakey wakey but dirty',
	},
```

# Support & Suggestions

Contact me at my discord @ybarra. or join my Discord Server! <br>![Discord Server](https://discordapp.com/api/guilds/1131198002976014377/widget.png?style=shield)
