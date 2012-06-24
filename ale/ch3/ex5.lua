#!/usr/bin/lua
-- Exercise 5 from ch3

function  makedot( a )
	local dots=""	--the functions to be part of a closure, the need private state variables. So need to use local.
	for i=1,a do
		dots = dots .."."
	end
	return function( part )
		return part..dots
	end
end
