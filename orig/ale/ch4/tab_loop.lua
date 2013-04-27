#!/usr/bin/lua
-- Looping through tables and arrays. pg 153-157

--Looping through tables

print({}) --table: 0x483bc0 - similar to when a function is printed.

sqr2= {}

for i=1,5 do
	sqr2[i]= i ^2; 
end

--loop by using a size of the table
for i=1, #sqr2 do --using #sqr2 so that way the range size is the size of the table/array and not a fixed value!
	print(i.." squared is:\t"..sqr2[i]);  --simple print
end

sqr3= {}


--numeric for loop. Loops through a range of values.
for i=1,10 do
	sqr3{i}= i ^2;
end

--Generic for loop. Loops through an array and table.

--Generic ipairs loop, fori, or ipairs for loop for short. ipair= individual pair
for key, value in ipairs(table) do --this is the standard format of the generic ipair loop
	print(key,value)
end

for key=1, MONSTER in ipairs(sqr3) do --[[using the ipairs() function to call the array.
This for loop makes a temporary variable for the value, called MONSTER in this case, and key value called key here.
NOTE: the ipairs function stops the loop IF the value turns out to be nil.
--]]
	print(key.." squared is:\t"..MONSTER);
end

--Generic pairs loop, forp, or pair for loop for short.
--NOTE: do not add keys while looping with pairs. Apply those keys after the loop.
for k,v in pairs(table_name) do --works for tables
	print(k,v)
end

ni= {John= "Rhytm guitar", Paul= "Bass guitar",
				Jorge= "Lead Guitar", Ringo= "Drumkit"}

for namy,instrument in pairs(ni)) do --here we are following the forp loop since we are using a table and not an array.
	print(namy.." plays the "..instrument) --note that when printed it follows no real order schematic of what gets printed first, like in an fori.
end

--assigning without change to the table
test1= {gleep= true, glarg= false}

for fuzzy,wuzzy in pairs(test1) do --assigning fuzzy and wuzzy through the loop.
	fuzzy,wuzzy= Fuzzy.."ing", #tosring(wuzzy); --do not change the scope of the table. Basically don't really do anything.
end

--assigning with change to the table. 
test2= {"apple", "banana", "kiwi"}

for key, fruit in pairs(test2) do
	test2[key] = fruit.."s"; --changes the values with an added s in the end. Thus changing the values in general.
end

--use of loop variables as upvalues to closures

num0= {"one", "two", "three"}

num1= {}

for count, listings in ipairs(num0) do --Normal so far. Just simple fori loop
	function num1[count](string)	--for each key from num0, place that into a new function through num1 in its element.
		return listings ..":\t"..string;
	end
end

