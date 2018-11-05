# frozen_string_literal: true

# rubocop:disable LineLength

require 'faker'
require 'yaml'
require_relative './errors/errors'
require_relative './controllers/validator/validator'
require_relative './entities/entity_validate'
require_relative './entities/book'
require_relative './entities/author'
require_relative './entities/order'
require_relative './entities/reader'
require_relative './controllers/library/nice_vision'
require_relative './controllers/library/statistics'
require_relative './controllers/data_base/uploader'
require_relative './entities/library'
require_relative './data_base/fake_db'

String.class_eval do
  def red
    "\e[31m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  def blue
    "\e[36m#{self}\e[0m"
  end
end

# Start
library = Library.new
puts "\n#{'All library'.green}\n\nBooks: #{library.books.inspect}\n\nReaders: #{library.readers.inspect}\n"
puts "\nAuthors: #{library.authors.inspect}\n\nOrders: #{library.orders.inspect}\n"

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
author = Author.new(Faker::Book.author)
library.add(author)
library.save_to_db
puts "\nCreate order \n#{library.authors.last.inspect},\nYou can find it in database.yaml".green

puts "\nDo you want to start Fasterer, Rubocop, Rspec check?\nEnter something to command line if YES or put 'Enter' if NO".yellow
choice_rubo_fast = gets.chomp
if choice_rubo_fast.empty?
  puts "\nCancel".green
else
  puts "\nStart\n".green
  system 'rubocop'
  puts "\n Rubocop log\n\n".green
  system 'fasterer'
  puts "\n Fasterer log\n".green
  system 'rspec .'
  puts "\ Rspec log\n".green
end

puts "\nYou can auto-create new library and try again with new argumetns".yellow
puts "\nEnter something to command line if YES or put 'Enter' if NO".yellow
choice_again = gets.chomp
if choice_again.empty?
  puts 'You cancel new creation'.green
else
  puts 'Creating new library...'.green
  system 'ruby data_base/fake_db.rb'
  system 'ruby start.rb'
end

# rubocop:enable LineLength
