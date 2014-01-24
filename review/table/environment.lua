#!/usr/bin/env lua

for n in pairs(_G) do print(n) end

function G_change( varname )
    return _G[varname]
end


--- allows to get methods out of a module.
-- @param field the method to look for.
function getfield( field )
    local v = _G
    for word in string.gmatch(field, "[%w_]+") do
        v = v[word]
    end

    return v
end

-- makes makes sub tables when they don't exist for a method
function setfield(field, v)
    local t = _G -- global table
    for w,d in string.gmatch(field, "([%w_]+)(%.?)") do
        if d == "." then
            t[w] = t[w] or {} -- makes the subtable.

            t = t[w]
        else
            t[w] = v
        end
    end
end


t = {x = {}}

setfield("t.x.y", 10) -- makes a subtable for the value 10 in _G

print(t.x.y)
print(getfield("t.x.y"))

--[[
    Global-variable declarations
    NOTE: use the module strict.lua from the default library to do exactly what
    is written in below for global variables.
--]]

--- an example that for keeping the global table secure
-- this forces an error prompt to appear for undeclared variables!!!
setmetatable(_G, {
    __nexindex = function(_,n)
        error("attmpt to write an undeclared variable: " .. n, 2)
    end,
    __index = function(_,n)
        error("attempt to read an undeclared variable: " .. n, 2)
    end
})

print(bob)

-- to change the global metamethod __nexindex you can also write straight.
-- works a whole lot better than the version in line49
__newindex = function(t,n,v)
    local w = debug.getinfo(2, "S").what -- using debug for scope details.
    if w ~= "main" and w ~= "C" then
        error("attempt to write to undeclared variable " .. n, 2)
    end
    rawset(t, n, v)
end

--[[
    Non-Global Environments
    _ENV -- The upvalue which holds all 'free name' variables.

    -- in lua5.2:
    * All chunk in the main scope are compiled to the _ENV upvalue.
    * All "free name" variables are translated to _ENV.<variable name>
    * load initializes the first upvalue of a chunk with the _G environment.
--]]

var = 1

-- prints 1 for both, since _ENV.var is the real name of a 'free name' variable
print(var, _ENV.var)


--[[
    Using _ENV
    _ENV = {} -- makes the environment empty. So no std _G variables work.
        for example, of _ENV = {} look at line100
--]]

a = 13 -- global
local a = 12 -- local

print(a) -- local so prints 12
print(_ENV.a) -- global so prints 13

_ENV = {}
a = 1
print(a) -- error, since print doesn't exist in this _ENV.

_ENV = {g = _G} -- use the old _G inside this new environment declaration.
a = 1
g.print(a) -- prints 1, since g holds the _G environment.

--- using inheritance for environment creation
a = 1
local new_env = {}
setmetatable(new_env, {__index = _G})
_ENV = new_env -- sets the new environment
print(a) -- prints 1 since the environment inherits the _G by __index.


--[=[
    _ENV and load
    loadfile([file [, "type" [, environment_variable]]])
--]=]

-- somefile.lua
width = 200
height = 300

-- main.lua -- just an example. Doesn't have to be main
env = {}
f = loadfile("somefile.lua", "t", env)
f() -- runs the somefile.lua inside the env table environment.
-- using this form allows for safe environment run of outside code.
