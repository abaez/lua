#!/usr/bin/env lua

--[[
    String Library.

    Note: functions are called from methods of string type. This means that
    all methods can be called directly from the module (:10) or from a string
    value (:11).

    string.upper(some_string)
    some_string:upper()
--]]

--[[
    string.len(some_string) or #some_string
    string.rep(some_string, n) or some_string:rep(n) -- repeats the string by n
    string.lower(some_string) or some_string:lower() -- lowercased
--]]

-- example: sorting an array of string alphabetically
function sort_array( tab )
    table.sort( tab, function(tab, check)
        return tab:lower() < check:lower()
    end)
end

--[[
    string.sub(some_string,i,j) -- returns the i-th to j-th char in string.
    note: when using negative values, string.sub() counts backwards.
--]]

test = "billy bob"
print(string.sub(test, 2,5)) -- prints illy
print(test:sub(2,5)) -- same as :32
print(test:sub(2,-2)) -- prints illy bo

--[[
    string.char() -- the character code to character.
    string.byte() -- returns the internal character code for the i-th char.

    note: if string.byte is given one char then no need for i-th param.
--]]

print(string.char(97)) -- prints a

string.byte("a") -- prints 97
string.byte("abc", 1) -- prints 97. see :41 for info why
string.byte("abc") -- same as above
string.byte("abc", -1) -- prints 99. represents the last char, so c. :)

--[[
    string.format() -- formatting string based on ANSI C printf() formatting.
--]]

--[[

    Pattern Matching Functions. Lua does NOT use POSIX regex or Perl regex.
    Regex can take up 4k loc to implement! Lua pattern matching takes 600 loc.

    string.find()
    string.match()
    string.gsub() -- global substitution
    string.gmatch() -- global match
--]]

--[[
    string.find -- searches for a pattern and returns the index range of where
    the pattern was found.
    note: string.sub has 3rd param which can be used to tell where match happen
    in the string. Useful for multiple matches.

    string.sub -- returns the string from the i-th to j-th indices.
--]]

-- example
some_string = "hello world billy bob"

i, j = string.find(some_string, "world")
print(i,j) -- prints 7 11

print(some_string:find("world")) -- same as :74

print(some_string:sub(i,j)) -- returns world, since that is its location.


-- example of multiple matches
t = {}
local i = 0
while true do
    i = string.find(some_string, "\n", i+1)
    if i == nil then break end
    t[#t + 1] = i
end

--[[
    string.match -- returns the matching string instead of the indices.
    note: string.match can use ansi C printf string formatting to find a
    connection.
--]]

print(string.match(some_string, "billy")) -- prints billy

-- example of using string formatting
date = "Today is 2014/01/31"
d = string.match(date, "%d+/%d+/%d+")
print(d) -- prints 2014/01/31

--[[
    @param str holds the string.
    @param pattern holds the pattern to be matched.
    @param replacement holds the string to replace the pattern with.
    string.gsub(str, pattern, replacement)
--]]

s = string.gsub(some_string, "billy", "john")
print(s) -- prints hello world john bob

some_string = "live love laugh"
s = string.gsub(some_string, "l", "r") -- converts char to replacement char.
print(s)

--[[
    string.gmatch -- returns an iterator function for the pattern matches.
--]]

-- example which iterates through all the words in a string and
words = {}
for w in string.gmatch(some_string, "%a+") do
    words[#words + 1] = w
end


--[[
    Patterns

    Character classes. ANSI C printf string formats.
    NOTE: capatilization of any char class ignores that match type of match!!
    .   -- all characters
    %a  -- letters
    %c  -- control characters
    %d  -- digits
    %g  -- printable characters, excluding spaces
    %l  -- lower case
    %p  -- punctuation character
    %s  -- space sharacters
    %u  -- upper case
    %w  -- alphanumeric characters
    %x  -- hexadecimal digits

    Magic characters:
    ()  -- edit the match of the pattern. example: %(%s*%)
    .   --
    %   -- escape character
    +   -- 1 or more repetitions
    -   -- 0 or more repetitions for shortest range.
    *   -- 0 or more repetitions  for longest range.
    ?   -- occurs or doesn't once
    []  -- groups character classes together. [%w_] similar to (.+|_) in regex.
    ^   -- used for both head and ignore (inside a square bracket).
    $   -- used for tail when at end of the match pattern.
--]]

--[[
    Captures: use of copying the sections that match a pattern.
--]]

pair = "name = Jacob"
-- matches each word through the parenthesis so they can be used separately!
key, value = string.match(pair, "(%a+)%s*=%s*(%a+)")

date = "Today is 2014/02/14"
-- matches only the date and yanks them to the variables. :)
year, month, day = string.match(date, "(%d+)/(%d+)/(%d+)")

-- mathing with the same pattern for range.
some_string = [[then he said: "Don't think about it, Morty!"]]
-- note that ._ is in parenthesis to be matched. and %1 is used for only one
-- sequence of matching!
q, quotedPart = string.match(s, "([\"'])(.-)%1")

--[[
    Replacements: using functions to do replacements
--]]

function expand( s )
    -- matches with any word inside _G environment.
    return string.gsub(s, "$(%w+)", _G)
end

name = "Ale"; status = "spectacular"
-- replaces $name and $status with the variables in _G. :)
print(expand("$name is the the most $status person EVER!"))

--[[
    URL encoding.
--]]

function unescape(s)
    s = string.gsub(s, "+", " ")
    s = string.gsub(s, "%%(%x%x)", function(h)
        return string.char(tonumber(h, 16))
    end)

    return s
end


--[[
    Tab expansion
      Note: when using `()`, the pattern captures the position in the subject
      string, as a number.
--]]

function expandTab(s,tab)
  tab = tab or 8
  local correlation = 0
  s = string.gsub(s, "()\t", function(p)
    local sp = tab - (p - 1 + correlation) % tab
    correlation = correlation - 1 + sp

    return string.rep(" ", sp)
  end)

end

