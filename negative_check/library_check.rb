# frozen_string_literal: true

require './config/routes'

puts "\nInvalid library".red
library = Library.new
library.add(1)
