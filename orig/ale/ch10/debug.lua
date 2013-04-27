#!/usr/bin/lua
-- Debug library (lua end)

beta = "global"

function inner()
	local beta = "inside inner, not loop"
	for beta=1,10 do
		if beta == 5 then
			debug.debug() --calling the debugging prompt
		end
		print("beta inside loop: ".. beta)
	end
end

function outer()
	local beta = "inside outer"
	inner() --calling inner
end


--debug.debug -- opens an interpreter inside the interpreter
--debug.getlocal -- can access variables even if they are out of scope.
--debug.setlocal -- similar to getlocal but assigns a value to the specified local. 
--debug.getupvalue -- same as getlocal but for upvalues, only takes a function 
--debug.setupvalue -- same as setlocal but for upvalues


--------------------------------------------------------------------

--Hooks - functions lua calls automatically while code is running. 
--			Useful to find out the speed of each piece in code
-- Look in calltrace.lua