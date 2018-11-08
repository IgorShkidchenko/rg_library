# frozen_string_literal: true

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  include Validator

  def initialize(name:, email:, city:, street:, house:)
    validate(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def validate(name, email, city, street, house)
    only_strings = [name, email, city, street]
    only_strings.each { |str| check_class(str, String) }
    only_strings.each { |str| check_for_emptiness(str) }
    check_class(house, Integer)
  end
end
