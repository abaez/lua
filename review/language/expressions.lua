#!/usr/bin/lua

--- a modulo function.
-- @func modulo
-- @param a the number to check.
-- @param b the modulo number to loop through.
function modulo(a, b)
    return a - (math.floor(a/b) * b )
end

--- significant figure representation.
-- @func sigfig
-- @param a the number to convert
-- @param b the amount of significant figures you want in decimal.
function sigfig(a, b)
    -- tonumber expression could be: 1*10^-b
    return a - a % tonumber("1e-" .. b)
end


-- relational: <, > , <= , >= , ==, ~=

-- logical: and, or, not

if not x then x = v end
x = x or v -- same as line 25

-- ternary example
max = (x > y) and x or y

-- concatenation: ..

-- length operator: #
print(#x)

-- table
tab = {} -- constructor of the table
tab = {x = 10, y = 20} -- note: faster since allocation done at constructor.
tab.x, tab.y = 10, 20 -- make the table variables like a record
tab.x = nil -- removes the field "x" from the table. Similar to table.remove()


-- mix of record and lists in a table
polyline = {
    color = "blue",
    thickness = 2,
    {x = 0, y = 0}, -- polyline[1]
    {x = -10, y = 1} -- polyline[2]
}

print(polyline[1].x) -- 0