#!/usr/bin/lua
-- Examples for the tables as arrays. pg 150-153 

--Tables as arrays

--Array or list as in perl, when the key are counted like so.
--########NOTE- arrays in lua start with the element 1 NOT 0!
mon= {[1] = "January", [2] = "February", [3] = "March", --note, need use this format for the key since they are numbers
			[4] = "April", [5] = "May", [6] = "June",
			[7] = "July", [8] = "August", [9] = "September"
			[10] = "October", [11] = "Novemeber", [12] = "December"}

print(mon[11]) -- again, using numbers, so it's best to use the square bracket format

mon2= { "January", "February", "March", "April", "May", "June", --same as line59.
				"July", "August", "September", "October", "Novemeber"}
print(mon2[11]) --give the same answer as line 64, since it's a array/list like in perl!

--Tricks for mix of table and array
arrtest= { a = "x", "one", b = "y", "two", c = "z", "three"}
print(arrtest[1],arrtest[2],arrtest[3]) --prints one, two, three. Meaning it calls the array in the a table!


--Using a function in an array.
function nothing() --a nil function.
end

function three() -- a function to return 3 variables.
	return "x", "y", "z";
end

tb13= {three(),three()}
print(tb13[1],tb13[2],tb13[3],tb13[4]) --prints x, x,y,z. The reason is that the elements are being called by order of the functions, not by the actual value in the functions.

tb14= {nothing(),three()}
print(tb14[1],tb14[2],tb14[3],tb14[4]) --prints nil,x,y,z

tb15= {three,nothing()}
print(tb15[1],tb15[2],tb15[3],tb15[4]) --prints x, nil, nil, nil. Again notice that it only prints the first value of the first function for each of these.


--Array length
test1= {}
test2= {"a"}
test3= {"a","b","c"}

     --following print gives 0, 1, 3
print(#test1,#test2,#test3) -- prints the size of the elements in each array.

test4= {"Will be erased in the following line"}
test4[1]= nil -- see why? The nil replaced the first element in the array.

test5= {"a"}
test5[2],test5[3] = "b", "c" --adding these elements into the string

print(#test4,#test5) -- prints: 0 3. The reason is that the first is nil, and the 2nd is self explanatory.


print(#{[1]= "a", [2]= "b"}) -- prints 2 for the length.

test6= {"a","b",ok= true, [0.5]= true}
print(#test6) --only shows 2 elements, since size only counts the array piece and not the table part!

--gaps in an array - basically when there is nil inside one of the elements
test7= {nil, "b", "c"} -- gap in the beginning
test8= {"a","b", nil, nil, "e"} -- gap between element 2 and 5.
test9= {"a","b","c", nil} -- no gap!, the array stops with element 3. PAY ATTENTION
--try not to have an array with a gap. This can cause the array to not function properly
--Note line120 only applies to an array, NOT a table!
