--ch-chapter 2
--ex- pg55 - pg66
--by-Jairo Rosario

--no brackets in lua loops, Amazing but weird
red, blue = "banana", "monkey"
if red < blue then
	print(blue .. red)
else
	print(red .. blue)
end -- ends the loop and returns monkeybanana
--------------------------------------------------------------
red, blue = "monkey", "banana"
if red > blue then
	red, blue = blue, red 
end
print(red .. blue) --prints out bananamonkey
---------------------------------------------------------------
if red == blue then
	blue = ""
else
	if red > blue then --else if statement 
		red, blue = blue, red 
	end ---- note closes the loop
end -------- note closes the other loop
print(red .. blue) 
---------------------------------------------------------------
if A == 1 then
	print ("A is one")
elseif A == 2 then
print("A is two")
elseif A == 3 then
print("A is three")
else
	print("A is neither one nor two nor three") -- This prints
end
-------------------------------------------------------------------
--while loops
--[[while an expression do
	more statements
end ]]

count = 1
while count <= 10 do
	print(count)
	count = count + 1
end
-----------------------------------
a, b = 1, 1
while b < 100 do
print(a .. "! is " .. b) -- prints out 4! is 24, because 24 * 5 = 120
a = a + 1
b = b * a 
end  
---------------------------------------------------------------------
--for loops
for count = 1, 12 do --this is some wild shit
	print(count)
end 
--the way it works
--[[ for variable = start number, end number, do
		statements
		end]]
for a = 1, 3 do
	for b = 1, 3 do
		print("a: " .. a .. "; b:" .. b)
end
end
---------------------------------------------------------------------
--for repeat loops 
a = 1
repeat 
	print("this is ".. a)
	a = a + 1
	until a >= 10
----------------------------------------------------------------------
--break and do statements
for N = 1, 100 do
	if N > 10 then
		break  -- breaks the loop until n > 10
	end
	print(N) -- keeps on printting until it hits to 10
end 

