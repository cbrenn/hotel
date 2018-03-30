
What classes does each implementation include? Are the lists the same?
Implementation A:
CartEntry
ShoppingCart
Order

Implementation B:
CartEntry
ShoppingCart
Order

The lists are the same.

Write down a sentence to describe each class.
CartEntry - holds the description and price of each item.
ShoppingCart - holds the entries from CartEntry.
Order - returns the total price of the contents fo the Cart.


How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
CartEntry creates entries, ShoppingCart then holds those entries in an array, Order moves through each entry in the cart and totals the price for the entire order.

What data does each class store? How (if at all) does this differ between the two implementations?
Implementation A
CartEntry stores unit price and quantity
ShoppingCart stores entries
Order store the cart, returning the order sum.

Implementation B
CartEntry stores unit price and quantity as well as price for the entry.
ShoppingCart stores entries, as well as price for the entries.
Order store the cart, returning the order sum. However now it calls the price method on the cart instead of summing the total for the order in itself.


What methods does each class have? How (if at all) does this differ between the two implementations?
Implementation A:
CartEntry -initialize
ShoppingCart - initialize
Order - initialize, total_price

Implementation B:
CartEntry -initialize, price
ShoppingCart - initialize, price
Order - initialize, total_price

Consider the Order#total_price method. In each implementation:

Is logic to compute the price delegated to "lower level" classes like ShoppingCart and CartEntry, or is it retained in Order?
it is delegated to lower classes, because it can be, and it doesn't require the order class to access an instance variable of another class.

Does total_price directly manipulate the instance variables of other classes?
No it does not.

If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
It would be easier to modify implementation B.
Which implementation better adheres to the single responsibility principle?
Implementation B

Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled? Implementaiton B
Once you've responded to the prompts, git add design-activity.md and git commit!

Revisiting Hotel
Now that we've got you thinking about design, spend some time to revisit the code you wrote for the Hotel project. For each class in your program, ask yourself the following questions:



What is this class's responsibility?
You should be able to describe it in a single sentence.

Hotel holds the reservations inside of an array of rooms.
Reservation holds the information necessary to create a reservation.
Block holds the information necessary to create a block of reservations.


Is this class responsible for exactly one thing?
Does this class take on any responsibility that should be delegated to "lower level" classes?
Is there code in other classes that directly manipulates this class's instance variables?

For the most part, yes  I would say that my classes are all responsible for one thing. They are responsible for one big thing, but overall it's still one thing.

There was one part that called an instance of Reservation in the hotel class. I used the examples from POOTR to wrap the instance.
def temp_reservation(checkin, checkout, rooms)
  Reservation.new(checkin, checkout ,rooms)
end



Activity
Based on the answers to the above questions, identify one place in your Hotel project where a class takes on multiple roles, or directly modifies the attributes of another class. Describe in design-activity.md what changes you would need to make to improve this design, and how the resulting design would be an improvement.

If you need inspiration, remember that the reference implementation exists.

My design for Hotel already reflects the changes in Implementation B as explained above. 

Then make the changes! Don't forget to take advantage of all the tests you wrote - if they're well structured, they should quickly inform you when your refactoring breaks something.

Once you're satisfied, git commit your changes and then push them to GitHub. This will automatically update your pull request.
