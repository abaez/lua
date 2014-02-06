#!/usr/bin/env lua

--[[
    I/O libarary:
        Simple model: uses current input and output file for IO operations.
        Complete model: uses explicit file handler.
--]]


--[[
    Simple model:

    io.read() -- uses STDIN
        *a  :: reads whole file
        *l  :: reads the next line
        *L  :: reads next line with newline
        *n  :: reads a number
        lim :: reads a string with up to lim count characters.
    io.write() -- uses STDOUT. Can redirect the output
--]]

io.write("hello ","world\n")
print("hello world") -- applies tostring argument


t = io.read("*a") -- whole file
t = string.gsub(t, ...) -- processes the whole read file and sends to t
io.write(t) -- prints t

-- example of iterating through a file line by line
local lines = {}
for line in io.lines() do
    lines[#lines + 1] = line
end
table.sort(lines)
for _, v in ipairs(lines) do
    io.write(v, "\n")
end

--[[
    Complete model: uses file handle.
    io.open(file, mode)
        mode - r = read, w = write,
            rb = read bytes, wb = write bytes -- these are for WINDOWS!!
    io.close()
--]]

print(io.open("no_file", "r"))
print(io.open("/etc/passd", "w"))

-- use this format for opening files.
local f = assert(io.open(filename, mode))

local t = f:read("*a") -- reads the whole file
f:close() -- closes the filehandle


-- example mixing complete and simple model
local tmp = io.input()
io.input("newinput_file") -- opens a new current file
io.input:close() -- close the newinput_file
io.input(tmp) -- opens the original input file.

-- opens with buffer size is 8K
for block in io.lines(filename, 2^13) do
    io.write(block)
end

---[[ performance in reading files. read by buffer size
local BUFSIZE = 2^13
local f = io.input(arg[1])
local cc, lc, wc = 0, 0 ,0 -- char, line, word count
for lines,rest in io.lines(arg[1], BUFSIZE, "*L" ) do
    if rest then
        lines = lines .. rest
    end
    cc = cc + #lines
    -- count words in the chunk
    local _,t = string.gsub(lines, "%S+", "")
    wc = wc + t
    -- count newlines in the chunk
    _,t = string.gsub(lines, "\n", "\n")
    lc = lc + t
end
--]]
