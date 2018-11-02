# frozen_string_literal: true

class Reader # :nodoc:
  attr_reader :name, :email, :city, :street, :house
  include Validator
  
  def initialize(*name_params)
    only_strings = name_params.first(4)
    check_lenght(name_params)
    check_class(only_strings, String, only_strings.size)
    check_string(only_strings, only_strings.size)
    check_class(name_params.last, Integer)
    @name, @email, @city, @street, @house = *name_params
  end
end
