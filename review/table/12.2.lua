#!/usr/bin/env lua


function serialize(o)
    if type(o) == "number" then
        io.write(string.format("%a", o)) -- prints in hexadecimal
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type == "table" then
        io.write("{\n\t")
        for k,v in pairs(o) do
            io.write(string.format("[%q] = ", k)
            serialize_table(v)
            io.write(",\n\t")
        end
        io.write("}\n")
    else
        error("Well this isn't a table..." .. type(o))
    end
end