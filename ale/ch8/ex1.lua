#!/usr/bin/lua
--Exercise 1

--Exercise 1
meta= {
	__unm = function( arry )
		local re={};
		for i= #arry,1, -1 do --need the -1 to subtract down.
			re[#re +1] = arry[i] --here we are making a proxy list that will contain the reverse.
		end

		return re
	end
}


--Exercise 2

function protect( tab )
	local tab_initial= {}
	for k,v in pairs(tab)) do
		tab_initial[k]= v
		tab[k]= nil --clear for for proxy work
	end

	local protect_meta= {
		__newindex= function() --prevents write to the table
			error("You try to write on protected by ale barrier!")
		end
		,__index= tab_initial -- allow read from original, which was made as tab_initial
		,__metatable=true --prevents metatable from being manipulated
	}
	return setmetatable(tab, protect_meta)
end