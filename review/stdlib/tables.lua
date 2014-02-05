#!/usr/bin/env lua

--[[
    table.insert -- appends to a table.
--]]


t = {}
for i=1,10 do
    table.insert(t, i)
end

-- same as above.
t = {}
for i=1,10 do
    t[#t + 1] = i
end

--[[
    table.sort -- sets an order for a table. Works only with arrays.
--]]

-- example of sorting in alphabetical order
t = {d = 1, b = 3, a = 5}

-- need to make a tmp table to sort through.
tmp_order = {}
for k,v in pairs(t) do
    tmp_order[#tmp_order + 1] = v
end

table.sort(tmp_order)
for i,v in ipairs(tmp_order) do
    print(i,v)
end

--[[
    table.concat -- takes a list of strings and returns as a single string.
--]]