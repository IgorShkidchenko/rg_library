# frozen_string_literal: true

class Author < EntityValidate # :nodoc:
  attr_reader :name, :biography

  def initialize(name, biography = ' ')
    validate_string(name, biography)
    @name = name
    @biography = biography
  end
end
