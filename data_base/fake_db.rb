# frozen_string_literal: true

# rubocop:disable LineLength

File.truncate('./data_base/database.yaml', 0)

require './entities/library'
require 'faker'

library = Library.new

random_author = Author.new(Faker::Book.author)
random_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
random_book = Book.new(Faker::Book.title, random_author)
library.add_to_lib(random_book)
library.add_to_lib(random_reader)
library.add_to_lib(random_author)

first_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
first_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
second_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
second_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
third_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
third_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
fourth_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
fourth_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))

orders_arr = []
orders_arr << Order.new(first_book, second_reader)
orders_arr << Order.new(second_book, first_reader)
orders_arr << Order.new(second_book, second_reader)
orders_arr << Order.new(first_book, first_reader)
orders_arr << Order.new(third_book, third_reader)
orders_arr << Order.new(fourth_book, first_reader)
orders_arr << Order.new(first_book, fourth_reader)
orders_arr << Order.new(third_book, second_reader)
orders_arr << Order.new(second_book, second_reader)
orders_arr << Order.new(second_book, second_reader)
orders_arr << Order.new(second_book, second_reader)

orders_arr.each { |el| library.add_to_lib(el) }
library.save_to_db

# rubocop:enable LineLength
