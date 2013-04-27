#!/usr/bin/lua
--Exercise in ch4

-- Exercise 1 from ch4
a= {}
b= "c"
c= "b"
d= {
	[a] = {b = c} -- b
	,[b] = {[c] = b} -- c
	,[c] = {[a] = a} -- {}
}

print(d.c["b"]) -- prints c.


-- Exercise 3 from ch4

print("hi",{},nil)

function weird( ... )
	return tostring(...)
end

