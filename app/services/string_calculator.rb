class StringCalculator
  DEFAULT_DELIMITERS = /[,\n]/

  def self.add(numbers_string)
    return 0 if numbers_string.empty?

    delimiter, string_to_process = extract_delimiter_and_numbers(numbers_string)
    return 0 if string_to_process.empty?

    numbers = parse_numbers(string_to_process, delimiter)
    negatives = numbers.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed #{negatives.join(',')}"
    end
    numbers.sum
  end

  private

  def self.extract_delimiter_and_numbers(input_string)
    if input_string.start_with?("//")
      parts = input_string.split("\n", 2)
      delimiter_definition = parts[0]
      custom_delimiter = delimiter_definition[2..-1]
      delimiter = Regexp.new(Regexp.escape(custom_delimiter))
      numbers_part = parts[1] || ""
      [delimiter, numbers_part]
    else
      [DEFAULT_DELIMITERS, input_string]
    end
  end

  def self.parse_numbers(numbers_part, delimiter)
    return [] if numbers_part.nil? || numbers_part.empty?
    numbers_part.split(delimiter).map(&:to_i)
  end
end
