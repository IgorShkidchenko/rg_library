require './classes/library'
require './classes/book'
require './classes/order'
require'./classes/reader'
require './classes/author'

library = Library.new

library.test
library.load_db
library.test
library.first_three_books
library.popular_book
library.books_fan

puts 'Enter the name of new book'
choice = gets.chomp

new_book = Book.new(choice, Author.new("Mario Puzo10", "Mario Puzo lifes10"))
library.add_to_lib(Order.new(new_book, Reader.new("tester", "test@gmail.com", "test City", "test Street","221B")))
library.save_to_db
puts "Last added book: #{library.orders.last.book.title}"