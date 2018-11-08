# frozen_string_literal: true

module Uploader # :nodoc:
  PATH_ROUTE = './data_base'
  PATH_NAME = '/database'
  PATH_FORMAT = '.yaml'
  PATH = PATH_ROUTE + PATH_NAME + PATH_FORMAT

  def save_to_db(book:, author:, reader:, order:)
    library_db = [book, author, reader, order]
    File.open(PATH, 'w') { |f| f.write library_db.to_yaml }
  end

  def load_db
    list = [Book, Reader, Author, Order, Time]
    base = YAML.safe_load(File.read(PATH), list, [], [], true)
    base&.each { |inner| inner.each { |more| add(more) } }
  end
end
