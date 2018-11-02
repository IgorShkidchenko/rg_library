# frozen_string_literal: true

require './config/routes'

puts "\nInvalid book".red
Book.new(' ', 2)
