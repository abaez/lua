#!/usr/bin/lua
--coroutines and program controls. Multithread coding
--klein bottle!

--[[coroutines -- allow for continous routines to run along something.
coroutines are NOT functions! 
--think coroutine as a separate program instead of a function

coroutine.create -- coroutines must be isntantiated(specially prepared), before it can be activated.
coroutine.resume -- operates on its own call stack, that of its caller.
coroutine.yield -- relinguishes contrl to its invoker. Can be resume afterwards
coroutine.wrap -- can be used to instatnitiate like *.create but instead of returning the new coroutine itself, it returns a function that resume the coroutine. 
--]]


--cooperate. Look at how each one is being called through the yield!
local function knightfunc()
	print [[knight: 
				The name of the sond is called "Haddocs Eyes."]]
	coroutine.yield() --falls back to the coroutine that called this. In this case, alice!
	print [[Kinight, looking a little vexed:
				No, You don't undesterstand, That's what the name is Called.
				The name really is "The Aged Aged man."]]
	coroutine.yield()
	print [[Kinght:
				No, You oughtn't, that's quite another thing!
				The song is called "Ways and Means," but that's only what it's called, you know!]]
end

local function alice()
	local knight = coroutine.create(knightfunc) --here we are making knightfunc into a coroutine!
	print [[Alice, trying to feel interested:
				Oh, That''s the name of the song, is it?]]
	coroutine.resume(knight)
	print [[Alice:
				Then I ought to have said "That's what the Ssong is called?"]]
	coroutine.resume(knight)
	print [[Alice, completely bewildered:
				Well, what Is the song, then?]]
	coroutine.resume(knight)
end

alice()

-----------------------------------------------------------------------------------
--[[coroutine.status -- the status of a coroutine
"suspended" -- The coroutine is resumable.
"running" -- The coroutine is currently running.
"normal" -- The coroutine has a resumed another coroutine.
"dead" -- The coroutine has a returned normally or in eror.
--]]

local a,b,c
local function status( string ) -- making the status function that gives the coroutine.status
	io.write(string.format("%-8s A is %-10s C is %-10s (%s)\n", -- using formating
		string, coroutine.status(a), coroutine.status(c), --checks the status
		tostring(coroutine.running() or "main thread"))) --gives which is running
end

function a()
	status("A")
end

function b()
	status("B")
end


--Understand what each one goes for
function c()
	status("C 1") --suspended, suspended
	coroutine.resume(a)	--here we call for a, which gives the status a
	status("C 2")	--here tells when the next instance is: suspended, running
	b() 
	status("C 3") --dead, running
	coroutine.yield()
	status("C 4")
end

a,b,c = coroutine.creat(a), coroutine.wrap(b), coroutine.create(c); 
status("main 1")
coroutine.resume(c)
status("main 2")
coroutine.resume(c)
status("main 3")


-------------------------------------------------------------------------
--Iterating with coroutines

local function rip( arry )
	local function iterator()
		for i=#arry,1, -1 do
			coroutine.yield(i, arry[i])
		end
	end
	return coroutine.wrap(iterator) --making the iterator as a coroutine
end

for i,v in rip({"one", "two", "three"}) do
	print(i,v)
end
