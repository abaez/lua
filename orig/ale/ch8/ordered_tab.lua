#!/usr/bin/lua
--Ordered tables

local rts= {} --real table
local nks={} -- num to key
local kns={} -- key to num

local function __newindex( proxy, k,v )
	local rt= rts[proxy]
	local nk= nks[proxy]
	local kn= kns[proxy]

	if rt[k] == nil then --new key going to real table
		if v ~= nil then --making sure not nil
			rt[k] = v --making the table
			nk[#nk +1] = k --here is the number to key
			kn[k] = #nk --here is the key to number
		end
	else
		if v ~= nil then
			rt[k] = v
		else --erases the key if it doesn't exist
			rt[k] = nil 
			local num = kn[k]
			kn[k] = nil

			if num < #nk then --will shift down anything in nk that's higher than num.
				for somek,somenum in pairs(kn) do
					if somenum > num then
						kn[somenum] = somenum -1
					end
				end
			end
			table.remove(nk, num) --here removing anything larger than num
		end
	end
end