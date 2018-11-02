# frozen_string_literal: true

class Library # :nodoc:
  include Statistics
  include Uploader
  include NiceVision
  include Validator
  attr_reader :books, :orders, :readers, :authors
  def initialize
    @books = []
    @readers = []
    @authors = []
    @orders = []
    load_db
  end

  def add(obj)
    case obj
    when Book then @books << obj
    when Author then @authors << obj
    when Reader then @readers << obj
    when Order then @orders << obj
    else raise LibraryWrongClassError, obj
    end
  end
end
