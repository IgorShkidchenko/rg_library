# frozen_string_literal: true

require './config/routes'

puts "\nInvalid reader".red
Reader.new(1, 2, 3, 4, 5, 6)
