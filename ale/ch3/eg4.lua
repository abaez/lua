#!/usr/bin/lua
-- Examples from ch3 pg131-146

--Replacing built-in functions

real = print -- first making print into a variable called real

function fake(something) --now making fake print
	real("using superprint:", something) -- saying that will print using fake
end

print = fake -- now everytime print is used, fake print function is called instead.

--Compare function. using the comparing arguements, == .
print = real
print (print == real) -- can compare a function for similarities. 

--Function definitions as assignments

function name( some )
	-- body
end

name = function ( some  ) -- same as line 20 function 
	-- body
end


-- Anonymous function

(function ( a,b ) --a function without a name, simply flows with what the funtion does.
	print (a +b)
end) (2,3)


--print(function() end) -- this is to print an aonymous function.
nope1, nope2 = function() end, function() end --reads out values of anonymous function of this type.

print(nope1,nope2) -- prints anonymous function results.

-- Local functions. NOTE****** any function defined locally and NOT globally is faster. This is true for ANY function!

do
	local function locavg( a,b ) --just like variables, would be only classified for this do empty block.
		return (a +b)/2 
	end
	print(locavg(13,15))
end

print(locavg) -- print nil since  the locavg is not defined globally for this program

-- Use of semicolon
print("Test"); -- can use it, does no difference as you've learned. THANK GOD!
print "Can also print literal strings like this :)"; -- as long as it has no variables inside.


-- Defining a function that creates a function
function lt( num1 ) 
	return function lt2(num2) --makes another function for the return that checks for another value is < what was given.
		return num2 <num1 
	end
end


-- closure - a function that has more than one upvalue(se line 68). 
function lt3( num1 ) -- same as function from line 58
	return function ( num2 ) --the difference is the use of anon's function
	--note** num2 is using a upvalue - a local value that is from a higher scope. 
		return num2 <num1 
	end
end


--Defining functions with a private state.
--private state - local variable that stay consistent in the function.

function make(a) --make function that increments n and keeps it in a private state.
	local function get() --private state for a
		return a
	end

	local function inc( b ) --here we increment a with b. b is the a of the last run!
		a = a +b
	end

	return get, inc --lastly the return value for the change done.
end
