require 'test_helper'

class SerializerTest < Minitest::Test
  def setup
    @new_number = Number.new(integer: 1, decimal: 10.00, float: 100.00)
    @saved_number = Number
      .create(integer: 1, decimal: 10.00, float: 100.00)
      .reload
  end

  def string(value)
    ActiveSupport::NumberHelper.number_to_currency(value, unit: '!')
  end

  def test_integer
    string = string(1)
    assert_equal string, @saved_number.integer.to_s
    assert_equal string, @new_number.integer.to_s
  end

  def test_decimal
    string = string(10)
    assert_equal string, @saved_number.decimal.to_s
    assert_equal string, @new_number.decimal.to_s
  end

  def test_float
    string = string(100)
    assert_equal string, @saved_number.float.to_s
    assert_equal string, @new_number.float.to_s
  end
end
