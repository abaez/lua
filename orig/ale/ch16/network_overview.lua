#!/usr/bin/lua
-- Network Overview

-- require("socket") -- need it for this

-- socket.dns.gethostname() -- returns the host name of the machine
-- socket.dns.tohostname(--[[ip or hostname]]) -- information on the ip or hostname, wich a success or nil
-- socket.dns.toip(--[[ip or hostname]]) --returns the ip of the address given.


-- using simple obtain
local socket = require("socket") -- note, no need to do this unless if you want to classify it locally. can use line4 instead
local ip = {socket.dns.toip("www.lua.org")}
require ("show"); ObjectShow(ip, "toip") -- a function from  show.lua


-- unfurling a url
local url= require("socket.url") -- calling the url portion of the socket module
local url_string = "http://natty:pathfinder@www.example.net:8888" .. "/susquehanna;loc?date=1793#title"
ObjectShow(url.parse(url_string), "URL")
