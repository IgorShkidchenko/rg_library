# frozen_string_literal: true

require_relative 'error'

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  def initialize(name, email, city, street, house)
    str = [name, email, city, street]
    str.each { |el| raise LibraryError unless el.is_a? String }
    str.each { |el| raise LibraryError, 'str' if el.empty? }
    raise LibraryError unless house.is_a? Integer

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
