#!/usr/bin/env lua

--[[
    Read from a text file a list of words to ignore.
--]]

function exist(t, w)
  for _, v in ipairs(t) do
    if v == w then
      return false
    end
  end

  return true
end

function ignore_file(file)
  local t = {}
  f = io.input(file):read("*a")
  for word in string.gmatch(f, "%w+") do
    if exist(t, word) then
      table.insert(t, word)
    end
  end

  return t
end


function allwords()
    local auxwords = function()
        for line in io.lines do
            for word in string.gmatch(line, "%w+") do
                if not exist(ignore_file("somefile.txt"), word) then
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