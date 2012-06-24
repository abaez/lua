#!/usr/bin/lua
--
-- Example: Examples for compound statements
-- Made by: Alejandro Baez
-- Email: alejan.baez@gmail.com 
-- Date: 6/18/12
-- Time: 12:52 PM
-- 


-- if loop in lua. Doesn't use brackets for its first set.
one,two= "hi", "you"
if one < two then -- then is how you begin a loop in lua
    print (one..two)
else
    print (two..one)
end -- this is how you end a loop in lua

if one < two then print (one..two) else print (two..one) end --same as line 12 if statement

if one == two then
    two = " "
elseif one > two then -- the nested elseif || else if || elsif, of lua statement
    one, two = two, one
end


-- NOTE: loops variables are NOT declared outside. only inside. think c++
-- While loop in lua
while expression do -- need the 'do' piece to start a lua while!
    more statements
end

-- start and death are the beginning and the end of the loop
start,death =1, 10

for count = start,death do -- for loop is used when you know the amount of times the loop will go for.
  print(count)
end

-- Repeat statement = continues to loop until the value is true! Same as until loop in perl
a = 0
repeat
     a = a +1
until a >= 10

-- break and  statements
for n = 1, 10 do
  if n> 5 then
    break --breaks the loop for the innermost loop. In this case, for loop
  end
  print(n)
end

--[[ block statements!
  do && end
  repeat && until
  then && elseif|else|end
  elseif && end
  else && end
--]]


