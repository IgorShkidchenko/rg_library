# frozen_string_literal: true

require_relative 'error'

class Book # :nodoc:
  attr_reader :title, :author
  def initialize(title, author)
    raise LibraryError unless (author.is_a? Author) && (title.is_a? String)
    raise LibraryError, 'str' if title.empty?

    @title = title
    @author = author
  end
end
