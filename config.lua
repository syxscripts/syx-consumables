Config = {}

-- Status values are sent to esx_status as 0-1,000,000 values.
-- Hunger/thirst gains are configurable per item below.
Config.ProgressPosition = 'bottom'
Config.Notify = true
Config.DefaultDuration = 5000
Config.CancelMessage = 'You stopped consuming that.'
Config.SuccessMessage = 'Consumed successfully.'

-- Optional alcohol effects. Effects are visual/roleplay only.
Config.Alcohol = {
    enabled = true,
    screenEffect = 'DrugsMichaelAliensFight',
    screenEffectDuration = 12000,
    drunkWalk = 'move_m@drunk@moderatedrunk',
    drunkDuration = 45000,
    blur = true,
    blurDuration = 5000
}

-- Add these item names to ox_inventory/data/items.lua (examples in README.md).
-- hunger/thirst are percentage points (e.g. 25 = 25% of the status bar).
Config.Items = {
    -- Food
    sandwich = { label = 'Sandwich', type = 'food', hunger = 25, thirst = 0, duration = 4500, prop = 'prop_sandwich_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    pizza_slice = { label = 'Pizza Slice', type = 'food', hunger = 45, thirst = 0, duration = 6000, prop = 'prop_pizza_slice_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    burger = { label = 'Burger', type = 'food', hunger = 40, thirst = 0, duration = 5000, prop = 'prop_cs_burger_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    fries = { label = 'Fries', type = 'food', hunger = 15, thirst = 0, duration = 4000, prop = 'prop_food_chips', bone = 18905, pos = vec3(0.12, 0.03, 0.02), rot = vec3(-80.0, 0.0, 0.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    donut = { label = 'Donut', type = 'food', hunger = 12, thirst = 0, duration = 3500, prop = 'prop_donut_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    taco = { label = 'Taco', type = 'food', hunger = 22, thirst = 0, duration = 4000, prop = 'prop_taco_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    hotdog = { label = 'Hot Dog', type = 'food', hunger = 30, thirst = 0, duration = 4500, prop = 'prop_cs_hotdog_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' } },
    noodles = { label = 'Noodles', type = 'food', hunger = 28, thirst = 0, duration = 5500, prop = 'prop_cs_bowl_01', bone = 18905, pos = vec3(0.13, 0.05, 0.02), rot = vec3(-50.0, 16.0, 60.0), anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' } },

    -- Drinks
    water = { label = 'Water', type = 'drink', hunger = 0, thirst = 45, duration = 4000, prop = 'prop_ld_flow_bottle', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' } },
    cola = { label = 'Cola', type = 'drink', hunger = 0, thirst = 30, duration = 3500, prop = 'prop_ecola_can', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' } },
    sprunk = { label = 'Sprunk', type = 'drink', hunger = 0, thirst = 30, duration = 3500, prop = 'prop_ld_can_01', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' } },
    orange_juice = { label = 'Orange Juice', type = 'drink', hunger = 0, thirst = 35, duration = 4000, prop = 'prop_orang_can_01', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' } },
    energy_drink = { label = 'Energy Drink', type = 'drink', hunger = 0, thirst = 25, duration = 3500, prop = 'prop_energy_drink', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' } },
    coffee = { label = 'Coffee', type = 'drink', hunger = 0, thirst = 20, duration = 4500, prop = 'p_amb_coffeecup_01', bone = 57005, pos = vec3(0.12, 0.0, 0.0), rot = vec3(-90.0, 0.0, 0.0), anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' } },

    -- Alcohol (optional RP effects)
    vodka = { label = 'Vodka', type = 'alcohol', hunger = 0, thirst = 12, duration = 5000, prop = 'prop_vodka_bottle', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' }, alcohol = 2 },
    whiskey = { label = 'Whiskey', type = 'alcohol', hunger = 0, thirst = 10, duration = 5000, prop = 'prop_whiskey_bottle', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' }, alcohol = 2 },
    beer = { label = 'Beer', type = 'alcohol', hunger = 0, thirst = 15, duration = 4000, prop = 'prop_beer_bottle', bone = 18905, pos = vec3(0.12, 0.008, 0.03), rot = vec3(240.0, -60.0, 0.0), anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' }, alcohol = 1 }
}
