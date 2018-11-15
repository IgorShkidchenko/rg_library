# frozen_string_literal: true

module Statistics # :nodoc:
  def most_popular_books(orders, number = 1)
    sorter(orders, :book, number)
  end

  def top_reader(orders, number = 1)
    sorter(orders, :reader, number)
  end

  def number_of_readers_of_popular_books(orders, number = 3)
    uniq = orders.uniq { |order| [order.book, order.reader] }
    sorted = uniq.group_by(&:book).sort_by { |_book, order| -order.count }.first(number)
    sorted.map { |arr_book_orders| arr_book_orders.pop.count }
  end

  private

  def sorter(orders, entity, number)
    sorted = orders.group_by(&entity).sort_by { |_entity, order| -order.count }.first(number)
    sorted.to_h.keys
  end
end
