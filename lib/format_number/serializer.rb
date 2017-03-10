class FormatNumber::Serializer
  def initialize(formatter, options = {})
    @formatter = formatter
    @options = options
  end

  def dump(value)
    case value
    when FormatNumber then value.value
    else value
    end
  end

  def load(value)
    case value
    when Numeric
      FormatNumber.new(value, @formatter, @options)
    else value
    end
  end
end
