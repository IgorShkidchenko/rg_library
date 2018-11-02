# frozen_string_literal: true

# rubocop:disable LineLength

require './config/routes'

File.truncate(Uploader::PATH, 0)

library = Library.new

random_author = Author.new(Faker::Book.author)
random_reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, Faker::Address.street_name, Faker::Number.between(1, 10))
random_book = Book.new(Faker::Book.title, random_author)
library.add(random_book)
library.add(random_reader)
library.add(random_author)

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

orders_arr.each { |el| library.add(el) }
library.save_to_db

# rubocop:enable LineLength
