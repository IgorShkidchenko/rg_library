require 'yaml'

class Library
  attr_accessor :books, :orders, :readers, :authors
  def initialize
    @@books = []
    @@readers = []
    @@authors = []
    @@orders = []
  end

  @@most = ->(hash) { hash.max_by{|k,v| v}.first }

  def self.finder(num)
    arr = []
    @@orders.each {|x| arr << x[num] }
    hash_items_count = arr.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
  end
  
  def self.books_fan
    puts "Great mind is #{@@most.call(finder(1))}"
  end

  def self.popular_book
    puts "Best-seller is #{@@most.call(finder(0))}"
  end

  def self.first_three_books
    books = finder(0).invert.sort.reverse.first(3).to_h
    books.each {|k,v| puts "#{v} was ordered #{k} times"}
  end

  def self.save_to_db
    library_db = []
    library_db.push 'All books', @@books, "\nAll authors", @@authors, "\nAll readers", @@readers, "\nAll orders", @@orders
    File.write("database.yaml", library_db.to_yaml)
  end

  def self.view_all_data
    puts YAML.load_file('database.yaml')
  end
end
