--
-- Example: From pg 74 onwards ch2
-- Made by: Alejandro Baez
-- Email: alejan.baez@gmail.com 
-- Date: 6/18/12
-- Time: 1:45 AM
-- 

-- String concatenation operator
print ("App" .. "le")   -- basically, concatenate strings.
print ("Apple") -- Same as line 48

-- Length Operator
print(#"bob") -- length = 3. Uses the length operator #. Measures the size of a string and is unary
print(#"ab_d") -- length =5. The reason is that it reads by byte in C char, not actual character amount

-- Modulo Operator
-- %, helps with cycle counts. Think of it as a base number

-- Example for Modulo
-- Has the hand in the o'clock position for the hour.
hr=3
hr = hr + 2
hr = hr % 12 -- basically, what would happen if i added or subtracted the number '12' in this value
print(hr) -- 5 o'clock
hr = hr + 144
hr = hr % 12
print(hr) -- 5 o'clock
hr = hr -149
hr = hr % 12
print(hr) -- 0 o'clock

-- NOTE: CANNOT use arithmetic on strings. Follows C language very strictly!
a,b,c,d = 1000,150,500,25
print(a -b a= c -d) -- turns out false.

--[[ this
is a comment pull and untill i close
 with a bracket, it stays working as a comment! ]]

print(2+ --[[21231 +]] 2) -- prints only 4, since there is a comment IN the code. NICE!

-- if you add a -, in line 44, you will make the comment uncomment and the line of code would be read!
--[[
print("Some line")
print("bob")
--]]




