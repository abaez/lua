#!/usr/bin/env lua

--[[ arrays ]]
a = {}

for i=1,100 do
    -- a[#a + 1] = 0
    a[i] = 0
end


--[[ matrices && multi-dimensions arrays ]]


matrix = {}
N, M = 10, 10
for i=1,N do
    for j=1,M do
        matrix[i][j] = 0
    end
end

-- triangle matrix
triangle = {}
N = 10
for i=1,N do
    for j=1,i do
        triangle[i][j] = 0
    end
end


-- composition of two indices for matrix. Uses N*M
matrix = {}
N, M = 10, 10

for i=1,N do
    for j=1,M do
        matrix[(i - 1) * M + j] = 0
    end
end


--[[ Linked List ]]
list = nil

-- to insert an element at the beginning of the list you do:
list = { value = v, next = list}

-- working example
list = nil
for i=1,10 do
    list = {
        value = i,
        next = list
    }
end

local getnext = function(list, node)
    if not node then
        return list
    else
        return node.next
    end
end

function traverse( list )
    return getnext, list, nil
end


--[[ Queue and Double Queue ]]
Queue = {
    push = {},
    pop = {}
}

--- makes a queue witht the last element and the first element.
function Queue.new()
    return {first = 0, last = -1}
end



--- prepends to the first value and moves the original first back.
function Queue.push.first(queue, value)
    local first = queue.first - 1
    queue.first = first

    queue[first] = value
end

--- appends to the last value and moves the original last forward.
function Queue.push.back(queue, value)
    local last = queue.last + 1
    queue.last = last

    queue[last] = value
end


function Queue.pop.first(queue)
    local first = queue.first

    if first > queue.last then
        error("Queue is empty")
    end

    local value = queue[first]
    queue[first] = nil -- use gc for cleanup
    queue.first = first + 1

    return value
end

function Queue.pop.last(queue)
    local last = queue.last
    if last < queue.first then
        error("queue is empty")
    end

    local value = queue[last]
    queue[last] = nil
    queue.last = nil
    queue.last = last - 1

    return queue
end

--[[ Sets and Bags ]]

-- make a set with having a set elements as indices in a table.
-- example:
reserved = {
    ["while"] = true,
    ["end"] = true,
    ["function"] = true,
    ["local"] = true
}

for word in some_iterator_of_words() do
    if not reserved[word] then
        print(word .. " is not a reserved word")
    end
end


--- builds a set.
function Set(list)
    local set = {}
    for _,l in ipairs(list) do
        set[l] = true
    end

    return set
end

-- using the set builder. same as line 143
reserved = Set({"while", "end", "function", "local"})


--[[ Bags / multisets ]] -- each element can appear multiple times.
function insert(bag, element)
    bag[element] = (bag[element] or 0) + 1
end

function remove(bag, element)
    local count = bag[element]
    bag[element] = (count and count > 1) and count - 1 or nil
end

--[[ String buffers ]]
-- NEVER use string concatation on files with immutable strings for buffers.

local t = {}
for line in io.lines() do -- use io.read("*a") instead for memory allocation.
    t[#t + 1] = line .. "\n"
end

--[[ Graphs ]]


--- converts a name to graph.
-- @param name node's name.
-- @param adj the set of nodes adjacent to the current node.
local function name2node(graph, name)
    local node = graph[name]
    if not node then
        -- node does not exist, so create a new node
        node = {name = name, adj = {}}
        graph[name] = node
    end

    return node
end

function readgraph()
    local graph = {}
    for line in io.lines() do
        -- split line in two names
        local namefrom, nameto = string.match(line, "(%S+)%s+(%S+)")
        -- find corresponding nodes
        local from = name2node(graph, namefrom)
        local to = name2node(graph, nameto)

        -- adds 'to' from the adjacent set of 'from'
        from.adj[to] = true
    end
end
