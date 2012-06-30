#!/usr/bin/lua
-- Object-oriented programming with tables, pg 162-165

--objects - functions that deal with a particular type of value are themeselves part of that value
--methods - the functions of objects. 

------------------------------------------------------
--One way to do objects and methods (OOP)
--This form uses T.F= function(self.X) form.
-- T.F= function(self.x) object/methods RAW

--DONT USE THIS FORMAT!!
--using functions as objects
function mg1( n ) --makes a function that gives two values, the value, and it's increment.
	--note for a object to work, it needs a closure(inner function with an upvalue(a local value from a higher scope))
	--note: the more closures made, the slower the program would run.
	local function get() --one method for the object.
		return n; --here is the upvalue for this closure
	end
	local function inc( m ) --another method for the object.
		n = n +m; -- here is the upvalue for this closure
	end

	return (get=  get, inc= inc); -- return that uses the functions as methods. basically allow to call each of teh closures!
end

object= mg1(50) --[[here is the object, we are using the first parameter, 
which is also the first method(function) in mg. ]]


print(object.get()) --here i'm calling the 1st method in the object. So using object.get()
print(object[get()]) --same as line22

object.inc(2) --increments the object, by using the function (methods) to do so.
print(object.get()) --prints 52

--using methods apart of their respective objects.
object2=mg1(50)
inc, get = object2.inc, object2.get; -- using the methods apart of the object.
inc(2); print(get()) -- prints 52 like line28!



------------------------------------------------------
--The better method to use the methods of an object (OOP)
--This form uses function T.F(self,x), which is the same as T.F= function(self.X) form.
-- function T.F(self,x) object/methods


-- Using tables to store objects!
function get( obj )
	return obj.one --Returns obj.n
end

function inc( obj, two )
	obj.one = obj.one + two; -- increments obj.one by the arguement two
end

function mg2( one ) --THIS IS THE OBJECT!!!!!!!!!!
	return (one = one)
end

print(inc(mg2, 5)--to call the method, you would use inc(something,5).
--the problem with this object form is that you need to pay attention with what method goes where.


------------------------------------------------------
--Even better method to use the methods of an object (OOP)
-- This form uses the function T:F(x) form. This is similar to function T.F(self,x), which is the same as T.F= function(self.X) form.
-- function T:F(x) object/methods


do	--empty block!
	local function get( obj )
		return obj.one
	end 

	local function inc( obj, two )
		obj.one = obj.one + two;
	end

	function mg3( one ) --The object of masters!
		return { one = one, get = get, inc = inc}
	end
end

a= mg3(50)
a:get() -- returns 50
a.inc(2)
print(a:get())  --how to call the methods of the object.


------------------------------------------------------
--Yes, this is just getting ridiculous. Another method which can use ALL forms (OOP)
-- function T:F(x) -- function T.F(self,x) -- T.F= function(self.x)  object/methods

do	--empty block!
	local T= {}

	function T:get() -- returns self.n
		return self.n
	end

	function T:inc( m )
		self.n = self.n + m; --increments self.n by m arguement. 
	end

	function mg4( n ) --the super of all objects!
		return {n = n, get= T.get, inc= T.inc}
	end
end

