# frozen_string_literal: true

module Statistics # :nodoc:
  include NiceVision

  Counter = ->(arr) { Hash[arr.group_by { |title| title }.map { |k, v| [k, v.size] }] }
  Sorterator = ->(hash, num) { hash.sort_by { |_, v| -v }.first(num).to_h }

  def most_popular_books(num = 1)
    arr = @orders.map { |obj| obj.book.title }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end

  def top_reader(num = 1)
    arr = @orders.map { |obj| obj.reader.name }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end

  def number_of_readers(num = 3)
    uniq = @orders.uniq { |obj| [obj.book, obj.reader] }
    arr = uniq.map { |obj| obj.book.title }
    counted = Counter.call(arr)
    Sorterator.call(counted, num)
  end
end
