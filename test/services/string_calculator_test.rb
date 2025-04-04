require "test_helper"

class StringCalculatorTest < ActiveSupport::TestCase
  def test_add_returns_0_for_empty_string
    assert_equal 0, StringCalculator.add(""), "Add method should return 0 for an empty string"
  end

  def test_add_returns_number_for_single_number_string
    assert_equal 1, StringCalculator.add("1")
    assert_equal 5, StringCalculator.add("5")
  end

  def test_add_returns_sum_for_two_comma_separated_numbers
    assert_equal 6, StringCalculator.add("1,5")
    assert_equal 30, StringCalculator.add("10,20")
  end
end
