# frozen_string_literal: true

require_relative '../index'

puts "\nInvalid reader"
Reader.new(name: ' ', email: ' ', city: '', street: ' ', house: 5)
