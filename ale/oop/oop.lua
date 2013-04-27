#!/usr/bin/lua

--[[ making classes for oop in lua
	To make a class, you need a constructor, class method table, and a class.
--]]

String = {} -- class
mt = {} -- metatable

function String:new( s )
	-- constructor for the class
	return setmetatable({value = s or ''}, mt)
end

function String:print( )
	print(self.value)
end

mt.__add = function(a,b) return String:new(a.value .. b.value) end
mt.__mul = function(a,b) return String:new(a.value, b) end
mt.__index = String -- redirects any query to the String table

s = String:new("New String")
s:print() -- prints the object

-- using both addition overload and multiplication overload
a = ((String:new("Another string") + String:new(" is being done here")) *2)
a:print()