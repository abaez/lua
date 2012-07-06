#!/usr/bin/lua
-- Error-Containment functions - basically allow to continue but report there is an error


--pcall function - a function run as in a protective environment
-- the error is reported as one of the return values of pcall when an error happens.

function c()
	print("c 1")
	print(1 +nil)
	print("c 2")
end

function b()
	print("b 1")
	c()
	print("b 2")
end

function a()
	print("a 1")
	b()
	print("a 2")
end

print("Main 1")
local code, err= pcall(a) -- using pcall to start the function a
print("main 2", code and "Sucess" or err) --either worked or prints error

---------------------------------------------------------------------


--xpcall function -- uses an error handler and unable to pass arguments to the function it calls.

--examples 
function d()
	print(1 +nil)
end

print(xpcall(d, debug.traceback)) --debug.traceback goes by steps back