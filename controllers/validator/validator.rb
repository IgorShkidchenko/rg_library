# frozen_string_literal: true

module Validator # :nodoc:
  include Errors
  def check_string(str, num = 1)
    arr = num == 1 ? [str] : str
    arr.first(num).each { |el| raise EmptyStringError, arr.index('') if el.empty? }
  end

  def check_lenght(params)
    raise ToManyArgumentsError, params.size if params.size > 5
  end

  def check_class(obj, klass = String, num = 1)
    arr = num == 1 ? [obj] : obj
    arr.first(num).each { |el| raise WrongClassError, klass unless el.is_a? klass }
  end
end
