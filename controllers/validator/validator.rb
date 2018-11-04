# frozen_string_literal: true

module Validator # :nodoc:
  include Errors
  def check_string(str)
    raise EmptyStringError if str.empty?
  end

  def check_class(entity, klass)
    raise WrongClassError unless entity.is_a? klass
  end
end
