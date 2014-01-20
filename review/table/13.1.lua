#!/usr/bin/env lua

--[[
    holds both metamethods, __sub from 13.1 and __len from 13.2.
--]]

local meta = {} -- metatable for sets
Set = {}

function Set.new( l )
    local set = {}
    setmetatable(set, meta)

    for _,v in ipairs(l) do
        set[v] = true
    end

    return set
end

--- checks if a value exist in a table.
-- @func exist
-- @param t table
-- @param w value to check for.
local function exist(t, w)
  for k in pairs(t) do
    if k == w then
      return true
    end
  end

  return false
end

--- removes any key that is the same.
-- @func __sub
-- @parm a first table.
-- @param b second table.
meta.__sub = function(a,b)
    -- failsafe check
    if getmetatable(a) ~= meta or getmetatable(b) ~= meta then
        -- 2 defines where the error message should direct
        error("Trying to add to different types. Need to be set value", 2)
    end

    local result = Set.new{}

    for k in pairs(a) do
        result[k] = true
    end

    for k in pairs(b) do
        -- removes any key if it exist in the table.
        if exist(result, k) then
            print("removing ".. k)
            result[k] = nil -- use nil to remove key. ;)
        else
            result[k] = true
        end
    end

    return result
end

meta.__len = function(t)
    local sum = 0
    for k in pairs(t) do
        sum = sum + 1
    end

    return sum
end

t1 = Set.new{1,2,3, "a", "b", "c"}
t2 = Set.new{3,4,5, "c", "d", "e"}


-- print(tostring(t1), tostring(t2))

t3 = t1 - t2
for k in pairs(t3) do
    print(k)
end

print(#t3)