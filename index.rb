# frozen_string_literal: true

require_relative 'autoload'

library = Library.new
author = Author.new(Faker::Book.author)
book = Book.new(Faker::Book.title, author)

reader_house = Faker::Number.between(1, 10)
reader_street = Faker::Address.street_name
reader_name = Faker::GameOfThrones.character
reader_email = Faker::Internet.email
reader_city = Faker::GameOfThrones.city
reader = Reader.new(name: reader_name, email: reader_email,
                    city: reader_city, street: reader_street, house: reader_house)

library.add(book)
library.add(reader)
library.add(author)
library.add(Order.new(book, reader))

library.most_popular_books(library.orders)
library.top_reader(library.orders)
library.number_of_readers(library.orders)

library.save_to_db(book: library.books, author: library.authors, reader: library.readers, order: library.orders)
