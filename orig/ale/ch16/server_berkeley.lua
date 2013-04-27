#!/usr/bin/lua 
-- berkely

local socket= require("socket")

local address = arg[1] or "127.0.0.1"
local port = tonumber(arg[2] or 11250)
local string, length, socket_hand, client_hand, err, bind_address, bind_port, client_address, client_port

socket_hand, err = socket.bind(address, port)
if socket_hand then
	bind_address, bind_port = socket_hand:getsockname()
	io.write("Listening on ", bind_address, ", port ", bind_port, "\n")
	client_hand, err = socket_hand:accept()
	if client_hand then
		client_address, client_port = client_hand:getpeername()
		io.write("Connection from ", client_address, ", port", client_port, "\n")
		string = string.format("Greetins from %s:$d to %s:%d\r\n",
			bind_address, bind_port, client_address, client_port)
		length, err = client_hand:send(string)
		if length then
			string, err = client_hand:receive()
			if string then
				io.write("received from client: [", string, "]\n")
			else
				io.write("Shit hit the fan!\t", err, "\r\n")
			end
			client_hand:shutdown("both")
		else
			io.write("send erro:", err, "\n")
		end
		client_hand:close()
	else
		io.write("Error with client Connection:\t", err, "\n")
	end
	socket_hand:close()
else
	io.write("Listening socket error:\t", err, "\n")
end