# frozen_string_literal: true

# rubocop:disable LineLength

module Statistics # :nodoc:
  def finder(num, klass = 'book')
    arr = []
    @orders.each { |obj| arr << obj.reader.name } if klass == 'readers'
    @orders.each { |obj| arr << obj.book.title } if klass == 'book'
    if klass == 'uniq'
      uniq = @orders.uniq { |obj| [obj.book, obj.reader] }
      uniq.each { |obj| arr << obj.book.title }
    end
    counted = arr.each_with_object(Hash.new(0)) { |el, total| total[el] += 1; }
    sorted = counted.sort_by { |_, v| v }.reverse.first(num).to_h
    if klass == 'readers'
      sorted.each { |k, v| puts "#{k} read #{v > 1 ? v.to_s + ' books' : 'one book'}" }
    else
      sorted.each { |k, v| puts "#{k} was ordered #{v > 1 ? v.to_s + ' times' : 'once'}" }
    end
  end

  def most_popular_books(num = 1)
    puts "\nBest-seller#{num > 1 ? 's are' : ' is'}"
    finder(num)
  end

  def top_reader(num = 1)
    puts "\nGreat mind#{num > 1 ? 's are' : ' is'}"
    finder(num, 'readers')
  end

  def number_of_readers(num = 3)
    puts "\nUniq books are"
    finder(num, 'uniq')
  end

  def save_to_db
    library_db = [@books, @authors, @readers, @orders]
    File.open('./data_base/database.yaml', 'w') { |f| f.write library_db.to_yaml }
  end

  def load_db
    base = YAML.load(File.read('./data_base/database.yaml'))
    base.each { |inner| inner.each { |more| add_to_lib(more) } } unless base == false
  end

  def add_to_lib(arg)
    case arg
    when Book then @books << arg
    when Author then @authors << arg
    when Reader then @readers << arg
    when Order then @orders << arg
    else raise LibraryError
    end
  end
end
# rubocop:enable LineLength
