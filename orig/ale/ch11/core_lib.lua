#!/usr/bin/lua


--Environment Functions
--[[
 getfenv - returns Environment table
 setfenv - gives an environment table  to the given function
]]
-------Example
string= "global"

function sandbox()
	print(getfenv(), string) -- tells you the state of the of the table
end

setfenv(sandbox, {print= print, getfenv= getfenv, string = "sandbox"})
sandbox()
print(getfenv, string)


----------------------------------------------------------------------
-- Metatable function 
--[[

getmetatable(value)				-- returns its argument's __metatable metamethod
setmetatable(table, metatable)	-- gives a mettable to a table

--Note: all raw bypass the the metamethods
rawequal(first value, second value)	-- returns true if the two values are equal
rawget(table, index)				-- gives table[index]
rawset(table,index,value)			-- assigns a value to the table[index]

--]]


----------------------------------------------------------------------
--Chunk-loading Functions - generates a function from a lua chunk(source-code, or binary)
--[[

dofile()	-- executes the specified lua script or stdin.
load()	 	-- repeatedly calls the loader function to build up a lua chunk.
loadfile()	-- loads the spceified file as a lua chunk and returns the compiled function w/o running
loadstring()	-- loads a the specified string as a lua chunk and returns the compiled function w/o running

--]]


----------------------------------------------------------------------
-- Error-containment functions --used to keep runtime errors from propagating toward the host program

--[[

pcall(func, argument) -- the specified function is called.
xpcall(func, error handler) -- the specified function is called and the error handler traces.

--]]


----------------------------------------------------------------------
--Module functions -- modulize programs
--[[

module(module name, func) -- modulize the specific name with func.
require(module name) -- load up the module

--]]


----------------------------------------------------------------------
--Garbage collect -- look in page 361




----------------------------------------------------------------------
--Converstion function

--[[

tonumber(value, num base) -- converts the value to number, and in what base given :)
tostring(value) -- converts what is given to string, and prints as a literal string :)
type(value) -- tells what type is the value.
--]]


----------------------------------------------------------------------
--Error-Condition function

--[[

assert(test expression, error message) -- if test expression is false, terminates and prints the error message
error(error message, optional lvl) -- causes an error in the code to occur and prints a message saying what was given.

--]]


----------------------------------------------------------------------
--Table traversal function - let you visit each key-value pair in a table

--[[

ipairs(array) -- used in fori
next(table, seed) -- returns the next key-value pair from the table
pair(table) -- used in forp
--]]

----------------------------------------------------------------------
--vararg-related functions -- working with vararg
--[[

select(position or #, arguments) 	-- returns the specific argument given or the first with #
unpack(array, start, end) 			-- returns the values in the given array.
--]]
