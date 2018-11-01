# frozen_string_literal: true

require './entities/library'
require 'faker'

# Start
library = Library.new
puts "\nAll library\nBooks: #{library.books.inspect}\n\nReaders: #{library.readers.inspect}\n"
puts "\nAuthors: #{library.authors.inspect}\n\nOrders: #{library.orders.inspect}\n"

# Positive creation check
author = Author.new(Faker::Book.author)
reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
book = Book.new(Faker::Book.title, author)
library.add_to_lib(book)
library.add_to_lib(reader)
library.add_to_lib(author)
library.add_to_lib(Order.new(book, reader))
# Delete last creations for clear database, exept order
library.books.pop
library.readers.pop
library.authors.pop

puts "\nCheck all statistic methods"
puts "\nmost_popular_books if no argument -->"
library.most_popular_books
puts "\nmost_popular_books if some arguments -->"
library.most_popular_books(7)
puts "\ntop_reader if no argument -->"
library.top_reader
puts "\ntop_reader if some arguments -->"
library.top_reader(7)
puts "\nnumber_of_readers if no argument -->"
library.number_of_readers
puts "\nnumber_of_readers if some arguments -->"
library.number_of_readers(7)

puts "\nCheck save_to_db"
library.save_to_db
puts "\nCreate order \n#{library.orders.last.inspect},\nyou can find it in database.yaml"

puts "\nDo you want to start negative creation check?\nEnter something to command line if YES or put 'Enter' if NO"
choice_negative = gets.chomp
if choice_negative.empty?
  puts 'You cancel negative creation check'
else
  puts "\n\n\n\nALERT! Negative creation check START\n\n\n\n"
  system 'ruby ./negative_check/author_check.rb'
  system 'ruby ./negative_check/book_check.rb'
  system 'ruby ./negative_check/order_check.rb'
  system 'ruby ./negative_check/reader_check.rb'
  system 'ruby ./negative_check/library_check.rb'
  puts "\n\n\n\nALERT! Negative creation check END\n\n\n\n"
end

puts "\nDo you want to start Fasterer and Rubocop check?\nEnter something to command line if YES or put 'Enter' if NO"
choice_rubo_fast = gets.chomp
if choice_rubo_fast.empty?
  puts "\nYou cancel Fasterer and Rubocop check"
else
  puts "\nFasterer and Rubocop check\n"
  system 'rubocop'
  puts "\nRubocop log\n\n"
  system 'fasterer'
  puts "\nFasterer log\n"
end

puts "\nYou can auto-create new library and try again with new argumetns"
puts "\nEnter something to command line if YES or put 'Enter' if NO"
choice_again = gets.chomp
if choice_again.empty?
  puts 'Cancel'
else
  puts 'Creating new library'
  system 'ruby data_base/fake_db.rb'
  system 'ruby index.rb'
end
