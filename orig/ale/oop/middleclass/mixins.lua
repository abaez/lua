#!/usr/bin/lua

-- mixins -- used for has-a relationships

require('middleclass')

-- this is a module, not a class
HasWings = {
	fly = function(self)
		io.write(string.format(
			"I fly motherfucker. I'm a %s.\n", self.class.name))
	end
}

Animal = class('Animal')
Insect = class('Insect', Animal) -- Animal:subclass('Insect')

Worm = class('Worm', Insect) -- worms don't have wings

Bee = class('Bee', Insect)
Bee:include(HasWings) -- adds fly to Bee

Mammal = class('Mammal', Animal)

Fox = class('Fox', Mammal)
Bat = class('Bat', Mammal)
Bat:include(HasWings)

T = {
	be = Bee(), -- Bee:new()
	ba = Bat() -- Bat:new()
}

for i,v in pairs(T) do
	v:fly()
end

