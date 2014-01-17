#!/usr/bin/env lua

--[[
    Data Files
--]]

-- self describing data
sample = {
    author = "Donald E. Knuth",
    title = "Literate Programming",
    publisher = "CSLI",
    year = 1992
}


function Entry( t )
    return t.author
end
print(Entry(sample))

--- append to a list of authors, or create the list if not present.
function entry_author( t, toappend )
    toappend = toappend or {}

    if t.author then
        toappend[t.author] = true
    end

    return toappend
end


--[[
    Serialization -- convert data into a stream of bytes or char to save.
--]]


--- example of serialization.
function serialize( o )
    if type(o) == "number" then
        io.write(string.format("%a", o)) -- prints in hexadecimal
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    else
        io.write("couldn't do it snake.\n")
    end
end

-- making a long string search
function comment( str )
    local n = - 1 -- find max length of equal signs
    for word in string.gmatch(s, "]=*]") do
        n = math.max(n, #w-2) -- using - 2 to remove the ']'
    end

    local eq = string.rep("=", n + 1) -- produce a string 'n' long string len.


    return string.format(" [%s[\n%s]%s] ", eq, s, eq)
end

-- saving tables
function serialize_table( o )
    if type == "table" then
        io.write("{\n")
        for k,v in pairs(o) do
            io.write(" ", k, " = ")
            serialize_table(v)
            io.write(",\n")
        end
        io.write("}\n")
    else
        error("Well this isn't a type i can do: ".. type(o))
    end
end