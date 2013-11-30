#!/usr/bin/env lua
-- an iterator that returns all non-empty substrings of a string.

--- a generator which returns each character without spaces in the string.
-- @func toChar
-- @param str a string to iterate through.
toChar = function(str)
    local num = 1
    str = string.gsub(str, " ", "")
    return function()
        local char = string.sub(str, num, num)


        if num <= #str then
            num = num + 1
            return char
        end

    end

end


test_string = "I am trying something here"

for c in toChar(test_string) do
    print(c)
end