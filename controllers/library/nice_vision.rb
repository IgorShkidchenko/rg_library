# frozen_string_literal: true

module NiceVision # :nodoc:
  Counter = ->(arr_names) { Hash[arr_names.group_by { |name| name }.map { |name, value| [name, value.count] }] }
  Sorterator = ->(counted, num) { counted.sort_by { |_, name| -name }.first(num) }

  def show_top_reader(orders, num = 1)
    puts "\nGreat mind#{num > 1 ? 's are' : ' is'}".blue
    counted = Counter.call(orders.map(&:reader))
    sorted = Sorterator.call(counted, num).to_h
    sorted.each do |reader, count|
      puts "#{reader.name} read #{count > 1 ? count.to_s + ' books' : 'one book'}"
    end
  end

  def show_most_popular_books(orders, num = 1)
    puts "\nBest-seller#{num > 1 ? 's are' : ' is'}".blue
    sort_books(orders, num)
  end

  def show_number_of_readers(orders, num = 3)
    puts "\nUniq books are".blue
    uniq = orders.uniq { |order| [order.book, order.reader] }
    sort_books(uniq, num)
  end

  def sort_books(sortable, num)
    counted = Counter.call(sortable.map(&:book))
    sorted = Sorterator.call(counted, num).to_h
    sorted.each do |book, count|
      puts "#{book.title} was ordered #{count > 1 ? count.to_s + ' times' : 'once'}"
    end
  end
end
