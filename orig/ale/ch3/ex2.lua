#!/usr/bin/lua
-- Exercise 2 from ch3

function am( x,y )	--does both a sum and a product of the arguements given. 
	local add = x + y;		--note that using local to keep it inside the scope of the function.
	local multiple = x * y;
	return add, multiple;
end

--Exercise 3 from ch3
print(am(3,3),am(5,5))
-- 6 10 25

--Exercise 4 from ch3 
--prints north america. The reason is that the arguement is called continent. As a result, it is not replacing the variable 'continent'