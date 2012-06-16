--
-- Example: from ch2
-- Made by: Alejandro Baez
-- Email: alejan.baez@gmail.com
-- Date: 6/3/12
-- Time: 4:46 AM
--

print ("hello")

-- lua understands when you put something in scientific notation! 1e10 = 10 million!!

-- Comments in lua follow a -- instead of // or #
print (0x10c) --lua understands hexadecimal!
-- =0x10c --same as writing line 14 in the interpreter

os.exit() -- Pulls in an exit command

bob=2 -- Can define variables with just the value and then just simple writing the variable
num=bob
vector

summation, prod, exp = 10 +10, 10*10, 10^10 --Here we can assign multi variables by just using comma. VERY useful!

print(summation,prod)   -- prints both the summation and prob inputs

name, phone= "alelilo", "111-111-1111" -- make two strings. NOTE: double and single qoute works EXACTLy the same. so no difference!

one='one form of quote'
two="another form of quote"
three=[[another form of qoute]]  --acceptable other form for quotes in lua. NOTE: \ has no meaning in square brackets!

-- one=two when it comes to \ usage! Also three is equal to regular ''

print (4 < 5) -- true value. > or < can give true or false, boolean


-- ~= same as !=

-- unintiliazed values are nil

-- and, or, not = the boolean logic operators as the same in perl

-- not is unary meaning it can only be one value.
print (not false) -- this would be true.





