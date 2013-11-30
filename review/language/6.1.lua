#!/usr/bin/env lua

-- NOT FINISHED!!!
-- NOT FINISHED!!!
-- NOT FINISHED!!!
-- NOT FINISHED!!!
-- NOT FINISHED!!!


-- write an integral
do
    local diff = function(fn, h) -- forward difference
        h = h or 1e-4
        return function(x)
            return fn(x + h) - fn(x)
        end
    end

    integral_discrete = function(fn)
        return function(b,a)
            a = a or 0
            forward = diff(fn)
            return forward(b + 1) - forward(a)
        end
    end

    discrete = function(fn, n)
        fwd = diff(fn)

        -- total = fwd(n + 1)^-1
        total = 0

        for k=n-1,0,-1 do
            total = total - fwd(k + 1)^-1
        end

        return total
    end

end





twox = function(x) return 2 * x end
fw = integral_discrete(twox)
print(fw(3))
fw = discrete(twox, 3)
print(fw)
