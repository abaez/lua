#!/usr/bin/env lua

--- closure iterator for fromto.
-- Iterates in range of values given.
-- @func fromto
-- @param m the start of the fromto iterator.
-- @param n the end of the fromto iterator.
-- @return gives increments each time the closure is called.
fromto = function(m,n)
    -- using m -1, due to the first increment in the closure return; line15.
    local o = m - 1

    return function()
        if o < n then
            o = o + 1
            return o
        end
    end
end


--- stateless generator(iterator) for fromto.
-- Note how invariant is fixed and doesn't change. Only the control changes!
-- @func stateless
-- @param invariant is the variable that must stay the same through generator.
-- @param control is the variable that changes with interaction.
-- @return must be returned with control first for the generator to work.
function stateless(invariant, control)
    control = control + 1
    if invariant >= control then
        return control, invariant
    end
end


--- the factory function of the stateless generator.
-- Note: without this fn, stateless would not keep any state call.
function fromto( m,n )
    return stateless, n, m - 1
end