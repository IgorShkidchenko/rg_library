# frozen_string_literal: true

class Book # :nodoc:
  attr_reader :title, :author
  include Validator

  def initialize(title, author)
    validate(title, author)
    @title = title
    @author = author
  end

  private

  def validate(title, author)
    check_class(author, Author)
    check_class(title, String)
    check_for_emptiness(title)
  end
end
