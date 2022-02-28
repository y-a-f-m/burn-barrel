data:extend({
	{
        flags = {"hide-from-bonus-gui"},
        icons = {
            {
                icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
                tint = {
                a = 1,
                b = 0.475,
                g = 0.7,
                r = 1
                }
            },
            {
            icon = "__base__/graphics/icons/fluid/barreling/barrel-side-mask.png",
                tint = {
                a = 0.75,
                b = 0.075,
                g = 0,
                r = 0.25
                }
            },
            {
                icon = "__base__/graphics/icons/fluid/barreling/barrel-hoop-top-mask.png",
                tint = {
                a = 0.75,
                b = 0.075,
                g = 0.0,
                r = 0.25
                }
            }   
        },
        icon_size = 64,
        name = "rusty-barrel",
        order = "d[rusty-barrel]",
        subgroup="intermediate-product",
        stack_size = 50,
        type = "item"
    },
    {
        type = "recipe",
        category = "smelting",
        main_product="",
        enabled = "true",
        allow_decomposition = "false",
        energy_required = 3.2,
        ingredients = {
            { type = "item", name = "rusty-barrel", amount = 1 }
        },
		results=
		{
		},
        name = "smelt-rusty-barrel",
		subgroup="intermediate-product",
        icons =	{
			{icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png",
                tint = {
                a = 1,
                b = 0.475,
                g = 0.7,
                r = 1
                }
            },
			{icon = "__base__/graphics/icons/iron-ore.png", scale = 0.25, shift = {0, 5}}
		},
		icon_size = 64
    },
    {
        type = "recipe",
        category = "crafting",
        main_product="",
        enabled = "true",
        hidden = "true",
        allow_as_intermediate = "false",
        ingredients = {
            { type = "item", name = "iron-plate", amount = 5 }
        },
        results = {
            { type = "item", name = "rusty-barrel", amount = 1 }
        },
        energy_required = 3000,
        name = "hidden-rusty-barrel",
        icons =	{
			{icon = "__base__/graphics/icons/fluid/barreling/empty-barrel.png"},
		},
		icon_size = 64,
		subgroup="intermediate-product"
    }
})