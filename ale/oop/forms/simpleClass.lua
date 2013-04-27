#!/usr/bin/lua

-- Allows simple inheritance
function class( base, init )
	local c = {} -- new class instance
	-- check that init doesn't exist and base is a function
	if not init and type(base) == 'function' then
		init = base
		base = nil
	elseif type(base) == 'table' then -- same as above but with table
		for k,v in pairs(base) do
			c[k] = v
		end
		c._base = base
	end

	-- class will be a metatatable for all its objects allowing methods search.
	c.__index = c

	-- a constructor which can be called by classname(arg)
	local mt = {}
	mt.__call = function(class_tbl, ...)
		local obj = {}
		setmetatable(obj, c)
		if init then
			init(obj, ...)
		else
			if base and base.init then
				base.init(obj, ...)
			end
		end
		return obj
	end

	c.init = init
	c.is_a = function(self, klass)
		local m = getmetatable(self)
		while m do
		 	if m == klass then
		 		return true
		 	end
		 	m = m._base
		 end
		return false
	end
	setmetatable(c, mt)
	return c
end