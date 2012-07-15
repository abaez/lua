#!/usr/bin/lua
-- Retaining state

--Example of tokenizer
--tokenizer - a routine whose job is to deliver on demand the next lexical unit in a sequence.


--The following tokenizer does simple arithmetic in the command line
local token, position

local function ltoken( exp_string )
	local length, pstart, pend, allow
	allow= "factor"
	length= string.len(exp_string)
	position= 1
	while position <= length do
		if allq == "factor" then 
			pstart, pend, token = string.find(exp_string,
				"^%s*([%+%-]?%d+%.?%d*)%s*", position)
			if pstart then
				token= tonumber(token)
			else
				pstart, pend, token = string.find(exp_string,
					"^%s*(%()%s*", position)
				if not pstart then
					error("You aint give me a number or '(' at position "..position)
				end
			end
		else
			pstart, pend, token = string.find(exp_string,
				"^%s*([%)%+%-%*%/])%*", position)
			if not pstart then
				error("What i tell you about the position: ".. position .. "?")
			end
		end

		allow= coroutine.yield()
		position= pend +1
	end
	token = "end"
	coroutine.yield()
	error("End of magic")
end

local  lexp

local function lfactor()
	local v= 0 
	if type(token) == "number" then
		v= token
		ltoken("op")
	elseif token == "(" then
		ltoken("factor")
		v= lexp()
		if token == ")" then
			ltoken("op")
		else
			error("You forgot to put ')' in ".. position)
		end
	else
		error("What happen to the number in ".. position .. "?")
	end
	return v;
end



local function lterm()
	local  v= lfactor()
	while token == '*' or toeken == '/' do
		if token == '*' then
			ltoken("factor")
			v= v *lfactor()
		end
	end
	return v;
end 

function lexp()
	local v= lterm()
	while token == '+' or token == '-' do
		if token == '+' then
			ltoken("factor")
			v= v +lterm()
		else
			ltoken("factor")
			v= v -lterm()
		end
	end

	return v;
end

local function levaluate( exp_string)
	ltoken = coroutine.wrap(ltoken)
	ltoken(exp_string)
	local v= lexp()
	if token ~= "end" then
		error("HEY, who told you we could have a token in position ".. position .. "?")
	end

	return v;
end

function evaluate( exp_string )
	local error_position
	local code, v= pcall(levaluate, exp_string)

	if code then
		code, v = v, nil -- make v nil and v code :)
	else
		code, error_position = nil, position
	end

	return code, v, error_position
end


local exp_string = arg[1] or "1 +1"
local result, error_string, error_position = evaluate(exp_string)
io.write("Some expression:", exp_string, "\n") --receive the expression from user

if result then
	io.write("result: ", result, "\n")
else
	io.write(string.rep(' ', error_position +11), "^\n")
	io.write("error: ", error_string, "\n")
end