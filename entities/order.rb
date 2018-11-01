# frozen_string_literal: true

require_relative 'error'

class Order # :nodoc:
  attr_reader :book, :reader, :date
  def initialize(book, reader, date = Time.now)
    raise LibraryError unless (book.is_a? Book) && (reader.is_a? Reader)
    @book, @reader, @date = book, reader, date
  end
end
