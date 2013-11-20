#!/usr/bin/env lua

-- assignment
a = "hello ".. "world"
b = 4
b = b + 3

-- multiple assignments
-- NOTE: must always initialize each variable to initialize.
a, b = 10, 2*3
a, b = b, a  -- swaps the values

-- use local as much as possible. Saves memory and allocates faster
local a, b = 1, 20 -- initialize both as local like so


if true then
    local a
    local a = nil -- same as line17
end


-- conditional statements

-- while
local i = 1
while i < 10 do -- repeats while true
    i = i + 1
end

-- repeat -- runs first. stops when statement is true.
repeat -- repeats while false or until true.
    i = i - 1
until i < 1

-- example of repeat for read.
repeat
    local line = io.read()
until line ~= "" -- note: still visible for the condition.
print(line)


-- numeric for
for i=1,10 do -- optional 3rd value gives the step.
    print(i)
end

for i=10,1, -1 do -- negative
    print(i)
end

for i=1,math.huge do -- use constant that has no upper limit
    print(i)
     if (i > 10e5) then
        break
     end
end

-- generic for; uses an iterator function to traverse through the values.
-- some std iterators: io.lines, pairs, ipairs, string.gmatch, etc.
for k,v in pairs(table_name) do -- pairs/ipairs are made functions.
    print(k,v)
end

-- example of table manipulation
-- NOTE: k,v are only local, do not assign changes to the table with them.
other_tab = {}
for k,v in pairs(tab) do
    -- using another table, but can use the same table in this manner.
    other_tab[k] = v
end

-------------------------------------------------------------------------------
--[[
    break, return, goto

    break: finish a loop. It can stop a conditional loop: for, repeat, while.
    return: returns a value or finishes a function. Can use return to stop
        a part of a function from running.
    goto: jump to any point in a function to a label.
        label is written as -> ::label_name::
        NOTE: cannot jump outside a function.
--]]


function foo()
    do return end -- for debugging purposes, you can use this form to cut short
    print("car")
end
