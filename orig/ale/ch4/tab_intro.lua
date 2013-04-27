#!/usr/bin/lua
-- Working with tables (container/data structure of lua) for pg 146-150


-- Table - a key-value pair of listings. Exactly like hashes of perl!
-- note, a key can be any type, including functions and variables. Reall nice :)

table= { ["key"] = "value", ["Another key"] = "anohter value"} -- example of table
table1= {["Alejandro"] = "programmer", 
					["Jairo"] = "designer", ["jerry"] = "beta tester"} --think hashes!

table2= { Alejandro = "programmer", Jairo = "designer", jerry = "beta tester"} -- same as line 9
--note when using line12 format, make sure that your key are correct assignment like no spaces, etc. Other wise use the std format
print(table1["Alejandro"] --will print out the value of the key :)
print(table1.Alejandro) -- same as line 14! Note, can only use as long as the key is a field.

a= "Jairo"
print(table1[a]) -- will be the same as using the key literal string "Jairo"!

test= {[print] = "The print function", ["print"] = print, [123.12] = 321.21}

print(test[print]) -- the print function.
print(test["print"]) -- print defines as a fype and says the value is a function.
print([123.12]) -- prints 321.21

-- note** key can have multiple values, but a value cannot use the same key. Again, perl!


-- Table inception. Same as multidimensional arrays from c++
tb11= {tb12 = {bool = true}} -- simple, it's a table IN a table :)

-- Call magic!
print(tb11.tb12.bool) -- works fine, since it's calling the key and value correctly.
print(tab11["tb12"].bool) --same as line 33
print(tab11.tb12["bool"]) --same as line 33
print(tab11["tb12"]["bool"]) --same as line 33

--Altering a table's content. Basically manipulating the values of the keys.
lucky= {john="chips",jane="lemonade",jolene="egg salad"}

lucky.jolene = "fruit salad" --changed the value to "fruit salad" instead of "egg salad"
lucky.jerry = "fagaso food" -- adding a new key-value pair to the container lucky.
lucky.john = nil -- remove john from giving anything or from being a key.

sqr= {} -- make a container called sqr

for i=1,5 do -- remember this is simply just addition to the amount we want.
	sqr[i] = i ^2; -- here we are defining that i will be the key and the exponent of i by 2 will be the value.
end

for a=1,5 do -- here is a simple print of the sqr values given in the last loop.
	print(a.." squared is:\t"..sqr[a]) --notice i'm using a different arguement for loop. However, it doesn't matter since it's the same key.
	-- Also, I could use the same arguement since for loops arguements only exist inside the for loop scope.
end