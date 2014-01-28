#!/usr/bin/env lua

--[[
    weak tables -- objects that are under control of the garbage collector.
    A way to tell the gc what is garbage in Lua.

    Note: everying in _G is not considered garbage, regardless of use.

    weak tables hold weak references such that it's eventually collected.

    Three types of weak tables that __mode can declare:
    "k" -- weak keys
    "v" -- weak values
    "kv" -- weak key-value

--]]

-- example of weak table
a = {}
b = {__mode = "k"} -- the keys are weak

setmetatable(a, b) -- makes the keys weak for a

key = {}
a[key] = 1

key = {}
a[key] = 2 -- second key

-- Note2: only objects can be collected, not numbers, booleans, or strings.
collectgarbage() -- collects the first key, due to weak key. :)
for k,v in pairs(a) do
    print(v) -- prints only the second key is collect, since no reference to it
end


--[[
    Memoize functions: uses a form of storage of values to increase speed of
    call.
--]]

-- example:
local results = {}
-- helps make sure that only the in use values are kept.
setmetatable(results, {__mode = "v"}) -- make weak values

function mem_loadstring( str )
    local res = results[str]
    if res == nil then -- check if result exist
        res = assert(load(str)) -- compute new result

        results[str] = res -- save for later; reuse
    end

    return res
end

-- example of Memoize function with color generation. Saves speed!
-- saves colors being used, and appends with new colors.
local results = {}
setmetatable(results, {__mode = "v"})

function create_RGB(r,g,b)
    -- defining key by the colors used
    local key = string.format("%d-%d-%d", r,g,b)
    local color = results[key]

    if color == nil then
        color = {red = r, green = g, blue = b}
        results[key] = color
    end

    return color
end


--[[
    tables with default values using weak tables
--]]

-- use of weak table with default value
local defaults = {}
setmetatable(defaults, {__mode = "k"})
-- having weak table allows for clean up when no reference is done.

local meta = {__index = function(t) return defaults[t] end}

function set_default( t, d )
    defaults[t] = d -- sets table as one of the defaults
    setmetatable(t, meta)
end


-- same example, but using it as a memoize function
local meta = {}
setmetatable(meta, {__mode = "v"}) -- note how it's a value weak

function set_default( t,d )
    local mt = meta[d]
    if mt == nil then
        mt = {__index = function() return d end}
        meta[d] = mt
    end

    setmetatable(t, mt)
end

--[[
    Ephemeron Tables
--]]

do -- making a function factory that uses same closure as to save speed.
    local mem = {}
    setmetatable(mem, {__mode = "k"})
    function factory( obj )
        local result = mem[obj]

        if not result then
            result = function() return obj end
            mem[obj] = result -- note how the key is the same as the value.
            -- uses ephemeron table, due to value and key being the same ref.
        end

        return result
    end
end


--[[
    Finalizers: used to garbage collect and object once an object is about to
    be collected. Makes sense when you think about it.
--]]

o = {x = "hi"}
setmetatable(o, {__gc = function(o) print(o.x) end})

o = nil -- note how o was made nil
collectgarbage() -- prints hi, since the finalizer __gc was reordered