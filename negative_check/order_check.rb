# frozen_string_literal: true

require './config/routes'

puts "\nInvalid order".red
Order.new('str', 10)
