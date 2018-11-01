# frozen_string_literal: true

class LibraryError < StandardError # :nodoc:
  def initialize(check = nil)
    return super('You try to send a the wrong class!') if check.nil?
    super('You try to send a empty string!')
  end
end
