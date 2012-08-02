#!/usr/bin/lua
-- calendar stuff example with using CGI on apache server.

local container= {}

container.handle= [[ Content-Type: text/html

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
	<title>Calendar</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="/css/general.css" type="text/css" />

	<style type="text/css">

	table.data td{border-right: 1px solid; border-bottom: 1px solid;
		border-color:inherit; color:#404040; background-color:#FFFFF; 
		vertical-align:top; width:14%;}

	table.data td.today {background-color:#f0f0ff;}

	table.data td.name {font-weight:bold; text-align:center; color:#505060; background-color:#f0f0ff;}

	table.data td.edge {width:15%;}

	</style>
</head>
<body>	
]]

container.fin_string= "</body>\n\n</html>"

local day_month= {31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

local function  calendar( yr, mon)
	assert(yr >1900 and year <2100, "Year is not in the range that i can do shit" )
	assert(mon >=1 and mon <=12, "There is no fucken".. mon " month. -_-")

	local rec= os.date("*t", os.time{year= yr, month= mon, day= 1})
	local mday = day_month[rec.month]

	if mday == 0 then
		mday = math.mod(rec.year, 4) == 0 and 29 or 28;
	end
	return rec.wday, mday
end

local today= os.date("*t")
local dow, mday= calendar(today.year, today.month)

io.write(container.handle)