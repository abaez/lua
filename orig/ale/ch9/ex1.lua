#!/usr/bin/lua
--Exercise 1-3


-- Exercise 1
local function a() -- Fibonacci Sequence
	local b,c = 0,1;
	coroutine.yield(a)	--pulled only the first time
	coroutine.yield(b)	-- pulled only the 2nd time
	while true do
		b,c = c, b +c -- 1 1
		coroutine.yield(b) --pulled until reaching each of for loop in line18!
	end
end

a=coroutine.wrap(a)

for i=1,8 do
	print(a())
end


--[[ exercise 1 ans
0
1
1
2
3
5
8
]]


-- Exercise 2
local function JoinPairs( arry1, arry2 )
	local function iterator()
		for a,b in ipairs(arry1, arry2) do	--note that i'm taking account that ipairs is function just like joinpairs ;)
			coroutine.yield(arry1[a], arry2[a])	--simple push of both values for each one starting in the same element!
		end
		-- return coroutine.yield(i, arry1[i]) -- was used to understand where to start from
	end
	return coroutine.wrap(iterator) -- here we use the coroutine wrap to *.create and *.continue the iterator
end

for k,v in JoinPairs({"Sally", "Marry", "James"}, {12, 32, 7}) do
	print(k,v)
end