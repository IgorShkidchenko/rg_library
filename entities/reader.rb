# frozen_string_literal: true

class Reader < EntityValidate # :nodoc:
  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate_string(name, email, city, street)
    validate_other_class(house, Integer)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
