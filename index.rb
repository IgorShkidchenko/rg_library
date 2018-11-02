# frozen_string_literal: true

require './config/routes'

library = Library.new

author = Author.new(Faker::Book.author)
num = Faker::Number.between(1, 10)
street = Faker::Address.street_name
reader = Reader.new(Faker::GameOfThrones.character, Faker::Internet.email, Faker::GameOfThrones.city, street, num)
book = Book.new(Faker::Book.title, author)

library.add(book)
library.add(reader)
library.add(author)
library.add(Order.new(book, reader))

library.most_popular_books
library.top_reader
library.number_of_readers

library.save_to_db
