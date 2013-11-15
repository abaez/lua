#!/usr/bin/lua



-- make a euclidean norm
function norm(n)
    return n == 0 and 1 or n * fact(n - 1)
end

function arclength(x,y)
    return math.sqrt(x^2 + y^2)
end


print("enter a number:")
print(fact(io.read("*n"))) -- showing the "*n" parameter for io.read

-- each line or file of code in lua in interactive mode is called a chunk.

-- Debugging
dofile("filename") -- load a module instantly from interactive mode.


-- how to call arguments in lua. Use the arg[*] syntax for calls
a = arg[0] or "scriptname"
b = arg[1] or "first"
c = arg[2] or "second"