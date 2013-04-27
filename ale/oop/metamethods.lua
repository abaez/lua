#!/usr/bin/lua

-- associate a metatable with setmetatable

--[[ metatable without assigning to other tables
x = {
	value = 3
}

-- metatable containing an __add overload
mt = {
 	__add = function(a,b)
 	return { value = a.value + b.value }
	end
}

setmetatable(x, mt) -- attach the mt to our table
a = x + x -- without the metamethod __add, this is just a table

print(a.value) -- return a.value

--b = a+a -- doesn't work since b does not have a mt assigned to it
b = a+x -- this works because x has the metatable which has the overload
print(b.value)

-- using getmetatable to gain the metatable in x
c = getmetatable(x).__add  -- using .__add to get the specific metatable
--]]

--[[ recursion for allowing any table used to gain the metamethod
x = { value = 3}
mt = {
	__add = function(a,b)
		return setmetatable({value = a.value + b.value }, mt)
	end
}
setmetatable(x, mt)
a = x+x
b = a+a -- now this works
--]]


---[[ recursion strikes again
mt = {}
function String( s )
	return setmetatable({value = s or ''}, mt)
end

function mt.__add( a,b )
	return String(a.value .. b.value)
end

function mt.__mul( a,b )
	return String(string.rep(a.value, b))
end
--]]


s = String("Hello")
print(s.length) -- will return nil since length method doesn't exist

mt.__index = function(t,key)
	if key == 'length' then -- if length method is called
	 	string.len(t.value)
	 end
end

print(s.length) -- index contains the event call so length is applicable

-- make 'value' the only field in the String class with newindex

mt.__nexindex = function(t, key, value)
	error("you can only have 'value' for an object ")
end