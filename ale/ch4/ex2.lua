#!/usr/bin/lua
-- Exercise 2 from section 
--[[NOTE, did not know that they just wanted a way to sort them and not create sort.table that does the sorting.
	As a result, I erased my work and simply put the answer in the back because it got TOO complicated.]]



test1= { {}, {}, "", "a", "b", "c", 1, 2, 3, -100, 1.1, 
		function() end, {}, function() end, false, false, true }



function supersort( tab )
	for i,v in ipairs(tab) do
		if ((type(v)) ~= "number") and (type(v) ~= "string") then
			v = tostring(v);
		end
	end
	return tab -- can do this since the the values will be replaced with string format.
end

for i,v in ipairs(test1) do -- simple check over what is hapeening.
	print(i,v,type(v))
end

-- supersort(test1)
--print(table.sort(supersort(test1)))
