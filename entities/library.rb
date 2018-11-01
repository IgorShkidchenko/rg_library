# frozen_string_literal: true

require_relative 'book'
require_relative 'author'
require_relative 'order'
require_relative 'reader'
require './library_controller/statistics.rb'
require 'yaml'

class Library # :nodoc:
  include Statistics
  attr_reader :books, :orders, :readers, :authors
  def initialize
    @books = []
    @readers = []
    @authors = []
    @orders = []
    load_db
  end
end
