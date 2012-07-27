#!/usr/bin/lua
-- I/O , OS, debug library


--I/O library
io.close(file)	-- close the file handle file.
io.flush() 		-- commits the default output buffer
io.input(file)	-- returns the default input file handle for the file.
io.lines(file)	-- returns an iterator for use in a generic for loop. each line is read in the loop, then closed the filehandle

io.open(file, mode) -- opens the file as a handle
--[[ mode types of line10
"r"		-- opens existing file for reading
"w"		-- overwrites existing file for writing
"a"		-- appends on an existing file, or creates a new file
"r+"	-- opens an existing file for reading AND writing
"w+"	-- overwrites an exsiting file for reading AND writing
"a+"	-- appends on an existing file and reads. 

--]]

io.output(file)	-- retursn the default output file handle for that file or creates a new handle for it.
io.read( --[[ reads of file.]]) -- returns the next line from the default input file if no argument is specified.
--[[ reads of file of line23

"*n"	-- reads and returns a number
"*a"	-- reads the complete remainder of file
"*l"	-- reads the next line, and removes the EOF marker
number 	-- read the specified number of bytes
--]]

io.tmpfile()	-- opens temp file for reading and writing and retuns a handle to it. Once prog ends, the file is deleted.
io.type(file)	-- retunrs if file is open, closed, or nil.
io.write(number --[[ or strings ]])	-- writes each of its argument to default output, and returns true if suscessful.
io.popen(shell, mode)	-- launches the specified shell command and returns a handle.

-- methods after a file handle present
file_handle:close() -- closes the file handle
file_handle:flush()
file_handle:lines()
file_handle:read()
file_handle:seek(--[[set, cur, offset]]) -- sets the file pointer in the specified file and returns the new position measured from the beginning of file.
file_handle:setvbuf(type,size) --confgiures the buffering the file.
--[[type of line43
"no"	-- writes are commited w/o buffering.
"full"	-- writes are commited only when buffer is full.
"line"	-- writes are commited when a /n is encountered, when flushed, or when input is detected.
]]

file_handle:write(string) -- writes each argument to file.

