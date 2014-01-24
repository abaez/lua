#!/usr/bin/env lua

local print = print -- defines print as a local function

function foo( _ENV,a ) -- makes part of the _ENV
    print(a+b) -- uses local print with b being _ENV.b; makes sense in line9
end

foo({b = 14}, 12) -- declares 14 in _ENV so works just fine. 26
foo({b = 10}, 1) -- again, the same as line9, so 11