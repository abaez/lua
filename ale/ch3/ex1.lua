#!/usr/bin/lua
-- Exercise 1 from ch 3

function ts( input )
	local t= type(input) --defining t as type of input. and keep it local 
	local s= tostring(input) --using the tostring function to replace the arguement into a string.
	return t ..":\t"..s --return of the property and the input given. 
end

print(ts("word"),ts(true),ts(42),function() end); -- checking if it works 