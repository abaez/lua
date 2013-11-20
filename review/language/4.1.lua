#!/usr/bin/env lua

--[[ 4.1
    Used for avoiding multiple ends ands identifiers and do to no switch.
--]]

--[[ 4.2
    look at statements
--]]

--[[ 4.3
    It should be kept since it allows you to do the body once before the loop,
    thus giving you the ability to iterate with initial conditionals inloop.
--]]

---[[ 4.4
    room = 1
    repeat
        print("please move")
        move = io.read()

        if room == 1 then
            if move == "s" then room = 3
            elseif move == "e" then room = 2
            else print("can't move this way") end
        end

        if room == 2 then
            if move == "s" then room = 4
            elseif move == "w" then room = 1
            else print("can't move this way") end
        end

        if room == 3 then
            if move == "n" then room = 1
            elseif move == "e" then room = 4
            else print("can't move this way") end
        end

        if room == 4 then print("you got out!") end
    until room == 4
--]]

--[[ 4.{5,6}
    look at what statements
--]]