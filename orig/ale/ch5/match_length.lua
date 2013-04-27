#!/usr/bin/lua
-- Matches of varying lengths pg 222-233

--How to make two spaces into one
function squeeze( st )
	return string.gsub(st, "%s+", " ") -- converts multiple spaces to just one
end

--------------Operations for string matches ---------------------
--[[

+  \\ use of + to denote multiples of %s or more. Greedy match
*  \\ denotes for 0 or more of the character. Greedy match
%w \\ denotes for any form of word characters (characters and numbers)
-  \\ denotes to make as little of matches as possible. non greedy match
?  \\ checks if the match is there OR not.

--]]
test= {"nospaces", "Only one space", "Now  two  spaces", "Now       five"}

for i,v in ipairs(test) do
	print(squeeze(v))
end

string.find("word", "o") -- prints 2 1. 2 for the position, and 1 for the amount of o it found.

--speed up version of line5 squeeze function
function trim( st ) -- removes any extended spaces in the end of the string. 
	local i = #st; --check the size of the string first
	while i > 0 and string.find(string.sub(st, i, i), "%s") do  -- here making sure the string is larger than 0 and making sure the string has a space.
		i = i -1;
	end
	return string.sub(st, 1, i) -- here is where the change is done
end
------------------------------------------------------------------------------



--Captures -- allows one pattern to do the work of several


function order( form ) -- gets the order of what to delete according to the form size.
	form = tonumber(form)
	local delet = "th"
	assert(form > 0, "order only accepts positive numbers!") -- error check.
	assert(math.floor(form) == form, "order only accepts integers!") -- check for numbers
	if string.sub(form, -2, -2) ~= "1" then
		local last = form %10; -- modulo!!!!!
		if last == 1 then
			delet = "st"
		elseif last == 2 then
			delet = "nd"
		elseif last == 3 then
			delet = "rd"
		end
	end
	return form .. delet --obvious return
end

function date( dato )
	local yr, mon, d = string.match(dato, "^(%d%d%d%d)%-(%d%d)%-(%d%d)$") -- date format going to each variable
	mon= {"January", "February", "March", "April", "May", "June", "July",
			"August", "September", "October", "November", "December"} [tonumber(mon)]
	return mon.." "..order(d)..", "..yr;
end