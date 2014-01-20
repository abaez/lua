#!/usr/bin/env lua

--[[
Metatable -- A behavior of a value when given an undefined operation.
    NOTE: A Metatable can exist for data types other than tables. However they
    can only be defined by C code implementation than just straight lua.
Metamethod -- functions that define the the undefined operation.
--]]

-- example
tab = {}
meta = {}
setmetatable(tab, meta) -- makes tab into a Metatable.

print(getmetatable(tab) == meta ) -- prints true due to setmetatable.


-- data structure set example:
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

a1 = Set.new{10, 20, 30}
a2 = Set.new{30, 1}

print(getmetatable(a1), getmetatable(a2)) -- both are the same metatable

function Set.union( a,b )
    -- failsafe incase the wrong type was used.
    if getmetatable(a) ~= meta or getmetatable(b) ~= meta then
        -- 2 defines where the error message should direct
        error("Trying to add to different types. Need to be set value", 2)
    end

    local res = Set.new{}
    for k in pairs(a) do
        res[k] = true
    end

    for k in pairs(b) do
        res[k] = true
    end

    return res
end

meta.__add = Set.union -- adds the meta table


a3 = a1 + a2  -- will work, since __add metamethod was made with Set.Union fn.


--[[
    Relational Metamethods

    *.__le
    *.__lt
    *.__eq
--]]

--- defining <= for Sets.
-- Since no function is built, we need to build the fn ourselves here.
meta.__le = function(a, b)
    for k in pairs(a) do
         if not b[k] then return false end
    end
    return true
end

--- defining < for Sets.
meta.__lt = function(a,b)
    return (a <= b) and not (b <= a)
end

--- definining == for Sets.
meta.__eq = function(a,b)
    return (a <= b) and  (b <= a)
end


--[[
    Library-Defined Metamethods

    -- these are metamethods that manipulate library functions like print()

    metamethods:
    *.__tostring -- changes print since print converts everything tostring().
    *.__metatable -- defines the metatable.
--]]

-- example with __tostring

function Set.tostring(set)
    local list = {}
    for element in pairs(set) do
        list[#list + 1] = element
    end

    return string.format("{%s}", table.concat( list, ", "))
end

meta.__tostring = Set.tostring

meta.__metatable = "I'M THE LAW!"



--[[
    Table-Access Metamethods
--]]

--[[
    __index -- defines when call is done to a table. SUPER POWERFUL.
    rawget(table,value) -- use to start without calling the __index metamethod.
--]]

--- example of metamethods with use of inheritance with a prototype.

-- create the prototype with initial values.
prototype = {
    x = 0,
    y = 0,
    width = 100,
    height = 100
}

meta = {} -- create a metatable

-- the constructor function. Builds the obj as a meta table.
function new( obj )
    setmetatable(obj, meta)
    return obj
end

-- define the __index metatable.
-- Allows to access values in prototype index when not declared initially.
-- note when calling __index as a fn, it calls the table an absent key for
-- arguments.
meta.__index = function(_, key)
    return prototype[key]
end
-- This does the exact same declaration as above. Just syntax sugar.
-- note: using this form takes more memory!!!
meta.__index = prototype

test = new{x = 10, y = 40}
print(test.width) -- prints 100, due to inheritance

--[[
    __newindex -- defines what to do on the table if no index. It is called
    when you are declaring a value.
    rawset(table,key,value) -- same rawget but for __newindex.
--]]


-- making a table with default values. Instead of getting nil, you get a value.
function setDefault(tab, default)
    -- to save from making multiple closures for each table, use line179.
    local meta = {__index = function() return d end}
    setmetatable(tab, meta)
end

test = {x = 10, y = 20}
print(test.x, test.z) -- print 10, nil. No z since no inheritance.
setDefault(test, 0) -- makes 0 the default

print(test.x, test.z) -- prints 10 and 0.

local meta = {__index = function(t) return t.___ end} -- using ___ for default.

function setDefault( t,d )
    t.___ = d
    setmetatable(t, meta)
end

--[[
    Tracking table access. Should use a proxy table, to monitor when a table
    actually is accessed and going to use __index and __newindex.
--]]

t = {} -- original table

local _t = t -- keep a private access to the orig table.


t = {} -- this is actually the proxy table.

local meta = {
    __index = function(t,k)
        print("~~~ Access to element: " .. tostring(k))
        -- access the original table.
        return _t[k]
    end,
    __newindex = function(t,k,v)
        print(string.format("~~~ Update of element: %s to %s", tostring(k),
              tostring(v)))
        _t[k] = v -- updates the orig table.
    end,
}

-- now when ever t changes something, it's read by the proxy.
setmetatable(t, meta)

--[[
    immutable tables
--]]

function readOnly( t )
    local proxy = {}
    local meta = {
        __index = t,
        __newindex = function(t,k,v)
            error("Attempted to update an immutable table", 2)
        end
    }

    setmetatable(proxy, meta)

    return proxy
end