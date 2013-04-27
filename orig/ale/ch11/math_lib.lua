#!/usr/bin/lua
--Math lib 


--trigonometric functions
math.sin(radians) -- plots according to radians the trigonemetric function
math.cos(radians)
math.tan(radians)

-- math.pi -- value for actual pi.

--angle converstion
math.deg(radians) -- converts to degree
math.rad(degree) -- converts to radians


--inverse trigonometric functions/ arc of trig
math.asin(--[[values from -1 to 1]]) -- asin = arc sin 
math.acost()
math.atan(value)
math.atan2(numerator, denominator) -- returns the angle of a bidimensional vector.


---------Example
for y=-3,3 do
	for x= -3, 3 do
		io.write(string.format("%5.2f", math.atan2(y,x)/math.pi))
	end
	io.write("\n")
end


--hyperbolic trigonometric functions
math.sinh(angle)
math.cosh(angle)
math.tanh(angle)



--exponent functions
math.exp(value) -- gives the exponential position
math.pow(base,exponent) -- returns the specified base raised to the specified exponent.
math.sqrt(number) -- sqrt of the number
math.log(number) -- base-e logarithm, natural log
math.log10(number) -- base-10 logarithm



--adjustment functions
math.abs(number) -- absolute value of the number
math.ceil(number) -- returns the smallest integer greater than or equal to the specified number.
math.flor(number) -- returns the greatest integeter less than or equal to the specified number


--floating point representation
--[[
1234x10^-3 -> 1234 = mantissa; x10 = base-10 increment; ^-3 = exponent 
1.234 = 1234x10^-3
]]

math.frexp(number) -- returns the mantissa and integer exponent of the number. Only the absolute is given.
math.ldexp(mantissa, exponent) -- returns the product of the specified mantissa. 



--pseudo-random number
math.randomseed(number) -- seeds the pseudo-random number generator.
math.random(bound, bound1) -- look at example below

local seed = os.clock()
for i=1,2 do
	math.randomseed(seed) -- will follow in giving a pseudo-random
	math.random()
	for i=1,10 do
		io.write(math.random(100,200), " ")	--gives the same exact as above!
	end
	io.write("\n")
end

--modulus
math.modf(number) -- returns the integer and fractional portions of the number
math.fmod(number, denominator) -- returns the remainder of the numerator divided by the denominator.


--minimum and amximum
math.max(numbers) -- returns the greatest value in the list of numbers
math.min(number) -- returns the smallest number in the list.

--constants
--math.huge -- a number greater than or equal to any other number (infinity!)
--math.pi -- circumference of a circle.

