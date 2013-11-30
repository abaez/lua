#!/usr/bin/env lua

---[[ 6.2

--- declars polynomial array to be manipulated by the closure for x.
-- @func plynomnom
-- @param tab the closure parameter array in polynomial form.
-- @param x the value of used to return the calculated solution of polynomial.
polynomnom = function(tab)
    return function(x)
        result = 0

        for i,v in ipairs(tab) do
            result = result + v * x^(#tab-i) -- need to use #tab to reverse. :)
        end

        return result
    end
end


test = polynomnom({3,0,1})

for _,v in ipairs{0,5,10} do
    print(test(v))
end
--]]

