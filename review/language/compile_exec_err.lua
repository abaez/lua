#!/usr/bin/env lua


---
--[[
    loadfile: function that is used to make dofile.
    You can also use loadfile to call a file once, but run multiple times.
    Helps as opposed to dofile, since you only compile once.
--]]


-- A simple dofile
function dofile( filename )
    -- using assert to raise error on failure.
    local f = assert(loadfile(filename))

    return f()
end


--[[
    load: does the same as loadfile, except from string.
    Use only when absolutely necessary.
    Mostly use load when need of running outside code.
    Also, note that load only reads global due to compilation and not local.
--]]
i = 0
local i = 20

f = load("i = i + 1; print(i)")

f(); -- i = 1
g = function() i = i + 1; print(i) end  -- i = 21


--[[
    precompiled lua code. Use luac to make them
    ex: luac a.lua -o a.lc
--]]


--[[
    package.loadlib()
    Use this to load code outside of lua, like C code.
    note: path MUST be static location and NOT relative/dynamic location.
--]]

local path = "/usr/lib/lua/5.2/socket/core.so"
local f = package.loadlib(path, "luaopen_socket")


--[[
    errors.
--]]

print("Enter a number:")
n = io.read("*n")
if not n then
    -- calls error function
    error("Didn't give the right type of input")
end


-- same as line 44 set.
print("enter a number")
n = assert(io.read("*n"), "Didn't give the right type of input")


file = assert(io.open(name, "r")) -- filehandle error check.

--[[
    pcall: use for error handling
--]]