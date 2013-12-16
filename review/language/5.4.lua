#!/usr/bin/env lua

-- @param n size of the array.
-- @param m the size of combinations. example: 2 == 1 + 1, 3 == 1 + 1 + 1
function C(n,m)
    return C(n - 1, m - 1) + C(n-1, m)
end


local tab = {}

function combine(array)
    combo = combo or 2
    str = ""
    if #array >= combo then
        -- this section makes the combo level increase or decrease.

        str = str .. table.remove(array, 1)

        for i=1,#array do
            tmp = str .. array[i]
            for j= i+1,#array do
                table.insert(tab, tmp..array[j])
            end
        end

        combine(array)
    end
end


combine({"a","b","c","d","e"})

for i,v in ipairs(tab) do
    print(i,v)
end