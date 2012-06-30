#!/usr/bin/lua
-- Global Variable environments pg 192-197

-- _G environment -  A table that stores global variables

print(print, _G.print) -- gives the same number value

someglobalvariable= "hello world"
print(someglobalvariable, _G.someglobalvariable) --prints the same thing!

print(_G, _G._G._G) -- prints a table 

abcd= "test 1"
print(_G["ab".."cd"]) -- prints test1, since abcd is a key for that value in the table. 


for k,v in pairs(_G) do
	print(k,":\t",v) --prints all the variables in global.
end

-- setfenv - set function environment. Can be used to give any function an enivornment.
-- sanboxing - using setfenv can be useful when you trying to limit the global variables the user is able to use.
function greet( person )
	print("hello, "..person..".")
end

test2= {function print(str)	--making a different value for print.
			print("<<<"..str..">>>")
		end}

setfenv(greet, {print= print}) -- makes the function greet into an environment like _G
greet("alex")

setfenv(greet,test2) -- uses line 26 for the print. 


-- getfenv - get function environment. which function environement is supplied for that function.
pe, ge = getfenv(print), getfenv(greet)
print (pe, ge) -- shows you the different environment for the two functions
