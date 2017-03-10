require 'delegate'
autoload :ActiveSupport, 'active_support'

class FormatNumber < SimpleDelegator
  autoload :VERSION, 'format_number/version'
  autoload :Serializer, 'format_number/serializer'

  def self.with(*args)
    Serializer.new(*args)
  end

  def initialize(val, formatter, options = {})
    raise ArgumentError, 'must be numeric' unless val.kind_of?(Numeric)
    @formatter = formatter
    @formatter_options = options
    super(val)
  end

  def +(val)
    spawn super(val)
  end

  def -(val)
    spawn super(val)
  end

  def *(val)
    spawn super(val)
  end

  def /(val)
    spawn super(val)
  end

  def to_s
    ActiveSupport::NumberHelper.send(@formatter, value, @formatter_options)
  end
  alias to_str to_s

  def value
    integer? ? to_i : to_f
  end

  private

  def spawn(val)
    self.class.new val, @formatter, @formatter_options
  end
end

