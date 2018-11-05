# frozen_string_literal: true

class Book < EntityValidate # :nodoc:
  attr_reader :title, :author

  def initialize(title, author)
    validate_string(title)
    validate_other_class(author, Author)
    @title = title
    @author = author
  end
end
