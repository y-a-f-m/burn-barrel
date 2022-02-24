local solid_fuel_value = 12000000

local fuel_type_ratios = {
		["light-oil"] = 10,
		["heavy-oil"] = 20,
		["petroleum-gas"] = 20,
		["crude-oil"] = 30,
		["lubricant"] = 20
        }

for _,r in pairs(data.raw.recipe) do
	if r.subgroup == "fill-barrel" then
        if fuel_type_ratios[r.ingredients[1].name] ~= nil then
            local barrel_quantity = r.ingredients[1].amount
            local barrel_fuel_value = solid_fuel_value / fuel_type_ratios[r.ingredients[1].name] * barrel_quantity
            log(r.results[1].name)
            local barrel_type = r.results[1].name
            if data.raw.item[barrel_type] ~= nil then
                data.raw.item[barrel_type].fuel_value = barrel_fuel_value .. "J"
                data.raw.item[barrel_type].fuel_category = data.raw.item["solid-fuel"].fuel_category
                data.raw.item[barrel_type].fuel_top_speed_multiplier = data.raw.item["solid-fuel"].fuel_top_speed_multiplier
                data.raw.item[barrel_type].fuel_acceleration_multiplier = data.raw.item["solid-fuel"].fuel_top_speed_multiplier
                data.raw.item[barrel_type].fuel_emissions_multiplier = data.raw.item["solid-fuel"].fuel_emissions_multiplier
                data.raw.item[barrel_type].fuel_glow_multiplier = data.raw.item["solid-fuel"].fuel_glow_multiplier
                data.raw.item[barrel_type].burnt_result = "rusty-barrel"
            end
        end
    end
end

data.raw.item["solid-fuel"].fuel_value = "5MJ"
data.raw.item["solid-fuel"].fuel_acceleration_multiplier = 0.5
data.raw.item["solid-fuel"].fuel_top_speed_multiplier = 0.2
data.raw.item["solid-fuel"].fuel_emissions_multiplier = 5.0


for _,r in pairs (data.raw.furnace) do
    if r.energy_source.fuel_category == "chemical" then
        r.energy_source.burnt_inventory_size = r.energy_source.fuel_inventory_size
    end
end

for _,r in pairs (data.raw.boiler) do
    if r.energy_source.fuel_category == "chemical" then
        r.energy_source.burnt_inventory_size = r.energy_source.fuel_inventory_size
    end
end

for _,r in pairs (data.raw.inserter) do
    if r.energy_source.fuel_category == "chemical" then
        r.energy_source.burnt_inventory_size = r.energy_source.fuel_inventory_size
    end
end

for _,r in pairs (data.raw.car) do
    if r.burner.fuel_category == "chemical" then
        r.burner.burnt_inventory_size = r.burner.fuel_inventory_size
    end
end

for _,r in pairs (data.raw.locomotive) do
    if r.burner.fuel_category == "chemical" then
        r.burner.burnt_inventory_size = r.burner.fuel_inventory_size
    end
end