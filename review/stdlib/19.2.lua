#!/usr/bin/env lua

--[[
    Write a function to compute the Hamming weight of a given integer.

--]]



m1  = 0x55555555 -- 01
m2  = 0x33333333 -- 0011
m4  = 0x0f0f0f0f -- 00001111
m8  = 0x00ff00ff -- eight 0 eight 1
m16 = 0x0000ffff -- 16 zeros, 16 ones
hff = 0xffffffff -- all 1
h01 = 0x01010101


-- https://gist.github.com/davidm/2065267 :109
function hamming( num )
    num = num - bit32.band(bit32.rshift(num, 1), m1)

    num = bit32.band(num, m2) + bit32.band(bit32.rshift(num, 2), m2)
    num = bit32.band(num + bit32.rshift(num, 4), m4)

    return bit32.band(num + bit32.rshift(num, 8) + bit32.rshift(num, 16) +
                      bit32.rshift(num, 24), 0xff)
end


print(hamming(tonumber(arg[1])))