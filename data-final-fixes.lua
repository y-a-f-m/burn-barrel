local t  = {}
local modified = false

for _,i in pairs(data.raw.recipe["empty-barrel"].ingredients) do
    local name = i.name
    if data.raw.recipe[name] ~= nil then
        log(type(data.raw.recipe[name]))
        log(name)
        if data.raw.recipe[name].ingredients ~= nil then

            for _,i2 in ipairs(data.raw.recipe[name].ingredients) do
                local t2 = {}
                
                if (i2.amount > 1) and (i2.type == "item") then
                
                    t2.name = i2.name
                    t2.type = i2.type
                    t2.amount = i2.amount - 1
                    table.insert(t,t2)
                    modified = true
                end
            end        
        else 
            for k,i2 in pairs(data.raw.recipe[name].normal.ingredients) do
                local t2 = {}
                if i2[2] > 1 then
                    t2.name = i2[1]
                    t2.amount = i2[2] - 1
                    table.insert(t,t2)
                    modified = true
                end
            end        
        end

    end
    if not modified then 
        t = {{name = "iron-plate", amount = 4}}
    end
    
    data.raw.recipe["smelt-rusty-barrel"].results = t
end