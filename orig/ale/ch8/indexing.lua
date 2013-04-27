#!/usr/bin/lua
--Indexing

do
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
			rawset(tab, low(k), v)
		end,

		__index= function( tab, k )
			return rawget(tab, low(k))
		end
	}

	function ignore()
		return setmetatable({}, meta)
	end
end


object= ignore() --making an object to contain table

object.abc= 1
print(object.ABC, object.Abc, object.abc) -- all the same !



