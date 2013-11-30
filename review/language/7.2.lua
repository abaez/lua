#!/usr/bin/env lua
-- reimplement 7.1's fromto with a step iterator.

--- closure iterator for fromto.
-- Iterates in range of values given.
-- @func fromto
-- @param m the start of the fromto iterator.
-- @param n the end of the fromto iterator.
-- @param step is the skip parameter.
-- @return gives increments each time the closure is called.
fromto = function(m,n, step)
    -- using m -1, due to the first increment in the closure return; line15.
    local o = m - 1

    return function()
        if o < n then
            -- need to be ternary to make sure the loop still runs.
            o = step and o + step  or o + 1
            return o
        end
    end
end


function check()
    for i in fromto(1,10,2) do
        print(i)
    end
end
check()

-- note: can't use a stateless form since for stateless, you would need a table.