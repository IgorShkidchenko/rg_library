# frozen_string_literal: true

class Author # :nodoc:
  attr_reader :name, :biography
  include Validator

  def initialize(name, biography = '')
    validate(name, biography)
    @name = name
    @biography = biography
  end

  def validate(name, biography)
    check_class(name, String)
    check_class(biography, String)
    check_string(name)
  end
end
