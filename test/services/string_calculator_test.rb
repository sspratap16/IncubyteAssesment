require "test_helper"

class StringCalculatorTest < ActiveSupport::TestCase
  def test_add_returns_0_for_empty_string
    assert_equal 0, StringCalculator.add(""), "Add method should return 0 for an empty string"
  end

  def test_add_returns_number_for_single_number_string
    assert_equal 1, StringCalculator.add("1")
    assert_equal 5, StringCalculator.add("5") # Add another case
  end
end
