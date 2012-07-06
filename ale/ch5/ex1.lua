#!/urs/bin/lua
--Exercises from ch5

string= "give me some values"

--Question 1
function char( stringo )
	local something= {}
	for i,v in ipairs(stringo) do
			something[i] = string.sub(stringo, i, i) -- selecting each sub string and giving it it's own subelement
		end	
	return something
end

--Question 2
for i,v in ipairs({"Lynn", "Jeremy", "Sally"}) do
	local frmt= "%6s\n"
	io.write(string.format(frmt, v))
end

--Question 3
function dictcmp( one, two )
	local check1= string.lower(string.gsub(one, "%W+", ""))
	local check2= string.lower(string.gsub(two, "%W+", ""))
	if check1 ~= check2 then
		return check1 < check2
	else
		return one < two
	end
end

names= {"Defoe", "Deforest", "Degas", "de Forest"}
table.sort( names, dictcmp )


--Question 4
function aleprompt( ... )
	io.write("give me something>\t")
	local   line= io.read()
	while line and line ~= "quit" do
		line = "return ".. line
		local test= loadstring(line)
		print(test())
		io.write("give me something>\t")
		line = io.read()
	end
end