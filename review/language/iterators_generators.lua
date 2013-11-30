#!/usr/bin/env lua


--[[
    NOTE: all of these iterators are actually generators. A true iterator is
    shown in line170 and below. These iterators only apply to next value and
    actually for condition loop is what is iterating the values.
    iterators can be closures. Best example would be the one after called
    values below. In this iterator, only the value of the iterator
    is returned for each run.
--]]

--- an iterator that only returns the value of a sequential array.
-- @func values
-- @param tab
values = function(tab) -- the factory or contructor of the closure.
    local i = 0
    return function() -- note how this is closure which simply iterates next.
        i = i + 1
        return t[i]
    end
end


t = {3,9,13}

-- the closure which will iterate through the variables.
iter = values(t)
while true do
    local element = iter()
    if element == nil then break end -- to stop the iterator

    print(element)
end


for element in values(t) do -- same as the while loop presented above. Cleaner.
    print(element)
end


--[[
    for <var-list> in <exp-list> do <body> end

    Generic for can keep the iteration state!!!
    Generic for keeps the iterator function, invariant state,
    and control variable.

    note that <var-list> can have more than 2 variables to fetch, though
    usually just used with 2 or one variable as seen above and in ipairs().

--]]



--[[
    stateless iterators. Doesn't keep any state by itself. This avoids the cost
    of creating new closures for each iterator usage.
--]]

--- iterates directly with each call, but requires a call function to run.
-- Example of stateless iterator: iter.
-- @func iter
-- @param tab the table to iterate through.
-- @param i the index of the current element in tab.
local function iter( tab,i )
    i = i + 1
    local v = tab[i]
    if v then
        return i, v
    end
end

--- calls to statless iterator, iter.
-- The function returns iter's return, the table, and 0 for control variable.
-- @param tab the table to iterate through.
function ipairs(tab)
    -- note how the function iter is being called here.
    return iter, tab, 0
end


--[[
    Note: for pairs function, it uses the primitive function next to do
    the iteration, instead of building it. You can use next directly!!!!
--]]

function pairs( tab )
    return next, tab, nil -- uses nil when next has no more pairs to check.
end

t = {ale=32, monsters = "car"}

for k,v in next, t do -- using the next function directly.
    print(k,v)
end


--- a linked list.
-- @func getnext
-- @param list table to make into linked list
-- @param node the following index element in the table.
local function getnext(list, node)
    -- if node then return list
    -- else return node.next end

    -- using not node, to start with list as the first node!!!
    return not node and list or node.next
end

--- what iterates through the linked list.
-- @func traverse
-- @param list
-- @return since node will be nil in getnext first iter, returns list as node!
function traverse(list)
    return getnext, list, nil
end

list = nil
for line in io.lines("6.2.lua") do
    -- creating the list
    list = {val = line, next = list}
end

for node in traverse(list) do
    print(node.val)
end


--[[
    iterators with complex state. These form of iterators can keep more than
    one single invariant and control variable. Note: you can use closure type
    iterators to do the same as complex state iterators.

    A complex state iterator packs everything into a table as the invariant
    state for the iteration.
--]]

-- example of complex state iterator with allwords example.
local iterator


function allwords()
    local state = {line = io.read(), pos = 1}
    return iterator, state
end

function iterator( state )
    while state.line do
        -- search next word
        local s,e = string.find(state.line, "%w+", state.pos)
        if s then -- update nex position after the word
            state.pos = e + 1
            return string.sub(state.line, s, e)
        else
            state.line = io.read() -- read the next line
            state.pos = 1
        end
    end

    return nil -- no more lines to check, so nil is returned!
end







--[[
    true iterators. to show a true iterator, the allworlds will be redefined.
--]]

function allwords( f )
    for line in io.lines() do
        for word in string.gmatch(line, "%w+") do
            -- uses to actually do the iteration.
            f(word) -- the call the function
        end
    end
end

local count = 0
allwords(function(w)
    count = w == "hello" and count + 1
end)

print(count) -- gives the amount of times "hello" appeared in the iterator.