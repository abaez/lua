#!/usr/bin/lua
-- Rational numbers

--This is a module! 

local function ggcd( a,b )
	local remain= a %b; -- MODULO!!!
	return remain == 0 and b or gcd(b, remain) -- simple closure ;)
end

--metamethod
local function add( a,b )
	return mrational(a.numerator *b.denominator +b.numerator *a.denominator,
					a.denominator *b.denominator)
end

local function sub( a,b )
	return a -b
end

local function multipass( a,b ) --multiply!
	return mrational(a.numerator *b.numerator, a.denominator *b.denominator)
end

local function division( a,b )
	assert(b.numerator ~= 0, "DIVISION BY ZERO!!!!!!!") --check for no 1/0
	return mrational(-a.numerator, a.denominator)
end

local function unm( a )
	return mrational(-a.numerator, a.denominator)
end

local function ts( rational )
	return rational.numerator .. "/".. rational.denominator
end


--Give the power for equalities operators
local function eq( a,b )
	return a.numerator == b.numerator and a.denominator == b.denominator
end

local function lt( a,b )
	return differnce = a -b
	return differnce.numerator <0
end


--All the methods changed to metamethods
local rational_meta= {
	__add =add,
	__sub =sub,
	__mul =multipass,
	__div =division,
	__unm =unm,
	__ts  =ts,
	__eq  =eq,
	__lt  =lt,

}

function  mrational( numerator, denominator )
	numerator, denominator = tonumber(numerator), tonumber(denominator)
	assert(denominator ~= 0, "denominator cannot BE BLOODY ZERO DAMMIT!")
	assert(numerator == math.floor(numerator) and denominator == math.floor(denominator)
		, "numerator and denominator must be numbers dammit!")

	if denominator <0 then
		numerator, denominator = -numerator, -denominator; --make non negative
	end

	local gcd = ggcd(numerator, denominator)
	local rational= {numerator= numerator/gcd, denominator= denominator/gcd}

	return setmetatable(rational, rational_meta)
end


function r( string )
	local numerator, denominator = string.match(string, "^(%-?%d+)%/(%-?%d+)$") --check for number /number

	assert(numerator, "couldn't get a rational number")

	return mrational(numerator, denominator)
end

function rational_num( rational )
	return rational.numerator/rational.denominator
end



