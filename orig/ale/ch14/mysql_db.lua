#!/usr/bin/lua
-- luasql-mysql

require("luasql.mysql")

function exec_sql_list( connection, list)
	local success, err
	for i,sql_string in ipairs(list) do
		success, err = connection:execute(sql_string)
		if not success then
			break; -- break the function if success does not happen
		end
	end
	return success, err
end

local function show_field( string, width, number )
	local pad= string.rep(" ", width - string.len(string))
end

