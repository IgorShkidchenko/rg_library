# frozen_string_literal: true

require './config/routes'

# Start
library = Library.new
puts "\n#{'All library'.green}\n\nBooks: #{library.books.inspect}\n\nReaders: #{library.readers.inspect}\n"
puts "\nAuthors: #{library.authors.inspect}\n\nOrders: #{library.orders.inspect}\n"

# Positive creation check
author = Author.new(Faker::Book.author)
num = Faker::Number.between(1, 10)
street = Faker::Address.street_name
reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, street, num)
book = Book.new(Faker::Book.title, author)
library.add(book)
library.add(reader)
library.add(author)
library.add(Order.new(book, reader))
# Delete last creations for clear database, exept order
library.books.pop
library.readers.pop
library.authors.pop

puts "\nCheck all statistic methods".green
puts "\nmost_popular_books if no argument -->".green
library.most_popular_books
library.show_most_popular_books
puts "\nmost_popular_books if some arguments -->".green
library.most_popular_books(7)
library.show_most_popular_books(7)
puts "\ntop_reader if no argument -->".green
library.top_reader
library.show_top_reader
puts "\ntop_reader if some arguments -->".green
library.top_reader(7)
library.show_top_reader(7)
puts "\nnumber_of_readers if no argument -->".green
library.number_of_readers
library.show_number_of_readers
puts "\nnumber_of_readers if some arguments -->".green
library.number_of_readers(7)
library.show_number_of_readers(7)

puts "\nCheck save_to_db".green
library.save_to_db
puts "\nCreate order \n#{library.orders.last.inspect},\nYou can find it in database.yaml".green

puts "\nDo you want to start negative creation check?\nEnter something to command line if YES or put 'Enter' if NO".yellow
choice_negative = gets.chomp
if choice_negative.empty?
  puts 'You cancel negative creation check'.green
else
  puts "\n\n\n\nALERT! Negative creation check START\n\n\n\n".red
  sleep(1)
  system 'ruby ./negative_check/author_check.rb'
  system 'ruby ./negative_check/book_check.rb'
  system 'ruby ./negative_check/order_check.rb'
  system 'ruby ./negative_check/reader_check.rb'
  system 'ruby ./negative_check/library_check.rb'
  puts "\n\n\n\nALERT! Negative creation check END\n\n\n\n".red
end

puts "\nDo you want to start Fasterer and Rubocop check?\nEnter something to command line if YES or put 'Enter' if NO".yellow
choice_rubo_fast = gets.chomp
if choice_rubo_fast.empty?
  puts "\nYou cancel Fasterer and Rubocop check".green
else
  puts "\nFasterer and Rubocop check...\n".green
  system 'rubocop'
  puts "\nRubocop log\n\n".green
  system 'fasterer'
  puts "\nFasterer log\n".green
end

puts "\nYou can auto-create new library and try again with new argumetns".yellow
puts "\nEnter something to command line if YES or put 'Enter' if NO".yellow
choice_again = gets.chomp
if choice_again.empty?
  puts 'You cancel new creation'.green
else
  puts 'Creating new library...'.green
  system 'ruby data_base/fake_db.rb'
  system 'ruby index.rb'
end
