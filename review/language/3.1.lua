#!/usr/bin/env lua

---[[ 3.1
for i = -10, 10 do
    print(i, i % 3) -- will print i and then the modulo of i in 3.
    -- the result will be descending and then ascending.
end
--]]

---[[ 3.2
print(2^3^4, 2^-3^4)
--]]

---[[ 3.3
    --- a function that returns a polynomial value.
    -- The function needs a polynomial table to work properly.
    -- @func poly_to_tab
    -- @param tab the polynomial table.
    -- @param x the value for the polynomial table.
    function poly_to_tab(tab, x)
        result = 0
        for i=#tab,1 do
            result = result + (x^i * tab[i])
        end
        return result
    end
--]]

---[[ 3.4
    --- rewrite of 3.3
    function poly_to_tab(tab, x)
        result = 0
        xnew = 1
        for i=1, #tab do
            xnew = xnew * x
            result = result + (xnew * tab[i])
        end
    end
--]]

---[[ 3.5
    -- checks for boolean
    function isBoolean(bool)
        if bool == true or bool == false then
            return "is a boolean"
        else
            return "not a boolean"
        end
    end
--]]


--[[ 3.6
    no, yes i would recommend their use in the expression
--]]

---[[ 3.7
    sunday, monday = "monday", "sunday"

    t = {sunday = "monday", [sunday] = monday}
    -- monday, sunday, sunday
    print(t.sunday, t[sunday], t[t.sunday])
--]]

--[[ 3.8
    write everything in string literals when defining them.
--]]