# frozen_string_literal: true

module Uploader # :nodoc:
  PATH_ROUTE = './data_base/'
  PATH_NAME = 'database'
  PATH_FORMAT = '.yaml'
  PATH = PATH_ROUTE + PATH_NAME + PATH_FORMAT

  def save_to_db(books:, authors:, readers:, orders:)
    library_db = [books, authors, readers, orders]
    File.open(PATH, 'w') { |f| f.write library_db.to_yaml }
  end

  private

  def load_db
    list = [Book, Reader, Author, Order, Time]
    YAML.safe_load(File.read(PATH), list, [], [], true).to_a
  end
end
