#!/usr/bin/env lua

-- 2.1: gives false since, nil is nonvalue.
print(type(nil) == nil)

---[[ 2.2
print(
      0.0e12, -- 0
      0xa, -- 10
      0x12, -- 18
      0xffffffff, -- 4294967295
      0x1p10, -- 1024
      0.1e1, -- 1
      0x0.1p1 -- 0.125
      )
--]]


---[[ 2.3
num = {
    12.7, -- 127/10
    5.5 -- 11/2
}

--- get the common fraction of the power of 2 denominator.
-- @func powOf
-- @param n the number that you want to check for its common fraction.
function pow2(n)
    inc = 1
    repeat
        numerator = math.floor(n * 2^inc)
        denominator = 2^inc
        inc = inc + 1
    until numerator / denominator == n


    return numerator, denominator
end


for i=1,#num do
    print(pow2(num[i]))
end
--]]


---[[ 2.4
one = "<![CDATA[".. "Hello world" .. "]]>"
two = [=[ <![CDATA[Hello world]]> ]=]
--]]

--[[ 2.5
use somehow \z for the answer. Never done byte conversion. So not entirely sure
--]]

---[[ 2.6
a = {}
a.a = a
print(a.a.a.a) -- table, due to recursive calls of itself.

a.a.a.a = 3
print(a.a.a.a.a) -- nil, since now it's a.a = 3 in reality.
--]]