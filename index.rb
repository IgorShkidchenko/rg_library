# frozen_string_literal: true

require 'faker'
require 'yaml'
require_relative './errors/errors'
require_relative './controllers/validator/validator'
require_relative './entities/book'
require_relative './entities/author'
require_relative './entities/order'
require_relative './entities/reader'
require_relative './controllers/library/nice_vision'
require_relative './controllers/library/statistics'
require_relative './controllers/data_base/uploader'
require_relative './entities/library'
require_relative './data_base/fake_db'

library = Library.new
author = Author.new(Faker::Book.author)
book = Book.new(Faker::Book.title, author)

reader_house = Faker::Number.between(1, 10)
reader_street = Faker::Address.street_name
reader_name = Faker::GameOfThrones.character
reader_email = Faker::Internet.email
reader_city = Faker::GameOfThrones.city
reader = Reader.new(name: reader_name, email: reader_email, city: reader_city, street: reader_street, house: reader_house)

library.add(book)
library.add(reader)
library.add(author)
library.add(Order.new(book, reader))

library.most_popular_books
library.top_reader
library.number_of_readers

library.save_to_db
