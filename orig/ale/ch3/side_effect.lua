#!/usr/bin/lua
-- Example from ch pg113-124


--lua uses variable scopes to define the variable for that block.
-- so those definitions like c++ where all definitions are local only for that block


test1,test2 = "something", "something again"


function var_scope(test1)	--not the same as the variable test1. Here it is just an arguement that has the same name.
	print(test1,test2)	-- will print true for test1, but test2 will be the variable given in line 9.
end


-- using nested variables
function var_scope2( something )
	print("something is"..something)
	for something2= 1,10 do
		print("something2 is"..something2)
		something= something2 +1 -- //nested something inside another scope statement
	end
	print("something is now"..something)
end


-- Using local
function var_scope3( interest )
	for a= 1, 10 do
		interest = interest .. "a"
		print(interest)

		local interest = "_" -- local defines and declares the variable again, regardless of being in the same scope
		interest = interest .. "z"	--never increments since it is recreated on each loop
	end
	print("Done")
	print(something)
end

function var_scope3( interest ) -- same as line 29 function
	for a= 1, 10 do
		interest = interest .. "a"
		print(interest)
		do --a cleaner way to see where the new scope starts. Remember this is an empty block
			local interest = "_" -- local defines and declares the variable again, regardless of being in the same scope
			interest = interest .. "z"	--never increments since it is recreated on each loop
		end
	end
	print("Done")
	print(something)
end


-- using local twice
do
	local taste = "engine"	--first scope initialized
	local taste = taste .. "power"	--takes the last scope and adds power to it.
	print(taste)	--the prints is enginepower
end


-- always use local, instead of global for functions
function even(ate)
	local done --makes sure that done is only called inside the function
	if #ate %2 == 0 then
		done = true
	else
		done = false
	end
	return done
end

-- Side effects - basically, what gets assigned first and printed.
print(type(1), type("a")) --prints the arguement type according to the type. 

function give(value)
	print("return:\t"..tostring(value))	--tostring() is a built in function. convert arguement to string
	return value
end

-- Short-Cirtuit Evaluation from sideffects. NOTE, this takes time away due to the logic gate

function short( value )
	return type(value) == "string" and #value -- notice here that both #value and "string" are being processed before the check 
	--#value is not given in an error since it is first checked that it is a string due to and running
end

print(short(12) and short(32)) --prints  both.
print(short(1) and short(false)) --prints 1 and false
print(short(nil) and short(2)) --print nil for both, since explicitly definining nil first for the AND Short-Cirtuit logic gate

