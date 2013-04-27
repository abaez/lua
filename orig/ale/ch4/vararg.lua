#!/usr/bin/lua
--Functions with variable numbers of arguments, pg 165-169



------------------------------------------------------------------------
-- vararg - the average function- functions that accept variable numbers of arguments.

function avg( ... )	-- the ... means a vararg function also known as a vararg expression.
	local numerator,doniminator = 0, 0; --defining and initializing the return and count of the pair. These are set to 0.
	for i,num in ipairs({...}) do	--note that i is not being used in the function!
		--Notice the empty avg and {...} setup. This is so the values allowed can be any amount.
		numerator= numerator +num; 	--here we are adding the num to the numerator. So the summation is done.
		doniminator= doniminator +1 -- here we are adding the amount of integers given for each loop around.
	end
	
	assert(doniminator > 0, "Wanted to get average of 0 numeros") --simple error prompt in saying why shit hit the fan.
	return numerator / doniminator -- sum/count = avg :)
end

print(avg(1)) -- prints 1
print(avg(5,7)) -- prints 6
print(avg(12,-15,89,10,50)) --prints 29.2
print(avg()) --gives an error

------------------------------------------------------------------------
--vararg expression- ... -- Can be used anywhere where another expression would be used.
var1, var2 = ...; -- both var1 and var2 would be using one value.

function test( ... ) --used here as the arguments of the function.
	print(...)
end

test(nil, "b", nil, nil) -- prints exactly the same, nil, b, nil, nil.

function test2( arg1,arg2, ... )
	print("arg1 and arg2:\t", arg1,arg2) --prints only the first two args.
	print("The rest are:\t", ...) --prints the extra vararg
end

test2("a") --prints a, nil. Remember the first two arguments. 
test2("a","b") --prints a,b
test2("a","b","c") --prints a,b and c in the print of c like line35
test2("a","b","c","d") --same as line40.


--NOTE, CANNOT USE vararg expression as an upvalue
--[[
function WILLNOTWORK( ... )
	return function()
		print(...) --DOES NOT WORK as upvalue!
	end
end
--]]

------------------------------------------------------------------------
--unpack function - helps in using vararg expressions as upvalues through tables. 

function willwork( ... )
	local arg3= {...}	--first defining the vararg expression as a variable
	return function()	--using anon function
		print(unpack(arg3))	--second is using unpack to release the variable from a higher scope.
	end
end

------------------------------------------------------------------------
--select argument - allows to start from the the variable after.
select(position,variables) -- the format that select follows.


print(select(1, "a", "b","c")) -- prints a,b,c since starting from 1st variable.

print(select(2,"a","b","c")) -- prints b,c since starting from 2nd variable

print(select(4,"a","b","c")) -- prints nothing since the there is no 4th variable.

--note if using "#", you can see how many are in the list of variables
print(select("#","a","b","c"))  --prints 3, since 3 variables are given.

function test3( ... )
	print(select("#", ...)) --make a function so that way no need to write line 78 all the time.
end

test3(nil, "b", "one", 4) -- prints 4, since 4 elements are given. 

------------------------------------------------------------------------
--unpack argument - unpacks all elements in an array.

function test4( ... )
	local arg4= {...} -- making an arguement for the vararg expresion
	local cnt= select("#", ...) -- making a variable for the select size statement
	return function()
		print(unpack(arg4,1,cnt)) --using unpack to handle nil properly.
 	end
end

