#!/usr/bin/env lua

-- 1st class. It's a value as the same as a string, or number.


function mult2(x) return 2 * x end
mult2 = function(x) return 2 * x end -- same as line7


-- order function: function that receives two elements and returns in order.
-- example of order functon
network = {
    {name = "two", ip = "10.0.0.25"},
    {name = "three", ip = "10.0.0.123" },
    {name = "four", ip = "10.0.0.23"},
    {name = "five", ip = "10.0.0.2"}
}

-- higher-order function: gets another function as an argument.
table.sort( network, function(a,b)
    return a.name > b.name
end)


-- derivative := (f(x + delta) - f(x)) / delta
derivative = function(fn, delta)
    delta = delta or 1e-4
    return function(x)
        return math.floor((fn(x + delta) - fn(x))/ delta)
    end
end


print(mult2(5))
-- note: declaring first, so the variable in multi2() can be defined.
c =  derivative(mult2)

print(c(5))


-- closures
-- lexical scoping. can access variables of enclosing function. Lambda Calculus

names = {"pete", "jacob", "mary"}
grades = {mary = 10, pete = 7, jacob = 8}

-- without function
table.sort(names, function(n,m)
    return grades[n] > grades[m]
end)


-- example of lexical scoping. Using a variable from the parent function.
function sort_grade( names, grades )
    tbale.sort(names, function(n,m)
        return grades[n] > grades[m] -- note the parent values call here.
    end)
end


-- example of upvalues. This can be used as an iterator or generator!
function counter() -- a prototype for the closure
    local i = 0
    return function()
        i = i + 1 -- note the store here.
        return i
    end
end


a = counter() -- always need to initialize the closure

print(a()) -- 1
print(a()) -- 2

b = counter()
print(b()) -- 1 -- different closure.
print(a()) -- 3


sin = function( x ) -- for 180 degree version.
    return math.sin(x*math.pi/180)
end


do -- making a sandbox/secure environment for saving the original math.sin
    local sin = math.sin
    local k = math.pi/180
    math.sin = function(x) return sin(x * k ) end
end

-- another example of secure environment replacement
do
    local x = nil
end


-- non-global

-- table calls.
lib = {
    add = function(n,m) return n + m end,
    sub = function(n,m) return n - m end
}

print(lib.add(2,3), lib.sub(9,8))


-- local fn.
do
    local function a( b,c ) -- only read in this scope.
        return b + c
    end
end -- a() doesn't after here.


-- to do local recursion. declare first, then define the function.

-- ALWAYS use this format to call recursive function.
local fact
fact = function(n)
    return n == 0 and 1 or n * fact(n - 1)
end


-- tail cails: similar to a goto call. Returns to another function. example:
function f(x)
    return g(x)
end

-- note: since tail cails don't use stack space, they can loop unlimited...
function f(n)
    return n > 0 and f(n - 1)
end


-- NOT A TAILCALL. Look at how g(x) is called in line128 opposed to here.
function f( x )
    g(x)
end