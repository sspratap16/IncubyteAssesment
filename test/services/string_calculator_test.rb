require "test_helper"

class StringCalculatorTest < ActiveSupport::TestCase
  def test_add_returns_0_for_empty_string
    assert_equal 0, StringCalculator.add(""), "Add method should return 0 for an empty string"
  end
end
