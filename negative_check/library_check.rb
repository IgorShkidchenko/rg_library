# frozen_string_literal: true

require './entities/library'

puts "\nInvalid library"
library = Library.new
library.add_to_lib(1)
