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

  def test_add_supports_single_custom_delimiter
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end
  
  def test_add_supports_different_custom_delimiter
    assert_equal 6, StringCalculator.add("//*\n1*2*3")
  end
  
  def test_add_handles_custom_delimiter_definition_with_no_numbers
    assert_equal 0, StringCalculator.add("//;\n")
  end
  
   def test_add_handles_custom_delimiter_with_one_number
     assert_equal 5, StringCalculator.add("//;\n5")
   end
  
  def test_add_correctly_handles_regex_special_character_delimiter
    assert_equal 6, StringCalculator.add("//.\n1.2.3")
  end

  def test_add_throws_exception_for_single_negative_number
    exception = assert_raises(RuntimeError) do
      StringCalculator.add("1,-2,3")
    end
    assert_equal "negative numbers not allowed -2", exception.message
  end
  
  def test_add_throws_exception_listing_all_negative_numbers
    exception = assert_raises(RuntimeError) do
      StringCalculator.add("//;\n1;-2;3;-4;-5")
    end
    assert_equal "negative numbers not allowed -2,-4,-5", exception.message
  end
  
  def test_add_does_not_throw_exception_for_zero_or_positives
    assert_nothing_raised do
       StringCalculator.add("1,0,2")
       StringCalculator.add("//;\n1;0;2")
    end
    assert_equal 3, StringCalculator.add("1,0,2")
    assert_equal 3, StringCalculator.add("//;\n1;0;2")
  end
end
