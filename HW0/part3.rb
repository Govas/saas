=begin

Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book
as a floating-point number, price, as attributes. The constructor should accept the ISBN number (a string)
as the first argument and price as second argument, and should raise ArgumentError (one of Ruby's built-in 
exception types) if the ISBN number is the empty string or if the price is less than or equal to zero.

Include the proper getters and setters for these attributes. Include a method price_as_string that returns
the price of the book with a leading dollar sign and trailing zeros, that is, a price of 20 should display 
as "$20.00" and a price of 33.8 should display as "$33.80".

=end

class BookInStock
  attr_accessor :isbn
  attr_accessor :price
  def initialize(isbn,price)
    raise ArgumentError,'ISBN is an empty string' if isbn.empty?
    @isbn=isbn
    raise ArgumentError,'price is less than or equal to zero' if price<=0
    @price=price
  end
  def price_as_string
    e,s=price.to_f.to_s.split('.')
    "$#{e}.#{s.ljust(2,'0')}"
  end
end
#BookInStock.new("",15.2)
#BookInStock.new("960-425-059-0",-15.2)
odisea=BookInStock.new("960-425-059-0",15.2)
puts odisea.price_as_string
puts odisea.price,odisea.isbn
odisea.price=20
odisea.isbn="960-425-056-0"
puts odisea.price,odisea.isbn
puts odisea.price_as_string