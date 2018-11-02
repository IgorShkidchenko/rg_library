# frozen_string_literal: true

class Author # :nodoc:
  attr_reader :name, :biography
  include Validator
  def initialize(name, biography = '')
    check_class(name)
    check_class(biography)
    check_string(name)
    @name = name
    @biography = biography
  end
end
