# frozen_string_literal: true

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  include Validator

  def initialize(name:, email:, city:, street:, house:)
    name_params = [name, email, city, street, house]
    validate(name_params.last, name_params.first(4))
    @name, @email, @city, @street, @house = name_params
  end

  def validate(house, only_strings)
    only_strings.each { |str| check_class(str, String) }
    only_strings.each { |str| check_string(str) }
    check_class(house, Integer)
  end
end
