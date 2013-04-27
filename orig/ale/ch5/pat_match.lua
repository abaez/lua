#!/usr/bin/lua
-- Pattern matching pg 215-222

--subject - a string being searched
--pattern - a substring being searched for.
--match - when the substring is found.

--Searching for specific strings

s1= "the train in Spain stays mainly in the plain."
print(string.gsub(s1, "ai", "oy"))  --replaces all the ai with oy!


--string.gsub search - gsub = global substitute.
string.gsub(string, "find this", "replace with this") -- the pattern for string.gsub
--note: if no matches, string.gsub returns 0 for 0  mathes.

string.gsub(s1, "ai", "oy", 2) -- will only change up to 2 or match only up to 2 times

--Example with credit card number matching.

function ccvalidate( cc )
	cc = string.gsub(cc, "[/,.-]", "") --replace any of the characters in the [] with a delete.
	return string.find(cc, "^%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d$") --making sure that cc is only digits
end

-- [] - matches anything in the bracket. 
-- can use the the range for []. So [A-Z] works.
-- also follows the [^] setup, which if you remember, matches anything that is NOT included in the brackets
-- %d - matches any number for one character

n1= "this has 132 in it"
print(string.gsub(n1, "%d", "digit")) -- replaces 1 with digit
print(string.gsub(n1, "%d%d", "hola")) -- relaces 13 with holahola. You get the idea

-- ^ - matches with something in the beginning
-- $ - matches with something only in the end.

-- string.find() - matches and returns the position of the first and last match.