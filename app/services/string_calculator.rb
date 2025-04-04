class StringCalculator
  DEFAULT_DELIMITERS = /[,\n]/

  def self.add(numbers_string)
    return 0 if numbers_string.empty?
    numbers = numbers_string.split(DEFAULT_DELIMITERS).map(&:to_i)
    numbers.sum
  end
end
