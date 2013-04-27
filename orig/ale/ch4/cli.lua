#!/usr/bin/lua
-- Scripts as vararg functions pg169-173

--Counting with vararg through the cli. 
local count= select("#", ...) --first we make a variable could count the sums the amount of argument given.
if count >0 then -- here making sure that the count is >0 
	print("cli arg:\t") --simple print
	for i=1, count do	--numerical for loop, following count
		print(i, (select(i, ...))) --finally printing the argument given and the integer.
	end
else
	print("no cli arg given.") --simple print out in saying nothing was given.
end

------------------------------------------------------------
--lua arguments which can be put in the shebang up in line1
--[[
-e --executes the following cli argument as lua code
-l --uses the require function in the library by the cli argument
-i --interactive mode
-v --prints version of lua
-- --stops handling options (useful if a script starts with "-")
-  --stops handling options and executes lua's input as a single chunk
--]]

--[[ Examples
lua -e "print('hello')" -- will print hello
lua "-eprint('hello')" --same as line 27

lua -i script.lua --runs the script and goes into interactive mode
--]]


------------------------------------------------------------
--Keyword arguments

sort{arr= t, compfnc= f} --Keyword arguments. Here, arr is set to t, and compfnc is set to f.
--so in the cli, you can use these keywords and it will just fine :)