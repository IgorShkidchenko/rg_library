# frozen_string_literal: true

class Library # :nodoc:
  include Statistics
  include Uploader
  include Validator
  attr_reader :books, :orders, :readers, :authors

  def initialize
    @books = []
    @readers = []
    @authors = []
    @orders = []
    load_db
  end

  def add(entity)
    case entity
    when Book then @books << entity
    when Author then @authors << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else raise UndefinedLibraryEntity
    end
  end
end
