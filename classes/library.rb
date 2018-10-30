require 'yaml'
class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize
    @books, @readers, @authors, @orders = [], [], [], []
  end
  
  Most = ->(hash) { hash.max_by{|k,v| v}.first }

  def finder(arg = 'books')
    arr = []
    @orders.each {|x| arr << x.reader.name} if arg == 'readers'
    @orders.each {|x| arr << x.book.title}
    hash_items_count = arr.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
  end

  def add_to_lib(arg)
    case arg
      when Book then @books << arg
      when Author then @authors << arg
      when Reader then @readers << arg
      when Order then @orders << arg
      else puts "Library accepts only books ,authors , readers, orders"
    end
  end

  def popular_book
    puts "Best-seller is #{Most.call(finder)}"
  end

  def books_fan
    puts "Great mind is #{Most.call(finder('readers'))}"
  end

  def first_three_books
    books = finder.invert.sort.reverse.first(3).to_h
    books.each {|k,v| puts "#{v} was ordered #{k > 1 ? "#{k}" + ' times' : 'once'}"}
  end

  def test
    puts "\nBooks: #{@books}\n\nReaders: #{@readers}\n\nAuthors: #{@authors}\n\nOrders: #{@orders}\n\n"
  end

  def save_to_db
    library_db = [@books, @authors, @readers, @orders]
    File.open('./db/database.yaml', 'w') {|f| f.write library_db.to_yaml }
  end

  def load_db
    base = YAML.load(File.read('./db/database.yaml'))  
    base.each {|inner| inner.each {|more| add_to_lib(more)}} 
  end
end
