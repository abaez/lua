#!/usr/bin/lua
-- I/O pg 209-214 

--[[ print
 converts everything to string, 
 separates multiple arguments with tabs,
 and adds a newline ]]

-- io.write -- receives string or numbers and outputs the result with no added changes.
--io.write follows the correct format of stdout, where you have to place the changes yourself.

 s1, s2 = "one", "two";
 io.write(s1, s2) -- prints: onetwo

 io.write(s1, " ", s2, "\n") -- prints: one two

function printo( ... ) --does the same thing as print in lua.
	local arguments_count= select("#",...)
	for i=1,arguments_count do
		if i >1 then
			io.write("\t")
		end
		io.write(tostring(select(i, ...)))
	end
	io.write("\n")
end

--io.read -- reads one line of input.
line= io.read() -- will read the one line of input given.

--------------------------------------------------------------------


--writting to and reading from a file using filehandlers
--[[ format
"a" -- append to file
"w" -- write  and replace file.
"r" -- reads the file
"b" -- opens in binary mode
]]
filehandler, error_message= io.open("file goes here", "format goes here")


filename, error=io.open("file", "w") --the w stands for write mode. Only writes!
print(filename, error)

filename:write("line1\nLine2\nline3\n") --writes this in the file called by the object filename
filename:close() --closes the file that was open in line 36

filename1, error = io.open("file", "r") -- r stands for read, only reads!
filename1, error = io.open("file") -- same as line 43


--[[ read() arguments. Can use multiple arguments
"*1" -- reads and returns one line
"*a" -- reads and returns the whole file.
"*n" -- reads and returns a number, or a nil.
number -- reads and returns the amounts of characters defined by the amount of number.
]]

filename1:read()  -- for each call, reads the next line in the file 'file'
fliename1:close() -- to stop the read of the file.
os.remove("file") -- to remove the file from the io module.

--------------------------------------------------------------------

io.stdin -- the std input (read only)
io.stdin:read -- the same as io.read

io.stdout -- the std out (write only). prints to screen
io.stdout:write -- the same as io.write

io.stderr -- the std error of lua

----------------------------------------------------------------------

--using 
function sorted( tab )	--making a sort function
	local sort= {}
	for k,v in pairs(tab) do
		sort[#sort +1] = k --weird way of doing it but works non the less. 
	end
	table.sort(sort) -- sorts the table in line79 which was made from line80
	local i = 0;

	return function ( ) --making an iterator
		i= i +1;
		local key = sort[i]
		return key, tab[key]
	end
end

function main( in, out )
	local line= {}
	local iterator= in and io.lines(in) or io.lines() --using io.lines to get each line inputed.
	for lino in iterator do --using the iterator on with a weird forp loop
		line[lino] = true
	end
	local someout= out and io.open(out, "w") or io.stdout -- insanely complex variable.
	for lino in sort(line) do
		out:write(lino, "\n")
	end
	out:close()
end
