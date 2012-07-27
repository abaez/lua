#!/usr/bin/lua
-- Community lib

-- best to use dynamic linked (shared) libraries in lua, even if it's just a tad more complicated. 


--[[building libraries on unix

LUA_DIR		-- the location where the lua modules are placed
LUA_PATH	-- files places like so: ?.lua; $LUA_DIR/?.lua 
LUA_CPATH	-- ?.so; $LUA_DIR/?.so

]]


---------------------------------------------
--luarocks
--[[ 
luarocks is used for the community library. Moving with the times. 
It is a module database that makes it very easy to install a new module.

if you have luarocks already installed, you can use [requre "luarocks.loader"] for all its modules ;)
]]

-- The pack binary structuring library

require("pack")

--[[ lpack functions

string.pack(format, arguments)		-- returns a binary record in lua string. and follws the format code in ch12
string.unpack(structure, format, position)	-- deconstructs a structured binary record into one or more Lua strings and numbers.

--]]
