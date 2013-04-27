#!/usr/bin/lua

--More effecient way of making the oop

function ignore2()
	local function low( val ) --change to 
		if type(val) == "string" then --check if string to make lower
			val = string.lower(val)
		else
			print("Shit isn't a string faggot!")
			return
		end

		return val
	end

	local  meta= {
		__newindex= function( tab, k, v )
			rawset(tab, low(k), v) -- sets a table's key to a value but bypasses the table's __newindex metametho
		end,

		__index= function( tab, k )
			return rawget(tab, low(k)) --stops infinite recursion
		end
	}

	return setmetatable({}, meta)
end

object= ignore2()
object.abc= "true"

print(object.ABC, object.Abc, object.abc)