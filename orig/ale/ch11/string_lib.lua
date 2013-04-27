#!/usr/bin/lua
--string lib

--pattern-based string functions

string.find(string, pattern, start, flag) -- looks for a pattern in the string. Can say where to start
string.gmatch(string, pattern) -- matches any that fall with the pattern. g, stands for group
string.gsub(string, pattern, replacement) -- it's a match and replacement
string.match(string, pattern, position) -- matches only the first instance of the pattern.


--string-converstion functions
string.byte(string, start, ending) -- returns the characters in the string, defined by the range of start, ending, in bytecode
string.char(bytcode) -- returns characters for the bytecode
string.dump(functions) -- returns copy of the function converted to binary.
string.format(format, value) -- returns value formatted by format

string.len(string) -- length of the string in bytes.
string.lower(string) -- converts string to lowercase 
string.rep(string, repeats) -- repeats the string  by the repeats amount of time
string.reverse(string) -- flips characters in reverse
string.sub(string, start, ending) -- returns the position of the specified range in the string.
string.upper(string) -- converst to uppercase
