#!/usr/bin/lua
-- Formating strings and numbers with string.format pg 102-109




--formatting strings and numbers

--[[ string.format 
1) can pad strings with spaces and pad numbers with spaces or 0s
2) output numbers in hexadecimal or octal
3) trim extra characters from a string
4) left,right-justify output with columns
--]]


--Formatted output. Done this in c++ and perl as well using placeholders


-- %s = spaces from direction. If negative is spaces from left. If positive it is spaces from right. 
--example of Formating

print(string.format("-->%15s<--","arundelo")) -- prints -->       arundelo<--
print(string.format("-->%-15s<--","arundelo")) --prints -->arundelo       <--

-- %d = does the same thing as %s, but for numbers.
print(string.format("%15d", 1231)) --prints -->           1231

print(string.format("%-15s %6d %6d", "arundelo", 14, 10))

print(string.format("I have no pussy to %d%%!", 100)) -- gives 100 as 100%

function report( users )
	for username, person in pairs(users) do
		print(string.format("%-15s %6d %6d",
			username, person.np, person.r))
	end
end


report({ -- same as report = {}, just using a direct initializer
	arundelo= {np=39, r=19},
	kwj= {np= 22, r=81},
	leet= {np= 5325, r=0}
	})



-- placeholders are good whent you want to make the code easier for replacements.

anchor= string.format("<a href='%s'>%s</a>", link, linktexto) --replaces each one with the variable.

-- use %f for fractions since %d works only for int
print(string.format("I want %f women!", 3.1459)) --will print the decimal differences.

-- use %q for qoute. 

print(string.format("%q","this will have qoutes when printed due to \%q" ))