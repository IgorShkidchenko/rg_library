# frozen_string_literal: true

class EntityValidate # :nodoc:
  include Validator

  def validate_string(*arguments)
    arguments.each { |str| check_class(str, String) }
    arguments.each { |str| check_string(str) }
  end

  def validate_other_class(entity, klass)
    check_class(entity, klass)
  end
end
