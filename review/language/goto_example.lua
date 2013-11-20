#!/usr/bin/env lua

goto room1

::room1:: do
    local move = io.read()

    if move == "south" then goto room3
    elseif move == "east" then goto room2
    else
        print("Can't move this way")
        goto room1 -- do the loop again.
    end
end

::room2:: do
    local move = io.read()
    if move == "south" then goto room4
    elseif move == "west" then goto room1
    else
        print("Can't move this way")
        goto room2
    end
end

::room3:: do
    local move = io.read()
    if move == "north" then goto room1
    elseif move == "east" then goto room4
    else
        print("Can't move this way")
        goto room3
    end
end

::room4:: do
    print("You got out! good job!")
end