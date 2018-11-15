# frozen_string_literal: true

require_relative '../autoload'

File.truncate(Uploader::PATH, 0)

library = Library.new

random_author = Author.new(Faker::Book.author)
random_book = Book.new(Faker::Book.title, random_author)
random_reader = Reader.new(name: Faker::GameOfThrones.character, email: Faker::Internet.email,
                           city: Faker::GameOfThrones.city, street: Faker::Address.street_name,
                           house: Faker::Number.between(1, 10))

library.add(random_book)
library.add(random_reader)
library.add(random_author)

first_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
first_reader = Reader.new(name: Faker::GameOfThrones.character, email: Faker::Internet.email,
                          city: Faker::GameOfThrones.city, street: Faker::Address.street_name,
                          house: Faker::Number.between(1, 10))

second_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
second_reader = Reader.new(name: Faker::GameOfThrones.character, email: Faker::Internet.email,
                           city: Faker::GameOfThrones.city, street: Faker::Address.street_name,
                           house: Faker::Number.between(1, 10))

third_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
third_reader = Reader.new(name: Faker::GameOfThrones.character, email: Faker::Internet.email,
                          city: Faker::GameOfThrones.city, street: Faker::Address.street_name,
                          house: Faker::Number.between(1, 10))

fourth_book = Book.new(Faker::Book.title, Author.new(Faker::Book.author))
fourth_reader = Reader.new(name: Faker::GameOfThrones.character, email: Faker::Internet.email,
                           city: Faker::GameOfThrones.city, street: Faker::Address.street_name,
                           house: Faker::Number.between(1, 10))

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
library.save_to_db(books: library.books, authors: library.authors, readers: library.readers, orders: library.orders)
