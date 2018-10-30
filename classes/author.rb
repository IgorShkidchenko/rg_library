require_relative 'error'

class Author
  attr_accessor :name, :biography
  def initialize(name, biography = nil)
    raise LibraryError unless (name.is_a? String) && (!name.empty?)
    @name, @biography = name, biography
  end
end
