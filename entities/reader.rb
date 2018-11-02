# frozen_string_literal: true

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  include Validator
  def initialize(*name_params)
    fantastic_four = name_params.first(4)
    check_lenght(name_params)
    check_class(fantastic_four, String, fantastic_four.size)
    check_string(fantastic_four, fantastic_four.size)
    check_class(name_params.last, Integer)
    @name, @email, @city, @street, @house = *name_params
  end
end
