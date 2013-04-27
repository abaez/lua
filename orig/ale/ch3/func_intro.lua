#!/usr/bin/lua
--Example from ch3 extending lua with functions

print("The universe is", 42) -- Shows how you can do multiple print output with one print

function sayhi(name)
	print("Hi,"..name..". I like your shirt!") -- simple function that receives the value name and prints out.
end

sayhi("ale") -- would pull the function and print out according to the arguement given.

--type function. Gives the type of value that is given.
type1=type(42) 
print(type1) -- tells me the type that was given

--[[ types of arguements in lua
boolean, function, nil, number, string, table, thread, userdata
--]]

function avg(num1,num2)
	return (num1 + num2)/2 --does the arithmetic. with a return value instead. 
	--note, need to use a print function, otherwise the return statement will not be printed!
end

one, two = avg(1,2), avg(3,4) --can assign functions to variables!
print(avg(one,two))	--Can even use the function inside another function!

function even(length)
	if #length %2 == 0 then -- remember # checks the size, and %2 checks how many times it is a multiple of 2.
		-- The == checks for the statement to be true and prints accordingly.
		return true -- using boolean to push the result as true
	else
		return false -- if statement above, then this result is false.
	end
	print("This will never get printed. Just a random write")
end
print(even("alejandro")) -- checks to make sure the size of ale is true or not

-- return exits the innermost function, while break ends the innermost loop.


--Can use return for debuging purposes
function ret()
	print("printed")
	do return true end -- use an do for an empty block to escape the innermost function with return.
	print("no printed")
end

--function can receive more than one arguement
function super(uno,dos,tres)
	return uno,dos,tres -- going to give three parameters instead of just one!
end

print(super(1,2,3)) --prints the arguements of the function super.

print(super(super(1,2,3))) --can use function that has multiple values inside a function that reveices multiple, by only using one arguement!

test=super("a","b","c") -- used for the following
print(1,test) -- prints 1,a,b,c

print(test,"a") --prints only "a"