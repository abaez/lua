#!/usr/bin/lua
-- lsqlite3 -- REMEMBEr to change to luasql-sqlite3!

require "lsqlite3"

local container = {}
container.db_string = [[
	BEGIN TRANSACTION;
	DROP TABLE IF EXISTS T3;
	CREATE TABLE T3(A);
	INSERT INTO T3 VALUES (12);
	INSERT INTO T3 VALUES (27);
	INSERT INTO T3 VALUES (32);
	INSERT INTO T3 VALUES (91);
	INSERT INTO T3 VALUES (79);
	INSERT INTO T3 VALUES (66);
	INSERT INTO T3 VALUES (40);
	INSERT INTO T3 VALUES (5);
	INSERT INTO T3 VALUES (53);
	END TRANSACTION;
]]

local function lstddev()
	local sum, lst = 0, {}

	local function lstep(v)
		if type(v) == "number" then
			table.insert(lst, v)
			sum= sum +v;
		end
	end

	local function lfinal(count)
		local stddev = 0;
		count = #lst

		if count >1 then
			local sum_dev_sequence= 0
			local mean = sum /count;

			for i,v in ipairs(lst) do
				local dev= v -mean
				sum_dev_sequence = sum_dev_sequence +dev * dev;
			end
			stddev = math.sqrt(sum_dev_sequence /(count -1))
		end

		return stddev	
	end

	return lstep, stddev;
end

local db_hand, err = sqlite3.open(container.db_string)
if db_hand then
	if db_hand:exec(container.InitStr) then
		db_hand:set_aggregate("stddev", 1, lstddev)
		print(db_hand:first_cols("SELECT STDDEV(A) FROM T3"))
	else
		io.write("Eroor initializing", container.db_string, "\n")
	end
	db_hand:close()
else
	io.write("eror opening", container.db_string, ":", tostring(err), "\n")
end

