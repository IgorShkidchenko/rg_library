# frozen_string_literal: true

require_relative 'error'

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  def initialize(name, email, city, street, house)
    str = [name, email, city, street]
    str.each { |el| raise LibraryError unless el.is_a? String }
    str.each { |el| raise LibraryError.new('str') if el.empty? }
    raise LibraryError unless (house.is_a? Integer)
    @name, @email, @city, @street, @house = name, email, city, street, house
  end
end
