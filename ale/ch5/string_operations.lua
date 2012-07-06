#!/usr/bin/lua
-- Examples from page 200-203  using strings


--Basic string operation for conversion function
string.lower() -- turns all to lowercase
string.upper() -- turns all to uppercase
string.reverse() -- flips everything in reverse
string.rep(s, n) -- repeates the string n amount of times. 
string.sub(s, a, b) -- returns a substring from range of a to b in string s.
string.len(s) -- returns the length of the string. Same as # 
string.byte(s, a, b) -- the string s will show the bytecode for the characters in the range given.
string.char(n) --give the bytecode and will give the character
--------------------------------------------------------


s1=string.lower("THIS WILL CHANGE TO LOWERCASE") --changes to lowercase.
s2=string.lower("doesn't matter if the string has uppercase or not")
s3=string.lower("1 2 34 5")

print(s1) -- prints the string in lowercase.
print(s2) -- all lowercase anyway, doesn't do anything but prints.
print(s3) -- again same thing. Simply prints out the good stuff.



--String are immutable. Can NOT side effect a string variable to cause a change in the variable.


--string.{lower|upper}
--To change string variables like:
s4= "JUST A TEST" 
--string.lower(s4) -- DOES NOT WORK!!!!!!!!1

s4= string.lower(s4) -- THIS WORKS! need to give the string variable its return variable. Only way a change would occur

print(s4) -- prints 'just a test'

s4= string.upper(s4)
print(s4) -- prints 'JUST A TEST'


--string.reverse()
s5= "desserts"
s5= string.reverse(s5) --reverse the string

print(s5) -- prints "stressed", since it reversed the values!

--string.rep(s,n)
s6= string.rep("Linux", 5)
print(s6) -- prints: LinuxLinuxLinuxLinuxLinux


--string.sub(s, a,b)

s7= "Going to try"


s8= string.sub(s7, 9,12)
print(s8) -- prints 'try'. The reason is that point 9-12 in s7 is try.


s9= string.sub(s7, -3,-1) --can do in reverse!
print(s9) -- prints 'try' as well. The reason is that it starts from the back with -1 the end, -3 line 3rd to last.

print(string.sub(s7, -3)) --prints try as well. The reason is that it will print all the characters to the end of the string.
print(string.sub(s7, 9)) --prints try as well.


--string.len()
print(string.len(s7)) -- will print 12. 
print(string.len("")) -- prints 0.

print(string.len("abcde")) --prints 5.
------------------------------------------------------------------


--converting between characters and character code

string.byte(s, a,b) -- the string s will show the bytecode for the characters in the range given.

s10= "ABCDEFGHKJLMNOPQRSTRVUWXYZ"
print(string.byte(s10, 1,5)) --gives the bytecode for a-e
print(string.byte(s10, 2)) --gives the bytecode for b
print(string.byte(s10, -24)) --gives the bytecode for b, since going backwards

print(string.byte("a")) --gives the bytecode for the character. In here it's a


