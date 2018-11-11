# frozen_string_literal: true

module Statistics # :nodoc:
  def most_popular_books(orders, num = 1)
    sorted = orders.group_by(&:book).sort_by { |_book, order| -order.count }.first(num)
    sorted.to_h.keys
  end

  def top_reader(orders, num = 1)
    sorted = orders.group_by(&:reader).sort_by { |_book, order| -order.count }.first(num)
    sorted.to_h.keys
  end

  def number_of_readers_of_popular_books(orders, num = 3)
    uniq = orders.uniq { |order| [order.book, order.reader] }
    sorted = uniq.group_by(&:book).sort_by { |_book, order| -order.count }.first(num)
    sorted.map { |arr_book_orders| arr_book_orders.pop.count }
  end
end
