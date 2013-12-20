#!/usr/bin/env lua

-- pseudo-random text formation.

function allwords()
    local line = io.read() -- current line
    local pos = 1 -- position of line

    return function()
        while line do
            local s,e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = io.read()
                pos = 1
            end
        end
        return nil
    end
end

function prefix(word1, word2)
    return word1 .. " " .. word2
end

local statetab = {}

function insert(index, value)
    local list = statetab[index]
    if list == nil then
        statetab[index] = {value}
    else
        list[#list + 1] = value
    end
end


-- Actual markov program
local N = 2
local MAXGEN = 100
local NOWORD = "\n"

-- building the table
local word1, word2 = NOWORD,NOWORD
for w in allwords() do
    insert(prefix(word1, word2), w)
    word1, word2 = word2, w
end
insert(prefix(word1, word2), NOWORD)

-- generate text
word2, word1 = NOWORD, NOWORD -- reinitialize

for i=1,MAXGEN do
    local list = statetab[prefix(word1,word2)]
    -- chooses a random item from the list.
    local r = math.random(#list)
    local nextword = list[r]

    if nextword == NOWORD then
        return -- same as continue
    end
    io.write(nextword, " ")
    word1, word2 = word2, nextword
end