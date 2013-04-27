#!/usr/bin/lua


-- using luac

--luac -p -l 
--[[

-p : parse code, don't actually make the bytecode, but sort of a check
-l : list the byte code.
-o : name the output
-s : strips debugging information
-v : version info
-- : stops handling options
-  : acts luac input as sourcecode

--]]
-- luac -o test.luac input_file.lua

function hi( name )
	print("hello, ".. name .. ".")
end

hi("whoever")

--Loadstring
--string.dump : function converts from a lua function to bytecode

bytecode= string.dump(hi) --converts hi to bytecode

loadstring(bytecode)("insert name here") --converts to bytecode to a function

------------------------------------------------------------------------------

--Garbage Collection - when memory is reallocated
function gar( length )
	collectgarbage("collect") --collect the garbage, to start clean
	for i=1,10 do
		local junk = string.rep(i, length) --using length to give a size for the string.
		print(string.rep("#", collectgarbage("count"))) --using collectgarbage to represent the garbage collection
	end
end


--Weak value/key metamethods
-- useful when you want to make an association between a function, table, coroutine, or userdata and some second value.

f1, f2, f3 = function() end, function() end, function() end -- just a test

weak_key= {f1=1, f2=2, f3=3}
setmetatable(weak_key, {__mod = "k"}) -- designs as a weak key

f2= nil -- make inaccessible 
collectgarbage("collect")
for k,v in pairs(weak_key) do
	print(k,v) -- f1 and f3 only printed with key
end


weak_value= {f1, f2, f3}
setmetatable(weak_value, {__mode= "v"}) -- designs as a weak value