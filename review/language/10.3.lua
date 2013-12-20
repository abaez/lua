#!/usr/bin/env lua

--[[
    Change the most_frequent_word program to only search for words greater
    than 4 letters.
--]]


function allwords()

    local auxwords = function()
        for line in io.lines do
            for word in string.gmatch(line, "%w+") do
                if #word > 4 then
                    coroutine.yield(word)
                end
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