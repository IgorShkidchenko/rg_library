# frozen_string_literal: true

require_relative 'error'

class Book # :nodoc:
  attr_reader :title, :author
  def initialize(title, author)
    raise LibraryError unless (author.is_a? Author) && (title.is_a? String)
    raise LibraryError.new('str') if title.empty?
    @title, @author = title, author
  end
end
