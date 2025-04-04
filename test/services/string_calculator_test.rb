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

  def test_add_returns_sum_for_multiple_comma_separated_numbers
    assert_equal 15, StringCalculator.add("1,2,3,4,5")
  end

  def test_add_handles_newlines_as_delimiters
    assert_equal 6, StringCalculator.add("1\n2,3")
    assert_equal 6, StringCalculator.add("1,2\n3")
  end
  
  def test_add_handles_consecutive_delimiters_resulting_in_zero
     assert_equal 3, StringCalculator.add("1,\n2")
  end
end
