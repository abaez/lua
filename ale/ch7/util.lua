--Creating a name space
function quote( string )
	return string.format("%q", string)
end



--Correct format for namespace
util = util or {} --this is for each module that adds fiels to the util table
--the format assigns the local variable util to a global value of that name if it exist, or make an empty table

function util.quote( string )
	return string.format("%q", string)
end

return util

-------------------------------------------------------


--module function - allows to modulize the lua code

--local format= string.format
module(...) -- using the module function to modulize the code as in line8 setup
--  creates a global table with the name of the lua file, which in turn is how the functions are called here.

--when using module like this, you need to call locally the global environment or the specific pieces

local _G = _G -- to call the global environment
local format = string.format -- to call string.format as format
