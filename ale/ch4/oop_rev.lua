#!/usr/bin/lua
-- OOP revised

account= {balance= 0}

--The use of the self paramater. Holds the value of the receiver.
-- 	the self parameter is a centrail point in oop setup
function account.withdrawal( self, v ) 
	self.balance =  self.balance - v; 
end

a1= account; account= nil
a1.withdrawal(a1, 100.00) --the function works since it calls the self, which calls itself!

--The self parameter allows to use the same method for multiple of objects.

a2= {balance= 0, withdrawal= account.withdrawal}

a2.withdrawal(a2, 260.00) -- calls the self, then the actual value.



--------------------------------------------------------------------
-- Hiding the self parameter with :
-- the colon adds an extra hidden parameter in a method definition and to add an extra argument in a method call
function account:withdrawal( v )
	self.balance = self.balance -v
end

a:withdrawal(100.00) -- follows mg3 from eg5.lua. 


--another example
account1 = { balance= 0,
			 function withdraw(self, v)
			 	self.balance = self.balance -v
			 end
			}

function account1:deposit (v)
	self.balance= self.balance +v
end

account1.deposit(account, 200.00)	--here we use the self parameter.
account1:withdraw(100.00)	--same as line 44, just doesn't use self in defining the arguments.

--------------------------------------------------------------------
-- Classes - a place to put behavior to be shared by serveral objects

