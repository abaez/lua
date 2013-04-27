#!/usr/bin/lua
-- Different but the same pg 173-181

--tables are mutable(can be changed)

--Table Equality -checkin to see if the the tables are the same. 

a= {}; b= a
print(a == b) -- true, checks if the tables were created by the same table constructor at the same time.

c, d = {}, {};
print(c == d) -- false, remember that it only checks for the same table constructor! read line9

function ct()
 	return {} --basically puts a table.
end 

e,f = ct(), ct();
print(e == f) -- false

g= ct()
f= g

print(f == g) -- true. You see why right? look at line8,9,21


----------------------------------------------------------------------
--Variables and mutable values

a, b = ct(), ct(); --using the function in line14 :)

c= b;
b.tru= "test"
-- b= {[tru] = "test"} -- same as line 33
print(c.tru) -- print test. The reason is that both c and b are the same table. Mutable magic!



--Tables and functions
do --mutability rule is the same
	local count= 0
	function up()
		count = count +1 --using the upvalue given in the empty block. But shows mutability!
		return count
	end
end


--example of how mutability works
do
	local string= "before"
	function funk()
		return string
	end
	tab= {string = string} --making an object out of string
	string="after" --not pulled, since no return. Obviously
end

print(funk()) --prints before
print(tab.string) -- prints before aswell. You know why.


--upvalue effect to a table field
do
	local string= "before"
	tab1= {string = string}
	tab1.string= "after"
end

print(tab1.string) -- prints after. 


--Multiple tables to share state.

do
	local tab2= {string = "before"}
	tab3= {tab2 = tab2}	--making the object
	tab4= {tab2 = tab2} --using the same state
end

tab3.tab2.string= "after"
print(tb4.tab2.string) -- prints after. You know why

------------------------------------------------------------------
--shallow copy - when you copy a table in the following form. Only copies the elements.
-- Doesn't copy subtables, but just uses the same tables.

--note: something is a table example here
function shallow( something ) --we've done this form already of copying a table. Check back.
	local dest= {}
	for k,v in pairs(something) do 
		dest[key]= val 
	end
end

-- deep copy - copies the inner tables. DON'T USE THIS FORM!
-- none of the subtables will be the same ones of the original, but complete copies.
function deep( something )
	local dest= {}
	for k,v in pairs(something) do
		k= type(k) == "table" and deep(k) or k; -- making a new key or a 'copy' of the table inside.
		v= type(v) == "table" and deep(v) or v; -- same as line100
		dest[k]= v
	end
end
