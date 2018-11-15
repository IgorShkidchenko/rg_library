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
puts library.most_popular_books(library.orders)
puts library.top_reader(library.orders)
puts library.number_of_readers_of_popular_books(library.orders)

library.save_to_db(books: library.books, authors: library.authors, readers: library.readers, orders: library.orders)
