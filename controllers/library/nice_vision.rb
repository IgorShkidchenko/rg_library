# frozen_string_literal: true

module NiceVision # :nodoc:
  def show_top_reader(num = 1)
    puts "\nGreat mind#{num > 1 ? 's are' : ' is'}".blue
    arr = []
    @orders.each { |obj| arr << obj.book.title }
    counted = Statistics::Counter.call(arr)
    sorted = Statistics::Sorterator.call(counted, num)
    sorted.each { |k, v| puts "#{k} was ordered #{v > 1 ? v.to_s + ' times' : 'once'}" }
  end

  def show_most_popular_books(num = 1)
    puts "\nBest-seller#{num > 1 ? 's are' : ' is'}".blue
    arr = []
    @orders.each { |obj| arr << obj.reader.name }
    counted = Statistics::Counter.call(arr)
    sorted = Statistics::Sorterator.call(counted, num)
    sorted.each { |k, v| puts "#{k} read #{v > 1 ? v.to_s + ' books' : 'one book'}" }
  end

  def show_number_of_readers(num = 3)
    puts "\nUniq books are".blue
    arr = []
    uniq = @orders.uniq { |obj| [obj.book, obj.reader] }
    uniq.each { |obj| arr << obj.book.title }
    counted = Statistics::Counter.call(arr)
    sorted = Statistics::Sorterator.call(counted, num)
    sorted.each { |k, v| puts "#{k} read #{v > 1 ? v.to_s + ' books' : 'one book'}" }
  end
end
