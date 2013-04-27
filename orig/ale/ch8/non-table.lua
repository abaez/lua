#!/usr/bin/lua
--Non-tables with metamethods


-- string has a metatable
stringmeta= getmetatable("")
for k,v in pairs(stringmeta) do
	print(k,v)	--prints: __index table
end

somestring= "some string"
print(somestring.char(65,66,67)) --prints ABC

greet= "hello" --strings can be used as object oriented.
print(greet:upper()) --prints HELLO

formating = '<a href="%s">%s</a>'

print(formating:format("http://luaforge.net", "luaforge")) -- places each string on %s :)

--non-syntactical metamethods -- it doesn't control the behavior of an operator or other syntactical construct.
--controls the bheavior of the function tostring. 

t=setmetatable({}, {__metatable= false}) --prints an error when 