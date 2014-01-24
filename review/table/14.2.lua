#!/usr/bin/env lua

local foo -- declares foo
do -- declares a one level higher scope
    local _ENV = _ENV -- declares the _ENV to be only in this scope
    function foo(  ) -- declares foo but in this _ENV
        print(X) -- Prints the env
    end
end


X = 13 -- in std _ENV
_ENV = nil -- reset the _ENV to nil. Gives error as a result since no _ENV.
foo() -- gives nothing since outside of the scope of foo. from line13
X = 0 -- initialize X to the _ENV from line13