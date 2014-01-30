#!/usr/bin/env lua

--[[
    Write a function to test whether a given integer is a power of two.
--]]


-- using hexadecimal numbers. No real reason other than engraving to brain.

-- 32bit list. Note can only reach up to 0x1f, 0x20 gives 0 since 32 lshift
-- goes back to start.
local powers = {}
for i=0x1,0x1F do
    powers[i] = bit32.lshift(0x1, i)
end

-- checks for existence
function exist(t, w)
    for _, v in ipairs(t) do
        if v == w then
            return true
        end
    end

    return false
end

-- simple run with arg
print(exist(powers, tonumber(arg[1])))