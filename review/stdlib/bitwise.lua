#!/usr/bin/env lua

--[[
    bitwise through double precision floating point numbers. (Lua numbers)
    << multiplications of powers of two,
    >> division of powers of two.

    lua uses a bitwise library for bitwise operations.
--]]

-- example. Note: using the hex 0xffffffff for maximum number (2^32 - 1).

MAX = 0xffffffff

-- use to represent the number given in hex
function printx( x )
    print(string.format("0x%X", x))
end

--[[
    bit32 is the library. operates on 32 bit numbers.

    note: all bitwise fn can take however many arguments.
    note: all numbers are mapped with `n%2^32`  before being processed.

    bit32.band() -- binary AND
    bit32.bor() -- binary OR
    bit32.bxor() -- binary XOR
    bit32.bnot() -- binary NOT

    bit32.rshift() -- shift to right
    bit32.arshift() -- arithmetic shift to right
    bit32.lshift() -- shift to left
    bit32.arlshift() -- arithmetic shift to left
    bit32.lrotate() -- rotate to the left
    bit32.rrotate() -- rotate to the right

    note: a shift to negative shifts to the end of bit32. see line 49
--]]

printx(bit32.band(0xdf, 0xfd)) -- 0xdd
printx(bit32.bor(0xdf, 0xfd)) -- 0xdd
printx(bit32.bor(0xdf, 0xfd)) -- 0x2f
printx(bit32.bnot(0)) -- returns MAX.

printx(bit32.bor(2^32)) -- 0x0
printx(bit32.bor(-1)) -- 0xffffffff and (2^32 - 1)

-- 0xF. shifts right 28 bits. so 2^(32-28) - 1.
-- NOTE: since hex, each F holds 2 bytes, since 16/2 = 8 bits or 1 byte
-- shift by one byte, you need to use 3 powers, since 2^3 = 8.
-- so simple math. 2 bytes would be 4 powers (2^4).
printx(bit32.rshift(-1, 28))
printx(bit32.rshift(0xFF,4)) -- 0xf; shifts by 4 powers, so (2^(8-4) - 1)

printx(bit32.rrotate(0xabcdef, 4)) -- fabcde; shifts 16 bits from right to left
printx(bit32.lrotate(0xabcdef, 4)) -- bcdefa; shifts 16 bits from left to right


-- uses extract bit32 function to get a bit field from a number.
-- @param x the number to extract a bit range.
-- @param b what power of 2 or bit you want to start from.
-- @param e what power of 2 or bit you want to end from.
function extract( x,b,e )
    printx(bit32.extract(x, b, e))
end

extract(0xabcdef, 4, 8) -- 0xde;

-- same as extract but with a replace parameter for the bit field to replace.
-- @param r the bit to use for replacing.
function replace( x,r,b,e )
    printx(bit32.replace(x,r,b,e))
end

replace(0xabcdef, 0x0, 4, 8) -- 0xabc00f;