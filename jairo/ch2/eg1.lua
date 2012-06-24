--ch-chapter 2
--by-Jairo Rosario


print ("Hey girl")

-- scientific notation can be done in lua, 1e2 = 100
-- 1e2 can also be written in lua as, = 1e2
-- hexadecimals notation can be done in lua, 0x10f

 print(0x10f) -- same thing as typing = 0x10f

 os.exit() -- exits you out of lua



-- Note lua is case-sensitive, SUM and suM are different



red = 2 -- makes a variable 
blue = 8 + 1
print (red + blue) -- like saying 2 + 8 + 1 equals 11

add, multiply, exp = 1 + 1, 2 * 2, 10 ^ 10 -- multi var
-- So if I would print (add), it will give me only 2
print(add, multiply) -- And so on this will print 2 and 4
-- this can also be done with strings
ana, banana, panana = "rock", "paper", "scissors" 

--to print a string simply do a print("This is a banana")
print("This is a banana.")
print('This is a banana.') -- Single quote works
print([[This is a banana.]]) -- Double brackets works too
print([[This is a \]]) -- in [[\]] has no special meaning
print('This ain\'t a banana') -- try doing that with [[]]   xD
print("I'm \
	A BANANA!") -- This will make a new line as well as \n

----------------------------------------------------------
--Boolean
print(1 < 5) -- lua will return, "true"
print(5 < 1) -- lua will return, "false"
print(not true) --lua will return "false"
print(not false) -- lua will return "true"
-- ~= same as !=
-- strings can also be compared
print ("a" < "b")
----------------------------------------------------------
--nil
--uninitialiazed values are called nil
print(lalalala) --lua will return nil

