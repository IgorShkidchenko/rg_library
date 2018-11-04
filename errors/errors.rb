# frozen_string_literal: true

module Errors # :nodoc:
  class WrongClassError < StandardError # :nodoc:
    def initialize
      super('Wrong class!')
    end
  end

  class EmptyStringError < StandardError # :nodoc:
    def initialize
      super('You try to send empty string!')
    end
  end

  class UndefinedLibraryEntity < StandardError # :nodoc:
    def initialize
      super('Library accepts only Book, Author, Order, Reader classes!')
    end
  end
end
