#!/usr/bin/lua

--- factorial function
-- @func fact
-- @param n the factorial is positive.
function fact(n)
    -- gives factorial only for positive. if n < 0, then return "not done here"
    return n == 0 and 1 or
        n < 0 and "not done here" or
        n * fact(n - 1)
end


print(fact(tonumber(arg[1])))
-- print(fact(20))



--- 1.2 twice example.
-- @func twice
-- @param n the parameter to be multiplied by 2
function twice(n)
    return 2 * n
end


-- 1.3: I know none that use the "--" comment

-- 1.4: ___, _end, End, NULL


-- 1.5
print(arg[0])