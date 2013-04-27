#!/usr/bin/lua
--multitasking

--a word on preemptive multitasking - system threads - the os decides when control is transfered from one thread to another, based on time slices.


local function producer()
	print("Producer: Initialized")

	local list= {"mouse", "keyboard", "keyboard again", "mouse again"}
	for i,v in ipairs(list) do
		local event= string.format("event %d (%s)", i, v)
		print("Producer: "..event)
		coroutine.yield(event)
	end
	print("Producer: Finalized")
	return "end"
end

local function consumer()
	local get= coroutine.wrap(producer) --using *.wrap, so no need for *.resume and *.create
	local event
	print("Consumer: Initialized")
	while event ~= "end" do
		event= get()
		print("Consumer: "..event)
	end
	print("Consumer: Finalized")
end

consumer()


-----------------------------------------------------------------------------------

--Managing concurrent task
local function multitasking()
	for i=1,cnt do
		io.write(id)
		io.flush()
		local stop= os.time() +1
		while os.time() < stop do
		end
		coroutine.yield() 
	end
end

local function loc_cont()
	return math.random(12) >1
end

local wa= coroutine.create(function() lw("A", 2) end)
local wb= coroutine.create(function() lw("B", 4) end)

math.randomseed(os.time())
local a,b ok = true, true, true

while (a or b) and ok do
	ok= loc_cont()
	if ok and a then
		a= coroutine.resume(wa)
	end
	ok= loc_cont()
	if ok and b then
		b= coroutine.resume(wb)
	end
end

