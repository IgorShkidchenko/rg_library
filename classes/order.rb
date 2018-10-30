class Order
  attr_accessor :book, :reader, :date
  def initialize(book, reader, date = Time.now)
    ((book.is_a? Book) && (reader.is_a? Reader)) ? (@book, @reader, @date = book, reader, date) : (puts "Error") 
  end
end
