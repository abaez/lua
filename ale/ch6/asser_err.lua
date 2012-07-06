#!/usr/bin/lua
-- Using assert --tests assumptions directly

--simple stackback
local function quote( typ )
	assert(type(typ) == "string", "is not a string!") --terminates if type isn't string
	return string.format("%q", string) 
end

function reflect( a )
	return a, 1,2,3
end

print(assert(reflect(0)))
print(assert(reflect(nil))) -- won't push and give an error from assert function termination.


-- error function - to insert an error 
-- note: passing 0 to an error can superss the line number information, and 1 is default, with line number
function ans( q )
	local results
	if q == "no bananas" then
		results = "yes"
	elseif q == "everything" then
		results = 42;
	elseif q == "Tuesday" then
		results = "Belgium"
	else
		error("No answer for" .. tostring(q)) -- using error to define my own error!
	end

	return results
end

print(ans("this statement is false"))

local function func1(a,b,c)
	a,b,c = tonumber(a), tonumber(b), tonumber(c); -- using the tonumber std function for for this function function_name( ... )
	print(a and b and c and a+b+c or "three numbers were expected") --error check with or.
end


-- multi return for error checks.
local function func2( a,b,c ) -- same line 37 but with return and cleaner checks
	local sum, err
	a,b,c= tonumber(a), tonumber(b), tonumber(c);
	if a and b and c then
		sum = a+b+c
	else -- here is the check for the errors
		err= "Three numbers expects"
	end
	return sum, err -- bringing the result of both, If either case happens the return pushes the correct one!
end

--Structuring code
-- Setting up to assest certain pieces of the line being read
-- review this well. All code should be like this
local function cln(iin, out)
	local sin, sout, err, line;
	sin, err = io.open(iin, "r") -- opening the file as a read.
	if iin then 
		sout, err= io.open(out, "w") -- the write. Note that err is counted as this aswell.
		if sout then
			line= 0;
			for string in sin:lines() do
				line = line +1
				sout:write(line, " ", string, "\n") --using the io operators.
			end
			if line == 0 then
				err= iin .. ": file is empty" -- print this if no line find in input.
				line = nil;
			end
			sout:close() -- closing the output file
		end
		sin:close() -- closing the input file
	end

	return line, err -- again the double return and following both lines. 
end

