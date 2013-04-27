#!/usr/bin/lua
-- cURL gd

--cURL -- useful for moving files around the internet using http, https, ftp, and ftps.

require "luacurl"
require "show"	--pull from ch7 module that was made.

local filestring = "test"
local sitestring = "http://www.lua.org"

local function lwrite( fhand, buf_string )	 --give output size
	fhand:write(buf_string)
	return string.len(buf_string)
end

local function lprogress( user_prm, dtot, dnow, utot, unow)
	print (dtot, dnow, utot, unow)
end

local hand = curl.new()

if hand then
	local fhand = io.open(filestring, "wb")
	if fhand then
		hand:setopt(curl.OPT_WRITEFUNCTION, lwrite)
		hand:setopt(curl.OPT_WRITEDATA, fhand)
		hand:setopt(curl.OPT_PROGRESSFUNCTION, lprogress)
		hand:setopt(curl.OPT_NOPROGRESS, false)
		hand:setopt(curl.OPT_BUFFERSIZE, 5000)
		hand:setopt(curl.OPT_HTTPHEADER, "Connection: Keep-Alive", "Accept-Languague: en-us")
		hand:setopt(curl.OPT_URL, sitestring)
		hand:setopt(curl.OPT_CONNECTTIMEOUT, 15)

		local r = { hand:perform() }
		ObjectShow(r, "perform")
		local ok, err, ret_code = hand:perform()

		if ok then
			io.write("Resource successfully saved as ", filestring, "\n")
		else
			io.write("Error: ", err, " (", ret_code, ")\n")
		end
		fhand:close()
	else
		io.write("Error opening ", filestring, "\n")
	end
	hand:close()
else
	io.write("Error instantiating curl object.\n")
end
