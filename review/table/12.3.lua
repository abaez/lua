#!/usr/bin/env lua


identity = {
    "and","break", "do", "else", "elseif", "end", "false", "for", "function",
    "goto", "if", "in", "local", "nil", "not", "or", "repeat", "return",
    "then", "true", "until", "while"
}

function exist(t, w)
  for _, v in ipairs(t) do
    if v == w then
      return false
    end
  end

  return true
end


function serialize(o)
    if type(o) == "number" then
        io.write(string.format("%a", o)) -- prints in hexadecimal
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type == "table" then
        io.write("{\n\t")
        for k,v in pairs(o) do
            if exist(identity, k) then
                io.write(string.format("[%q] = ", k))
            else
                io.write(string.format("%s = ", k))
            end

            serialize_table(v)
            io.write(",\n\t")
        end
        io.write("}\n")
    else
        error("Well this isn't a table..." .. type(o))
    end
end