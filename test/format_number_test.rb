require 'test_helper'

class FormatNumberTest < Minitest::Test
  def setup
    @fn = FormatNumber.new(5, :number_to_currency)
  end

  def test_that_it_has_a_version_number
    refute_nil ::FormatNumber::VERSION
  end

  def test_argument_must_be_numeric
    assert_raises(ArgumentError) { FormatNumber.new(nil, :number_to_currency) }
  end

  def test_equality
    assert_equal 5, @fn
  end

  def test_class_equality
    assert_equal FormatNumber.new(5, nil), @fn
  end

  def test_sum
    assert_equal 10, @fn + 5
  end

  def test_sum_class
    assert_kind_of FormatNumber, @fn + 5
  end

  def test_difference
    assert_equal 0, @fn - 5
  end

  def test_difference_class
    assert_kind_of FormatNumber, @fn - 5
  end

  def test_product
    assert_equal 25, @fn * 5
  end

  def test_product_class
    assert_kind_of FormatNumber, @fn * 5
  end

  def test_quotient
    assert_equal 1, @fn / 5
  end

  def test_quotient_class
    assert_kind_of FormatNumber, @fn / 5
  end

  def test_to_s
    assert_equal ActiveSupport::NumberHelper.number_to_currency(5), @fn.to_s
    assert_equal(
      ActiveSupport::NumberHelper.number_to_currency(5.0),
      FormatNumber.new(5.0, :number_to_currency).to_s
    )
  end

  def test_html_safe
    ActiveSupport::SafeBuffer.new('') + @fn
    pass
  rescue
    flunk "doesn't concat with html_safe string"
  end
end
