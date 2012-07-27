#!/usr/bin/lua
-- database concepts

-- some db tables
customer= {	-- table db for customers
	{id= "c001", nlast= "Bumppo", nfirst= "Natty"}
	,{id= "c002", nlast= "Finn", nfirst= "Huckleberry"}
	,{id= "c003", nlast= "Darcy", nfirst= "Fitzwilliam"}
	,{id= "c004", nlast= "Bennet", nfirst= "Elizabeth"}
	,{id= "c005", nlast= "Marner", nfirst= "Silas"}
}

product= { -- table db for product
	{id= "p001", description= "WhatChaMaCallIt"}
	,{id= "p002", description= "gizmo"}
	,{id= "p003", description= "GewGaw"}
	,{id= "p004", description= "ThingaMajig"}
	,{id= "p005", description= "widget"}
	,{id= "p006", description= "doodad"}
	,{id= "p007", description= "WhatsIt"}
}

order= { --table for product purchased by customer
	{id= "o001", customer_id= "c003", product_id= "p002", count= 52}
	,{id= "o002", customer_id= "c003", product_id= "p004", count= 87}
	,{id= "o003", customer_id= "c004", product_id= "p001", count= 12}
	,{id= "o004", customer_id= "c004", product_id= "p003", count= 8}
	,{id= "o005", customer_id= "c004", product_id= "p005", count= 20}
	,{id= "o006", customer_id= "c002", product_id= "p004", count= 2}
}


function join( tab11, tab11_select, tab12, tab12_select, fwhere)
	local ret= {}
	for i,tab11_row in ipairs(tab11) do --changine the tables to rows
		for i,tab12_row in ipairs(tab12) do
			if fwhere(tab11_row, tab12_row) then
				local ret_row= {}
				for i,tab11_col in ipairs(tab11_select) do
					ret_row[tab11_col] = tab11_row[tab11_col]
				end
				for i,tab12_col in ipairs(tab12_select) do
					ret_row[tab12_col] = tab12_row[tab12_col]
				end
				ret[#ret +1] = ret_row
			end
		end
	end
	return ret
end

local function show_field( string, width, number) --spaces for the field
	local pad = string.rep(" ", width - string.len(string)) -- make space for pad with width and length of string.
	if number then
		io.write(pad, string, "  ")
	else
		io.write(string, pad, "  ")
	end
end


--displaying the db table 
function show_db_tab( tab)
	local col_list = {}
	for col_string,v in pairs(tab[1]) do --width of each column and type
		col_list[#col_list +1] = {name = col_string, width = string.len(col_string)
		, number= type(val) == "number"};
	end

	for i,row in ipairs(tab) do--maximum width of each column
		for i,col in ipairs(col_list) do
			col.width = math.max(string.len(row[col.name]), col.width)
		end
	end

	for i,col in ipairs(col_list) do --header
		show_field(string.rep("-", col.width), col.width, false)
	end
	io.write("\n")

	for i,row in ipairs(tab) do --rows are displayed
		for i,col in ipairs(col_list) do
			show_field(row[col.name], col.width, col.number)
		end
		io.write("\n")
	end
end


----------
cusomer_order = join(customer, {"nlast"}, order, {"product_id"}, "count",
	function( customer, order )
		return customer.id == order.customer_id
	end)

print("*** customer joined to order ***")
show_db_tab(cusomer_order)
print()
cusomer_order_product= join(cusomer_order, {"nlast", "count"}, product, {"description"},
	function( cusomer_order, product)
		return cusomer_order.product_id == product.id;
	end)
print("*** customer joined to order joined to product ***")
show_db_tab(cusomer_order_product)
print()

Bennet= join(cusomer_order, {"count"}, product, {"description"},
	function( cusomer_order, product)
		return cusomer_order.product_id == product.id
			and cusomer_order.nlast == "Bennet" 
	end)

print("*** All orders by customer Bennet ***")
show_db_tab(Bennet)