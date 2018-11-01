# frozen_string_literal: true

class LibraryError < StandardError # :nodoc:
  def initialize(check = 'klass')
    super('You try to send a the wrong class!') if check == 'klass'
    super('You try to send a empty string!') if check != 'klass'
  end
end
