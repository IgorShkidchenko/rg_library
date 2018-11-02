# frozen_string_literal: true

class Book # :nodoc:
  attr_reader :title, :author
  include Validator
  def initialize(title, author)
    check_class(author, Author)
    check_class(title)
    check_string(title)
    @title = title
    @author = author
  end
end
