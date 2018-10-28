class Author < Library
  attr_accessor :name, :biography
  def initialize(name, biography)
    @name, @biography = name, biography
    @@authors << [name, biography]
  end
end