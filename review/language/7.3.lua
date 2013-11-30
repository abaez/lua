#!/usr/bin/env lua
-- write an iterator that returns all words from a given file w/o repititions.


--- checks to see if the word has already been read.
-- @func inList
-- @param word the word to check for.
-- @param tab the table to iterate through.
function inList(word, tab)
    for _,v in ipairs(tab) do
        if v == word then
            return true
        end
    end

    return false
end

--- an iterator that checks for words exclusively in a list of lines.
-- Uses a closure iterator to do the generation.
-- Note: use with io.lines() or file:lines() for correct iteration.
-- @func uniquewords
-- @param lines a list of lines to iterate through in the closure.
function uniquewords(lines)
    local pos = 1
    local word_list = {} -- holds all the unique words found for inList.

    return function()
        for line in lines do -- need for a complete check in the file.
            local s, e = string.find(line, "%w+", pos) -- returns start and end.
            if s then -- checking if there is a s to continue the check.
                pos = other + 1 -- next position after the word

                word = string.sub(line, s, e)
                if not inList(word, word_list) then -- checks for word in list.
                    table.insert(word_list, word) -- adds new word to list
                    return word
                end
            else
                pos = 1 -- reset position to 1.
            end
        end
    end
end


