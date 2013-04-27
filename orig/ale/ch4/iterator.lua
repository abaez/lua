#!/usr/bin/lua
-- Building other data structures from tables

--tree structured tables
tree= {person= {
	Living= {"Roberto Ierusalimschy", "Gary Larson"},
	Dead= {"Jane Austen", "Archimedes"}},
place= {"Rio De Janeiro", "North Pole"}}

--------------------------------------------------------------
--Table as a ring.
do	--making a do so it only encompasses this piece

local function base1( x,y )
	return (x -1) % (y +1) --using modulo for the good ol' base of value.
end

local methods= {} --making the table for methods so that it can be used in oop style.


function methods:push( element ) --inserts new elements into self. Making a push command :)
	table.insert(self, self.pos, elem)
end

function methods:pop()
	local ret
	if #self >0 then	--makes sure self is greater 0. 
		ret= table.remove(self, self.pos)	--removes self.pos and self when the size is bigger than 0
		if self.pos >#self then --if self.pos is bigger than self
			self.pos= 1 --make self.pos = 1
		end
	end
	return ret
end

function methods:rotl( ) --rotates self to the left
	if #self >0 then
		self.pos= base1(self.pos +1, #self)
	end
end

function methods:rotr( ) --rotates self to the right
	if #self >0 then
		self.pos= base1(self.pos -1, #self)
	end
end

function methods:size(  ) --gives the size of the table.
	return #self
end

end


-----------------------------------------------------------------
--making your own loops!


--iterator factory -- like ipairs, but in reverse
function rip( arry ) --rip = reverse ipair
	local size= #arry --size of the array
	local function iterator() --making the iterator function
		--returns the next element or elements from the thing you are looping through.
		local ret1, ret2
		if size >0 then --if there is atleast 1 element, then:
			ret1, ret2 = size, arry[size];	--ret1= size, and ret2= array[size] or last element.
			size= size -1; --deduct the size by one for the next run.
		end
		return ret1, ret2
	end

	return iterator
end

test= {"one", "two", "three"}
for i,v in rip( test ) do
	print(i,v)
end


--using a stateless iterator - depends on for to keep track of the current state of the iterator
--stateless iterator is better to use because it can be written for anything you want to loop through.
do
	local function iterator(arry,i )
		if i >1 then
			i= i -1
			return i, arry[i]
		end
	end


	function rip( arry )
		return iterator, arry, #arry +1
	end

	for i,v in rip(test) do
		print(i,v)
	end
end

-----------------------------------------------------------------
-- next builtin function -- a built-in stateless iterator

print(next(test, "two")) --print the next, so three.


-----------------------------------------------------------------
-- ipair iterator function - Use this format of making a stateless iterator
function ii( arry, i ) --ii = ipair iterator
	local ele= i +1;
	local val= arry[ele]

	if val ~= nil then
		return ele, val
	end
end


--iterator that returns all values.
function seq( arry, len )
	local pos= 0

	return function( )
		pos= pos +1;
		if pos +len -1 <= #arry then
			return unpack(arry, pos, pos +len -1)
		end
	end
end