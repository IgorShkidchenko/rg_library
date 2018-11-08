# frozen_string_literal: true

module Statistics # :nodoc:
  include NiceVision

  Counter = ->(arr_names) { Hash[arr_names.group_by { |name| name }.map { |name, value| [name, value.count] }] }
  Sorterator = ->(counted, num) { counted.sort_by { |_, name| -name }.first(num) }

  def most_popular_books(orders, num = 1)
    book_titles = orders.map { |order| order.book.title }
    counted = Counter.call(book_titles)
    Sorterator.call(counted, num)
  end

  def top_reader(orders, num = 1)
    readers_name = orders.map { |order| order.reader.name }
    counted = Counter.call(readers_name)
    Sorterator.call(counted, num)
  end

  def number_of_readers(orders, num = 3)
    uniq = orders.uniq { |order| [order.book, order.reader] }
    most_popular_books(uniq, num)
  end
end
