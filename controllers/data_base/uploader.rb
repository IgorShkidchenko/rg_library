# frozen_string_literal: true

module Uploader # :nodoc:
  PATH = './data_base/database.yaml'
  def save_to_db
    library_db = [@books, @authors, @readers, @orders]
    File.open(PATH, 'w') { |f| f.write library_db.to_yaml }
  end

  def load_db
    list = [Book, Reader, Author, Order, Time]
    base = YAML.safe_load(File.read(PATH), list, [], [], true)
    base&.each { |inner| inner.each { |more| add(more) } }
  end
end
