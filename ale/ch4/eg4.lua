#!/usr/bin/lua
-- pg 157-172


--Table library

----------------------------------------------------------
--table.sort - only works with arrays!
--table.sort uses callbacks. a function that is writtent to be called by a library function.
name= {"you","me","irene","catherine","jessia","beryl","jennifer","neut"}

table.sort( name ) --sorts the table for your
for i,v in ipairs(name) do --not that since using the table.sort in line9, the order will be sorted :)
	print(i,v) --will print the key and then the value of that key.
end

--Example using table.sort

ni={Ale= "Coder", Jairo="Designer", Jerry="tester"}

sorted= {}

----------------------------------------------------------
--table.insert --an easy to copy a table to another table or adding elements to an array.!
table.insert(table, (newkey =oldkey, newvalue =oldvalue)) -- format for insert.

for names,instrument in pairs(ni) do
	table.insert(sorted, (names= namo, instrument= instro)) --simply inserting the files to sorted,
end

table.sort( sorted, 
	function(a,b)	--Using the table.sort to have the table be sorted by the anon function given here.
	--a and b are actually the keys being compared NOT the values.
	--this technique is also known as a callback. Using the function to call the library function to sorted
		return a.name < b.name;
	end) --Note, the function is inside of this setup. Use this form for simple understanding.

----------------------------------------------------------
--table.concat --does what it implies. Takes an array and concates to one string.
table.concat(tablename, ", ") --the format when NOT using range
table.concat( tablename, ", ", start_index, end_index ) --the format of table.concat when using range


test1= {"a", "b", "c"}

print(table.concat( test1)) --concates the array test1 to abc
print(table.concat( test1, ", ")) --concates to a, b, c

function coms( arry )
	return table.concat( arry, ",\t")
end

print(coms(test1)) --does the same thing as line 42, but does it with a function. No real reason to do this.

test2= {} -- need to initiliaze firs the array to do this type of thing :)
for i=1,10 do
	test2[i] = i ^3;
end

print(table.concat( tset2, ", ", 4, 9 )) -- will only concate the elements of 4-9.

----------------------------------------------------------
--table.remove --removes elements of an array.
test3= {}

table.insert(test3, "a")
table.insert(test3, "b")
table.insert(test3, "c")

print(table.remove(test3)) --removes the last element in the array.

test4= {"a", "b", "c"}
table.insert(test4, 2, "magic") --test4 has now: a, magic, b, c. The 2 signifies the position.

print(table.remove(test4, 2)) --removes the 2nd element in the array.

----------------------------------------------------------
--table.maxn - checks the size of a table/key the key-value pairs and returns the highest positive number in a key.

test5={"a","b","c","d"}
print(table.maxn(test5)) --prints 4, since it's the last element. 

test6={}
print(table.maxn(test6)) --prints 0, since it's the last element!


