#!/usr/bin/env lua

---[[ 5.1
    function concat( ... )
        local last = ""
        for _,v in ipairs({...}) do
            last = last .. v
        end

        return last
    end

    print(concat("chicken", "car", "house"))
--]]

---[[ 5.2
    function print_array( array )
        for _,v in ipairs(array) do
            print(v)
        end
    end
--]]

---[[ 5.3
    function give_all( ... )
        return table.unpack({...},2)
    end

    print(give_all(1,2,3,4,5,6))
--]]
