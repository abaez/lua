#!/usr/bin/env lua

--[[
    read the text, counting the number of occurance of each word.
    sort the list of word in descending order of frequency.
    print the first entries in the sorted list.
--]]

function allwords()

    local auxwords = function()
        for line in io.lines do
            for word in string.gmatch(line, "%w+") do
                coroutine.yield(word)
            end
        end
    end

    return coroutine.wrap(auxwords)
end

local counter = {}
for w in allwords() do
    counter[w] = (counter[w] or 0) + 1
end

local words = {}
for w in pairs(counter) do
    -- makes a new element without much complication.
    words[#words + 1] = w -- appends to word.
end


table.sort( words, function(word1, word2)
    return counter[word1] > counter[w2] or
        counter[word1] == counter[w2] and word1 < word2
end)


for i=1,(tonumber(arg[1]) or 10) do
    print(words[i], counter[words[i]])
end