class Book
  attr_accessor :title, :author
  def initialize(title, author)
    (author.is_a? Author) ? (@title, @author = title, author) : (puts "Error")
  end
end
