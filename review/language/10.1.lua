#!/usr/bin/env lua

-- a simple exercise where you make each queen placed safe from other queens.

local board = 8 -- board size

--- check whether position n,c is free from attacks.
-- @func isplaceok
-- @param a board array.
-- @param n size of array.
-- @param c column.
-- @return true only when can place, else false.
local function isplaceok(a,n,c)
    for i=1,n-1 do -- need n-1 since a[i]+1 is called.
        if (a[i] == c) or -- checks column
            (a[i] - 1 == c - n ) or -- checks diagonal left
            (a[i] + 1 == c + n) then -- checks diagonal right
            return false  -- returns false since place can be attacked.
        end
    end

    return true -- no attacks are possible, so ok to place.
end

--- prints a board.
-- @func printsolution
-- @param a board array.
local function printsolution(a)
    for i=1,board do -- using board from line6
        for j=1,board do
            io.write(a[i] == j and "X" or "-", "")
        end
        io.write("\n")
    end
    io.write("\n")
end


function addqueen(a)
    local n = 1
    for row=1,board do -- DO NOT USE ROW

        for c=1,board do
            if isplaceok(a,n,c) then
                a[n] = c
                n = n + 1
            end
        end
    end
    printsolution(a)
end

addqueen({})