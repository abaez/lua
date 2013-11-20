#!/usr/bin/env lua


-- function can carry out a tastk or compute and return values.

-- NOTE: always need to parenthesis except for these exceptions:
print "Hello World" -- print("Hello World")
dofile 'a.lua' -- dofile('a.lua')
print [[a multi-line message]] -- print([[a multi line message]])
f{x = y, y = 20} -- f({x=10, y=20})
type{} -- type({})

-- can use object-oriented calls.
tab = {}
function tab:test(x) self.x = x; print(self.x) end


tab.test(tab, "hello")
tab:test("hello") -- the same as line20. calls object internally.


function add(a)
    local sum = 0
    for i=1,#a do
        sum = sum + a[i]
    end
    return sum
end


-- multiple returns

s, e = string.find("hello lua users", "lua") -- return to int.
print(s,e)

function maximum(a)
    local mi = 1 -- index of max
    local m = a[mi] -- max value
    for i=1,#a do
        if a[i] > m then
            mi = i
            m = a[i]
        end
    end

    return m, mi
end

print(maximum{8,10,23,12,5}) -- prints 23 3. Very cool.

-- example of different forms of return in lua
foo = {
    function() end,
    function() return "a" end,
    function() return "a", "b" end
}

x, y = foo[3]() -- calling the 3rd function to give "a" and "b" to x,y
x = foo[3]() -- "b" is discarded
x,y,z = 1,foo[3]() -- 1, "a", "b"

-- prints "ale" since lua discards extra returns in an expression call.
print(foo[3]() .. "le")


-- variadic function: using vararg expression := ...
function add( ... )
    local s = 0
    -- using vararg as a table constructed.
    for i,v in ipairs({...}) do
        s = s + v
    end

    return s
end

print(add(1,2,3,4,5)) -- 15


function ex1( a,b,c )
    -- body
end

function ex1( ... ) -- same as line80
    local a,b,c = ...
end


function fwrite( fmt, ... ) -- using vararg for arguments return
    return io.write(string.format(fmt, ...))
end

fwrite("%s %s", "hello", "world") -- two strings. very cool.


-- named arguments
-- use a table to define the arguments so can use parameter selection
function rename(arg)
    print(arg.old, arg.new)
end

rename{new="magic", old="magic"} -- very very cool.