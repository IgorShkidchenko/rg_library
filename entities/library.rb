# frozen_string_literal: true

class Library # :nodoc:
  attr_reader :books, :orders, :readers, :authors
  include Statistics
  include Uploader
  include Errors

  def initialize
    @books = []
    @readers = []
    @authors = []
    @orders = []
    load_db.flatten.each { |entity| add(entity) }
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
