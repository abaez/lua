#!/usr/bin/lua
-- client

local socket = require("socket")

local address = arg[1] or "127.0.0.1"
local port = tonumber(arg[2] or 11250)

local socket_hand, err, string, client_address, client_port, server_address, server_port

socket_hand, err= socket.connect(address, port, "127.0.0.1", 0)
if socket_hand then
	client_address, client_port = socket_hand:getsockname()
	server_address, server_port = socket_hand:getpeername()
	io.write("connected with ", server_address, " on port ", server_port, "\n")
	string, err = socket_hand:receive()
	if string then
		socket_hand:send(string.format("greetings from %s:%d to %s:%d\r\n",
			client_address, client_port, server_address, server_port))
		io.write("got [", string, "] from server\n" )
	else
		io.error("Error. ", err, "\n")
	end
	socket_hand:close()
else
	io.write("Connection socket error:\t", err, "\n")
end
