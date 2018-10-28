require_relative 'library'
require_relative 'book'
require_relative 'order'
require_relative 'reader'
require_relative 'author'

Library.new
Order.new('Second popular book', 'John')
Order.new('First popular book', 'Nick')
Order.new('Second popular book', 'Nick')
Order.new('First popular book', 'Sam')
Order.new('First popular book', 'Joe')
Order.new('Last popular book', 'Sam')
Order.new('First popular book', 'John')
Order.new('Last popular book', 'Nick')
Order.new('Second popular book', 'Sam')
Order.new('Random book', 'Sam')
Author.new("Mario Puzo", "Mario Puzo lifes")
Book.new("God father", "Mario Puzo")
Reader.new("Sherlock", "holms@gmail.com", "London", "Baker Street","221B")

Library.books_fan
puts "\n"
Library.popular_book
puts "\n"
Library.first_three_books
puts "\n"
Library.save_to_db
Library.view_all_data