#!/usr/bin/env lua

--[[
    coroutine: a thread but only runs one at a time.

    lua uses asymmetric coroutines, allowing multiple functions to yield and
    resume a coroutine.

    status of a coroutine: suspended, running, dead, normal

    note: normal -- when you call another coroutine while in one coroutine.
    The original is not running, but not suspended due to the sort of tail-call

    Using a resume with a pair of coroutine can share the output.


    coroutine.create()  -- create a coroutine
    coroutine.status() -- check status
    coroutine.resume() -- resume the coroutine. receives the return from yield.
    coroutine.yield() -- suspend to resume later. returnds a pending call.
--]]

-- making a coroutine
co = coroutine.create(function()
    print("hi")
end)

print(co) -- prints thread due to the use of coroutine.
print(coroutine.status(co)) --  prints suspended
coroutine.resume(co) -- prints hi since, you resumed the cr.
print(coroutine.status(co)) --  prints dead since already called.


co = coroutine.create(function()
    for i=1,10 do
        print("co "..i)
        coroutine.yield() -- suspends on every jump in the loop.
     end
end)


coroutine.resume(co) -- print 1
coroutine.resume(co) -- print 2
coroutine.status(co) -- prints suspended
coroutine.resume(co) -- print 3



-- sharing the output
co = coroutine(function(a,b,c)
    print("co", a,b,c + 2)
end)
coroutine.resume(co, 1,2,3) -- prints co 1 2 5

-- can use coroutine.yield to do an action once called
co = coroutine.create(function(a,b)
    coroutine.yield(a+b, a-b)
end)
print(coroutine.resume(co, 20, 10)) -- true 30 10


--[[
    example of coroutine producer-consumer driven design.
    This is when a producer is the coroutine and only run when consumer calls.

--]]
function receives()
    local status, value = coroutine.resume(producer)
    return value
end

function send(x)
    coroutine.yield(x)
end

producer = coroutine.create(function()
    while true do
        local x = io.read()
        send(x)
    end
end)


--[[
    coroutine iterator
--]]

-- example: perumatation generator with coroutine
function permgen(array,n)
    n = n or #array -- default n is size of array
    if n <= 1 then
        coroutine.yield(array)
    else
        for i=1,n do
            -- swaps the i-th element with the last one
            a[n], a[i] = a[i], a[n]
            permgen(a, n - 1) -- recusively call again with lower element call.

            -- swap back the i-th element
            a[n], a[i] = a[i], a[n]
        end
    end
end


-- the constructor for the generator.
function perumatation( array )
    local co = coroutine.create(function()
        permgen(array)
    end)

    return function()
        local code, result = coroutine.resume(co)

        return result
    end
end

-- using coroutine.wrap to write the permutation function.
-- wrap is syntax sugar for create and resume in a generator form like line107.
function permutation( array )
    return coroutine.wrap(function()
        permgen(array)
    end)
end


function print_array( array )
    for i=1,#a do
        io.write(a[i], " ")
    end
    io.write("\n")
end