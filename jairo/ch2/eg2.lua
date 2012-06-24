
--ch-chapter 2
--ex- pg45 - 55
--by-Jairo Rosario

------------------------------------------------------------------
--String Concatenation Operator

print("app" .. "le") --This will return "apple"
print("f" .. "u" .. "c" .."k") -- This will return "fuck"

bitch = "nice girl"
print ("Hey girl are you a " .. bitch .. ".") --prints out |
--"Hey girl are you a nice girl."<<<------------------------


------------------------------------------------------------------
--The Length Operator #

print(#"") -- The # operator measures a string, this one is 0
print(#" ") -- Lua will return 1, note it counted the space
print(#"banana") -- Here lua returns 6
print(#"\n") -- Lua returns 1

--Note if you are using UTF-8 lua sees 4 characters as 5
print(#"na_t") -- Example, lua will see the "_" as two characters 

box1 = "banana apple berry"
print (#box1) -- Here it's 16 + the two spaces. Lua will return 18


--------------------------------------------------------------------
--The Modulo Operator
--Using % to model a clock 

hour = 3 -- it's 3
hour = hour + 2  -- now lets add 4 more hours
hour = hour % 12
print (hour) -- returns 5

hour = hour + 144
hour = hour % 12
print(hour) -- returns 5 again 

hour = hour - 149
hour = hour % 12
print(hour) -- now it's 0 


---------------------------------------------------------------------
--precedence and associativity 
print(10 * 10 + 5) --returns 105
print((10 + 5) * 10) -- do this if you want to add first and then mult
print(10 * (10 + 5)) -- same thing adds first and then times it by 10

----------------------------------------------------------------------
--side note; Can't use arithmetics on strings
f,u,c,k = 10,20,30,40
print(f - u == c - k) -- returns as false 
--variables and values assignment 
pillA, pillB, num = "sugar", "salt", 321 --pillA becomes sugar and so on

----------------------------------------------------------------------
--[[This is
    a comment
    like yeah]]

print(2 + --[[2 + 100 + 10000]] 2) -- comment inception


