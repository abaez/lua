#!/usr/bin/lua
-- Using concatenation adn arithmetical operators on tables

-- metamethods let you use arithmetical operators with it as though it really was a number.

a,b = {}, {} 


--metatable is contained in a table! Allows the manipulation as numbers
--using setmetatable() to make a concatation program for tables

do
	local smeta -- making a concate scope
	smeta= {
		__concat= function ( a1, a2 ) --making concat a function 
		--a metamethod
			assert(type(a1) == "table" and type(a2) == "table") -- making shot both are tables
			local ret= setmetatable({}, smeta) -- makes a metatable
			for i,v in ipairs(a1) do
				ret[i] = v
			end
			
			local lengthy= #a1;
			for i,v in ipairs(a2) do
				ret[lengthy +i] = v
			end

			return ret
		end
		}
end



function makesplice( arr )
	return setmetatable(arr, smeta)	--make the previous function into one metatable
end


c,d,e,f = {"c"}, {"d"}, {"e"}, {"f"};
test= c .. d .. e .. makesplice(f) --works! Anyt other way, it doesn't. Think why!

