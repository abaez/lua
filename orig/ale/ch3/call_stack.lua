#!/usr/bin/lua
-- Examples from ch3 from pg124-131


--Function calling functions


--Call Stack - basically calling other functions inside another function. 
-- Stacking each function while it is being called. The more functions stacked, the longer the wait.
-- Has some similarity to nested functions, just a little bit more advance
function a( )
	print(" About to enter b")
	b()	--calling the function b
	print(" Just exited b")
end

function b( )
	print(" About to enter c")
	c() --calling the function c
	print(" Just exited c")
end

function c( )
	print("About to enter a")
	a() --calling the function a
	print("Just exited a")
end
a() --begin the call stack from line 11

--Recursion - when a function calls itself
function factorial(num)
	local done	--local scope only for the function
	if num == 0 then	--makes sure that the value is not 0, or do the loop of 1 in the end.
		done = 1
	else
		done = num * factorial(num -1) -- Here we call the function so that way it loops until it reaches 0.
	end
	return done
end

--Stack Overflow - when a call stack becomes too big. 
print(factorial(-1)) -- causes a stack Overflow. It is due to infinit recursion.

--Tail Calls - a function the immediately returns by calling a function.

-- Recursive tail call.
function fact(num, count )
	count = count or 1 --initializes the value of coint to 1.
	if num == 0 then
		return count
	else
		return fact(num - 1, num * count)		--recursive piece of the code
	end
end
