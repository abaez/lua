#!/usr/bin/lua

--Require function- high-level function that imprlements modules conventions

-- To define the path for the modules, just use line 6
-- export LUA_PATH="?.luac;?.lua"

require("show") --will call the module called show inside the $LUA_PATH. In this case, it's in this directory.

ObjectShow("my table", {a=1}) --calls the function inside the module show

-------------------------------------------------------------------------------
--Namespaces

require("util") --pulling in the Namespace that was made in util.lua
print(qoute("Natty *pathfinder"))

print(util.qoute("Doing another test")) --using the namespace table util for the qoute

utility = require("util") -- to call the namespace with a different namespace

print(utility.qoute("same as line18"))


require "strict" -- pulling the strict module from std library
-- strict - makes the declaring of variables in the main level and not nested in a function.

