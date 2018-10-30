require './classes/library'
require './classes/book'
require './classes/order'
require'./classes/reader'
require './classes/author'


library = Library.new

library.test
library.first_three_books
library.popular_book
library.books_fan

#puts 'Enter the name of new book'
choice = 'new'

#new_book = Book.new(choice, Author.new(" ", "Mario Puzo lifes10"))
#puts new_book
#library.add_to_lib(Order.new(new_book, Reader.new("tester", '1', "test City", "test #Street",1)))
#library.save_to_db
