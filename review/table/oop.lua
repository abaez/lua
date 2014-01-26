#!/usr/bin/env lua

--[[
    Third time reviewing oop in Lua. :P
--]]

-- example of basic method structuring
Account = {balance = 0}

-- using the receiver 'self' to make the method(fn) have independence of table.
function Account.withdraw( self, v )
    self.balance = self.balance - v
end

function Account:withdraw( v ) -- same ase line11. using syntax sugar.
    self.balance = self.balance - v
end

Account = {
    balance = 0,
    withdraw = function(self,v) -- need to use self, since can't use the sugar.
        self.balance = self.balance - v
    end
}

function Account:deposit( v )
    self.balance = self.balance + v
end

Account.deposit(Account, 200.00)
Account:deposit(200.00) -- same as above, but using the sugar!
Account:withdraw(200.00) -- i like sugar!

--[[
    Classes: using metatables __index to index a prototype of a table into
    another table.

    -- a gains Account's methods and structs.:)
    setmetatable(a, {__index = Account})
--]]

function Account:new( object )
    object = object or {}

    setmetatable(object, self) -- sets object's with the same metatable
    self.__index = self -- all of the methods and fiels in Account are indexed.

    return object
end


-- initialize a new object of the class Account with its prototype
magic = Account:new{balance = 0}
magic:deposit(100.00) -- works just fine, due to __index magic :)

-- literal translation of line54.
getmetatable(magic).__index.deposit(magic, 100.00)

--[[
    Inheritance
--]]

do -- making a sub class.
    _ENV = {g = _G} -- clear environment and move everything to g incase
    -- No real reason only that I want to emphasize that this example is only
    -- inside here.

    Account = {balance = 0}

    function Account:new( object )
        object = object or {}
        g.setmetatable(object, metatable)
        self.__index = self

        return object
    end

    function Account:deposit( v )
        self.balance = self.balance + v
    end

    function Account:withdraw( v )
        if self.balance < v then
            g.print("Well, you can just go and take money you don't have!")
            g.error("Put money you jerk off. Insuffecient funds!")
        else
            self.balance = self.balance - v
        end
    end

    -- a child of the parent class Account
    SpecialAccount = Account:new()

    test = SpecialAccount:new{limit = 1000.00}

    test:deposit(100.00) -- uses the inherted method from Account. :)

    -- redefined for special Account
    function SpecialAccount:withdraw(v)
        if v - self.balance >= self:getlimt() then
            g.print("Not enough money")
        else
            self.balance = self.balance - v
        end
    end

    -- a new method defined for the child class SpecialAccount. :)
    function SpecialAccount:getlimit(  )
        return self.limit or 0
    end

end

--[[
    Multiple Inheritance: uses a different form from inheritance shown above.

    Still, this form allows multiple inheritance!
--]]


do -- multiple inheritance
    local new_env = {}
    setmetatable(new_env, {__index = _G})
    _ENV = new_env
    -- again, no real reason for holding the _ENV to this scope, but practice.

    local search = function(k, plist)
        for i=1,#plist do
            local v = plist[i][k] -- checks for the parent class (superclass)
            if v then return v end
        end
    end

    function createClass( ... )
        local c = {} -- the new class
        local parents = {...} -- the superclasses

        -- looks for a method in all of the parents
        setmetatable(c, {__index = function(t,k) -- note how this is a closure!
            return search(k, parents)
        end})

        c.__index = c

        function c:new( object )
            object = object or {}

            setmetatable(object, c)

            return object
        end

        return c -- returns the new class
    end
end
