# frozen_string_literal: true

class Order < EntityValidate # :nodoc:
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    validate_other_class(book, Book)
    validate_other_class(reader, Reader)
    validate_other_class(date, Time)
    @book = book
    @reader = reader
    @date = date
  end
end
