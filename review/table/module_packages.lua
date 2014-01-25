#!/usr/bin/env lua

--[[
    module: code in Lua or the backend(C for std lua) that can be loaded
    through the require fn, which returns a table.

--]]


--example, using the math module with a different table name.
local m = require("math")

print(m.pi) -- print the pi function of the module Math.

local poo = m.pi
print(poo)-- same as line13 print. You know this.

--[[
    reguire :: a loader. A function that loads the module when found.
        It uses both package.loaded for if a module is already running.
        It also uses package.loadlib for C library modules.

    package.loaded  :: table that holds all loaded modules.
    package.path :: holds all locations a module could be in.
    package.cpath :: holds all locations a c lib module could be in.
    package.searchers :: what actually locates for a module. Could use lpeg!!
    package.preload :: maps module names to loader function

    example of package.cpath:
    ./?.so;/usr/lib/lua/5.2/?.so
--]]

--- normal form for module
do
    local M = {}
    -- chunk of code
    function M.bob()
        print("No real purpose of bob, but to show how to make a std module")
    end

    return M -- to retunr the module
end

--- use without the return of the table for the module. works the same as :34
do
    local M = {}
    package.loaded[...] = M
    -- chunk of code
    function M.bob()
        print("No real purpose of bob, but to show how to make a module")
    end
end

-- Using locals only module.
do
    local function bob()
        print("Using the super interesting way of no need to define the table")
    end

    -- need to rewrite all the functions and variables here for return.
    -- very intersting way of doing it.
    return {
        bob = bob
    }
end


-- Using environment to not polute the global space.
-- this form is similar to :54, but more difficult to note the scope of things.
do
    local M = {}
    setmetatable(M, {__index = _G}) -- to gain all the same modules.
    _ENV = M -- only inside this module's _ENV

    function add( a, b )
        return a + b
    end
end