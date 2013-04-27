#!/usr/bin/lua
-- Berekeley reinforced

local socket = require("socket")

local container = {server_port= 3072, server_address= "localhost"}

local socket_hand= socket.connect(container.server_address, container.server_port)

if socket_hand then
	local loop = true
	local con_srv_string, con_srv_port = socket_hand:getpeername()
	local con_name_string = socket.dns.tohostname(con_srv_string)
	io.write(string.format("connected to %s (%s) on port %d.\n",
		con_srv_string, con_name_string, con_srv_port))
	io.write("Issue . quit to end connection, .shutdown to terminate server.\n")
	while loop do
		local string, err
		io.write("Send: ")
		string= io.read() or ".quit"
		socket_hand:send(string .. "\r\n")
		string, err = socket_hand:receive()
		if string then 
			io.write("receive: ", string, "\n")
		else
			loop = false
			if err == "closed" then
				io.write("Closing connection to server\n")
			else
				io.write("Error: ", err, "\n")
			end
		end
	end
	socket_hand:close()
else
	io.write("Error in client socket creation.\n")
end