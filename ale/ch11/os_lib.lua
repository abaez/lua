#!/usr/bin/lua
--OS library

--cpu timing
os.clock() -- returns the approximate number of cpu time measured in seconds by current program.

local count= 1e6
local tab={}
local time= os.clock()
for i=1, count do -- using the count given in line7
	table.insert(tab, i)
end

io.write("table.insert: ", os.clock() - time, " sec\n") -- how long it took for the whole loop in line10 to finish.


-- time and date functions
os.date(format,value) -- returns the current time or the spceified time either as a string or as an associative table.
--[[format from line18
"*t"	-- table returned
"!"		-- UCT format returned
]]

os.difftime(high,low) -- the difference in seconds between the two. 
os.time(table) -- returns the specified time as a scalar value. 

time_start= os.time{year= 2001, month=1, day=1, hour=0}
time_now = os.time()
io.write(os.difftime(time_now, time_start), " seconds have passed ", --gives how many seconds since 2001 has passed.
		os.date("%d %B %Y", time_start), "\n")


-- filesystem functions -- managing files
os.remove(file) -- removes the file, and returns true.
os.rename(old_file, new_file) -- renames file or directory!
os.tmpname() -- retruns a name that can be used a tmp file or directory. 

-- Others
os.execute(shell) -- the code is passed to the shell!
os.exit(integer) -- terminates the host program with integer value
os.getenv(variable) -- retrieves teh value associated with the argument in the environement of the current process.
os.setlocale() -- sets locale info for the current program.