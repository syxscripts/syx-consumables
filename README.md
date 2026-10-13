# SYX Consumables

Configurable food, drinks, and roleplay alcohol for ESX + ox_inventory + ox_lib + esx_status.

## Dependencies
- es_extended
- esx_status (existing hunger/thirst system)
- ox_inventory
- ox_lib

## Installation
1. Put `syx-consumables` in your server resources folder.
2. Add the item definitions below to `ox_inventory/data/items.lua` (or your existing item definitions file).
3. Add `ensure syx-consumables` to `server.cfg` after its dependencies.
4. Restart the server/resources.

Example item definitions (add each item once; merge into existing definitions if already present):

```lua
['sandwich'] = { label = 'Sandwich', weight = 250, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.sandwich' } },
['pizza_slice'] = { label = 'Pizza Slice', weight = 300, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.pizza_slice' } },
['burger'] = { label = 'Burger', weight = 300, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.burger' } },
['fries'] = { label = 'Fries', weight = 180, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.fries' } },
['donut'] = { label = 'Donut', weight = 100, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.donut' } },
['taco'] = { label = 'Taco', weight = 180, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.taco' } },
['hotdog'] = { label = 'Hot Dog', weight = 250, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.hotdog' } },
['noodles'] = { label = 'Noodles', weight = 350, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.noodles' } },
['water'] = { label = 'Water', weight = 500, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.water' } },
['cola'] = { label = 'Cola', weight = 350, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.cola' } },
['sprunk'] = { label = 'Sprunk', weight = 350, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.sprunk' } },
['orange_juice'] = { label = 'Orange Juice', weight = 350, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.orange_juice' } },
['energy_drink'] = { label = 'Energy Drink', weight = 350, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.energy_drink' } },
['coffee'] = { label = 'Coffee', weight = 250, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.coffee' } },
['vodka'] = { label = 'Vodka', weight = 700, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.vodka' } },
['whiskey'] = { label = 'Whiskey', weight = 700, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.whiskey' } },
['beer'] = { label = 'Beer', weight = 500, stack = true, close = true, consume = 0, client = { export = 'syx-consumables.beer' } },
```

### Important
- `consume = 0` lets this resource call `exports.ox_inventory:useItem(data, callback)` after the progress bar. Do not set `consume = 1` for these entries or the item may be removed twice depending on your ox_inventory version/configuration.
- If your existing `water` or `burger` entries already have custom metadata/images/weights, preserve those fields and add only the `client.export` entry.
- Percentage gains are configured in `config.lua`. A value of `25` adds 250,000 to the ESX status value (25% of the normal 1,000,000 range).
- Prop models vary by GTA/FiveM build and installed assets. If a prop does not exist on your build, set that item's `prop = nil`.
- Test in a development server first. Existing custom status systems may use different event names than `esx_status:add`.
