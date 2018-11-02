# frozen_string_literal: true

module Statistics # :nodoc:
  def counter(klass)
    arr = []
    @orders.each { |obj| arr << obj.reader.name } if klass == 'readers'
    @orders.each { |obj| arr << obj.book.title } if klass == 'book'
    if klass == 'uniq'
      uniq = @orders.uniq { |obj| [obj.book, obj.reader] }
      uniq.each { |obj| arr << obj.book.title }
    end
    arr.each_with_object(Hash.new(0)) { |el, total| total[el] += 1; }
  end

  def sorterator(num, klass = 'book')
    counter(klass).sort_by { |_, v| v }.reverse.first(num).to_h
  end

  def most_popular_books(num = 1)
    sorterator(num)
  end

  def top_reader(num = 1)
    sorterator(num, 'readers')
  end

  def number_of_readers(num = 3)
    sorterator(num, 'uniq')
  end
end
