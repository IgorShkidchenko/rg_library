class Book < Library
  attr_accessor :title, :author
  def initialize(title, author)
    @title = title
    @author = author
    @@books << [title, author]
  end
end