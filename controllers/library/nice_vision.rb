# frozen_string_literal: true

module NiceVision # :nodoc:
  def show_top_reader(orders, num = 1)
    puts "\nGreat mind#{num > 1 ? 's are' : ' is'}".blue
    top_reader(orders, num).to_h.each { |k, v| puts "#{k} read #{v > 1 ? v.to_s + ' books' : 'one book'}" }
  end

  def show_most_popular_books(orders, num = 1)
    puts "\nBest-seller#{num > 1 ? 's are' : ' is'}".blue
    most_popular_books(orders, num).to_h.each { |k, v| puts "#{k} was ordered #{v > 1 ? v.to_s + ' times' : 'once'}" }
  end

  def show_number_of_readers(orders, num = 3)
    puts "\nUniq books are".blue
    number_of_readers(orders, num).to_h.each { |k, v| puts "#{k} was ordered #{v > 1 ? v.to_s + ' times' : 'once'}" }
  end
end
