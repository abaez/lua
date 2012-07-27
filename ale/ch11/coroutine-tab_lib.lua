#!/usr/bin/lua
--Coroutine, package, string, table library

--coroutine library -- managing multiple threads in lua
--[[

coroutine.create(func) -- creates a corourint from the specified function.
coroutine.resume(coroutine, value) -- activates a coroutine.
coroutine.running() -- returns the currently running coroutine
coroutine.status(corouting) -- gives teh status of the coroutine, "running, suspended, normal, dead"
coroutine.wrap(func) -- creates a corouinte from the specified func and returns a func wrapper to it.
coroutine.yield(value) -- transfers control back to the caller of coroutine.resume.

--]]

-----------------------------------------------------------------------
--package library
--[[

package.loadlib(lib name, func) -- loads the specified library and returns a function bound to the specified c function in the library.
package.seall(namespace tab) --sets the metatable for a module namespace so that global env can be accessed.
package.preload	-- checks the table for a module before it searches for a file based module. each key is the name of a module, and value is a function is called to load the module.
package.loaded -- checks to see if module was already loaded, and does the same as above, with the before.
package.path	-- used to locat a lua module file. 
package.cpath	-- same as above but for lua_c code
--]]


--------Example
lib, err = package.loadlib("./luabogo.so", "luaopen_bogo") --package.loadlib example
if lib then
	lib("bogo")
else
	io.write(err, "\n")
end


io.output("testmod.lua")
io.write[[module(..., package.seall) --note that line39 is the end of this call.
local modstring = (...)
function hi()
	io.write("hi from ", modstring, "\n")
end]]
io.close()
io.output(io.stdout)
package.path = "?.lua"
require("testmod")
testmod.hi()


-----------------------------------------------------------------------
--table library

--[[

table.concat(array, separator, start, end) -- makes a table into single string
table.insert(array, position, value) -- inserts a value into a specified table. 
table.maxn(array) -- effectively performs a pairs loop to determine the largest positive num key.
table.remove(array, position) -- removes the element defined, or the whole array
table.sort(array, comparision function) -- sorts :)

--]]