#!/usr/bin/lua

require("middleclass")

-- same as class('Person', Object) or Object:subclass('Person')
Person = class('Person')

function Person:initialize( name )
	self.name = name
end

function Person:speak()
	io.write("hi, I am ",  self.name , ".\n")
end

AgedPerson = class("AgedPerson", Person) -- or Person:subclass("AgedPerson")
AgedPerson.static.ADULT_AGE = 18 -- class variable

function AgedPerson:initialize( name, age )
	Person.initialize(self,name)
	self.age = age
end

function AgedPerson:speak()
	Person.speak(self) -- uses the method in person
	if self.age < AgedPerson.ADULT_AGE then
		print("I am not old enough for buttsecks :(")
	else
		print("I am old enough for buttsecks :)")
	end
end

local p1 = AgedPerson:new("Lara Croft", 23)
local p2 = AgedPerson:new("Jennifer Hudgens", 16)

p1:speak()
p2:speak()