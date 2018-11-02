# frozen_string_literal: true

module Errors # :nodoc:
  class WrongClassError < StandardError # :nodoc:
    def initialize(klass)
      super("#{'You need class'.pink} #{klass.to_s.red} #{'for this argument!'.pink}!")
    end
  end

  class EmptyStringError < StandardError # :nodoc:
    def initialize(ind)
      super("#{'You try to send empty string at index'.pink} #{ind.to_s.red}!")
    end
  end

  class ToManyArgumentsError < StandardError # :nodoc:
    def initialize(num, max = 5)
      super("#{num.to_s.red} #{'is too long, max arguments'.pink} #{max.to_s.red}")
    end
  end

  class UndefinedLibraryEntity < StandardError # :nodoc:
    def initialize(entity)
      super("#{entity.class.to_s.red} #{'is incorrect, library accepts only Book, Author, Order, Reader classes!'.pink}")
    end
  end
end
