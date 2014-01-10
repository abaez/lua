#!/usr/bin/env lua

--[[
    Modify the queue implementation so that both indices return to zero when
    queue is empty.
--]]

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

    if first > queue.last then -- initialize if first is greater than last.
        queue.first = 0
        queue.last = -1

        return queue
    end

    local value = queue[first]
    queue[first] = nil -- use gc for cleanup
    queue.first = first + 1

    return value
end

function Queue.pop.last(queue)
    local last = queue.last
    if last < queue.first then
        queue.last, queue.first = -1, 0

        return queue
    end

    local value = queue[last]
    queue[last] = nil
    queue.last = nil
    queue.last = last - 1

    return queue
end