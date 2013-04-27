#!/usr/bin/lua

-- property (c#) -- syntax sugar for accessor functions (getters and setters)

obj.field = 123 -- same as obj:set_field(123)
x = obj.field -- same as x = obj:get_field()

-- one form of property in Lua
-- @param class - metatable acting as the object class.
-- @param priv - table containing private data for object.
-- @param getters - table of getter functions
--                  with keys as property names. (default is nil)
-- @param setters - table of setter functions,
--                  with keys as property names. (default is nil)
-- @param is_expose_private - Boolean whether to expose <priv> through proxy.
--                  (default is nil/false)
-- @version 3 - 20060921 (D.Manura)
local function make_proxy(class, priv, getters, setters, is_expose_private)
 	setmetatable(priv, class)  -- fallback priv lookups to class
 	local fallback = is_expose_private and priv or class
 	local index = getters and
   		function(self, key)
      		-- read from getter, else from fallback
      		local func = getters[key]
      		if func then return func(self) else return fallback[key] end
    	end
    	or fallback  -- default to fast property reads through table
  	local newindex = setters and
    	function(self, key, value)
      		-- write to setter, else to proxy
      		local func = setters[key]
      		if func then func(self, value)
      		else rawset(self, key, value) end
    	end
    	or fallback  -- default to fast property writes through table
  	local proxy_mt = {         -- create metatable for proxy object
    	__newindex = newindex,
    	__index = index,
    	priv = priv
  	}
  	local self = setmetatable({}, proxy_mt)  -- create proxy object
  	return self
end