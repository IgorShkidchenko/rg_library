require_relative 'error'

class Book
  attr_accessor :title, :author
  def initialize(title, author)
    if (author.is_a? Author) && (title.is_a? String) && (!title.empty?) 
      @title, @author = title, author
    else
      raise LibraryError
    end
  end
end
