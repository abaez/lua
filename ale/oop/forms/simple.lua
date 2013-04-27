#!/usr/bin/lua

---[[ simple way
Account = {}
Account.__index = Account

-- constructor
function Account.create( balance ) -- using direct call of self instead.
	-- acnt here is being used as the object instead of self
	local acnt = {}
	setmetatable(acnt, Account) -- make acnt have index of Account
	acnt.balance = balance -- initializer
	return acnt
end

function Account:withdraw( amount )
	self.balance = self.balance - amount
end

new = Account.create(1000)
new:withdraw(100)
--]]

---[[ a class with function to allow having an object made through call.
-- allows simple inheritance
Account = class(function(acc, balance)
				acc.balance = balance
			end)

function Account:withdraw( amount )
	self.balance = self.balance - amount
end

new = Account(1000) -- constructor automatically generated
new:withdraw(100)
--]]

-- example of line24 clasw with function using inheritance
Animal = class(function(a,name)
				a.name = name
			end)
function Animal:__tostring()
	return self.name .. ': ' .. self:speak()
end

Dog = class(Animal)
function Dog:speak()
	return "woaf"
end

Cat = class(Animal, function(c,name, breed)
			Animal.init(c,name)
			c.breed = breed
		end)
function Cat:speak()
	return "meow"
end

Lion = class(Cat)
function Lion:speak()
	return "roar"
end


