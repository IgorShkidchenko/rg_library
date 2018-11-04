# frozen_string_literal: true

module Statistics # :nodoc:
  Counter = ->(arr) { arr.each_with_object(Hash.new(0)) { |el, total| total[el] += 1; } }
  Sorterator = ->(hash, num) { hash.sort_by { |_, v| v }.reverse.first(num).to_h }

  def most_popular_books(num = 1)
    arr = []
    @orders.each { |obj| arr << obj.book.title }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end

  def top_reader(num = 1)
    arr = []
    @orders.each { |obj| arr << obj.reader.name }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end

  def number_of_readers(num = 3)
    arr = []
    uniq = @orders.uniq { |obj| [obj.book, obj.reader] }
    uniq.each { |obj| arr << obj.book.title }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end
end
