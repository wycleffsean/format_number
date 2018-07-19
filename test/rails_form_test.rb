require 'test_helper'

class RailsFormTestHelper < ActionView::Base; end

class RailsFormTest < Minitest::Test
  def setup
    number = Number.new(integer: 1, decimal: 10.00, float: 100.00)
    helper = RailsFormTestHelper.new
    @builder = ActionView::Helpers::FormBuilder.new :number, number, helper, {}
  end

  def test_text_field
    assert_match /<input\ type="text"\ value="100\.0"\ name="number\[float\]"\ id="number_float"\ \/>/, @builder.text_field(:float)
  end
end
