require_relative 'error'

class Reader
  attr_accessor :name, :email, :city, :street, :house
  def initialize(name, email, city, street, house)
    strings = [name, email, city, street]
    if strings.each {|x| false unless x.is_a? String} && (house.is_a? Integer)
      @name, @email, @city, @street, @house = name, email, city, street, house
    else
      raise LibraryError
    end
  end
end
