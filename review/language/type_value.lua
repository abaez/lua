#!/usr/bin/env lua

--[[
    Eight basic types in lua:
    nil -- nonvalues
    boolean
    number -- double-precision floating-point numbers. Lua uses no int!
    string
    userdata
    function
    thread
    table
--]]


a = 10
print(type(a)) -- type: to check a type


-- numbers can be written in this form
a = 4 or 0.4 or 4.44e-5 or 0.4e12 or 4e+20

-- hexadecimal use 0x
hex = 0xff --[[255]] or 0x1a3 --[[419]] or 0x0.2 --[[0.125]] or
    -- binary exponent denoted by 'p' or 'P'
    0x1p-1 --[[0.5]] or 0xa.bp2 --[[42.75]]

-- strings are immutable
a = "one string"
b = string.sub(a, "one", "changed") -- changed the string but in new string

-- long string
example = [[
    Used for long comments. They do no interpret escape sequences.
]] or [==[
    This is literal string with multiple extensions for multiple [] placements.
]==]

--[=[
    Long comments can also have the extensions.
--]=]



-- table. TABLE ALWAYS DEFINES BY STRING
a = {} -- initialize
x = "y"
a[x] = 10  -- NOTE: x is a variable here, not a key to a value. key are strings!
print(a["y"]) -- will print 10, since a.y is the record
print(a.y) -- same as line48, with the syntatic sugar for the record.
print(a.x) -- returns nil since a["x"] doesn't exist.

print(#a) -- gives the size of the table