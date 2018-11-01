# frozen_string_literal: true

require_relative 'error'

class Author # :nodoc:
  attr_reader :name, :biography
  def initialize(name, biography = nil)
    raise LibraryError unless name.is_a? String
    raise LibraryError, 'str' if name.empty?

    @name = name
    @biography = biography
  end
end