#!/usr/bin/lua

-- how to make hidden variables

--underscoring
require("middleclass")
MyClass = class("MyClasss")

function MyClass:initialize()
	self._privateVar = 1 -- example of private variable
	self.publicVar = 2
end

-- private class
require('middleclass')

MyClass2 = class('MyClass2')

local _privateClassCounter = 0

function MyClass2:initialize()
	_privateClassCounter = _privateClassCounter + 1
	self.publicVar = 2
end

function MyClass2:getCount()
	return(_privateClassCounter)
end


-- private instance methods

require('middleclass')
MyClass3 = class('MyClass3')

-- note that the method is not directly joined to MyClass3 with ':'
local _secretMethod = function(self)
	return string.format("My name is %s and I have a secret.", self.name)
end

function MyClass3:initialize()
	self.name = name
end

function MyClass3:shout()
	print( _secretMethod(self) .. "You wil never know...")
end

--- private instance attributes
-- note: this is done using weak tables since GC doesn't work for the key: self

require('middleclass')

MyClass4 = class('MyClass4')

-- weak table storing all private attributes and making sure GC works
local _private = setmetatable({}, {__mode = 'k'})

function MyClass4:initialize( name, age, gender )
	self.name = name
	_private[self] = {
		age = age,
		gender = gender
	}
end

function MyClass4:getName()
	return self.name
end

function MyClass4:getGender()
	return _private[self].gender
end