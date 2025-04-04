# String Calculator

A simple Ruby-based string calculator that sums numbers provided in a string. It supports comma and newline delimiters by default and allows custom delimiters. Negative numbers are not allowed and will throw an exception.

## Features

- **Empty Input:** Returns 0 for an empty string.
- **Single or Multiple Numbers:** Supports adding a single number or multiple comma-separated numbers.
- **Newline Delimiters:** Handles newlines as delimiters in addition to commas.
- **Custom Delimiters:** Use a custom delimiter by prefixing the input with a line of the form `//[delimiter]`.  
  *Example:*  
  `//;\n1;2` returns `3`.
- **Negative Numbers:** Throws an exception listing all negative numbers if any are provided.

## Usage

You can use the `StringCalculator.add` method to sum the numbers in a given string.

**Examples:**

```ruby
StringCalculator.add("")             # => 0
StringCalculator.add("1")            # => 1
StringCalculator.add("1,5")          # => 6
StringCalculator.add("1\n2,3")       # => 6
StringCalculator.add("//;\n1;2")     # => 3
```

## How It Works

1. **Default Delimiters:**  
   The calculator uses commas and newlines as default delimiters.

2. **Custom Delimiters:**  
   If the input string begins with `//`, the code extracts the custom delimiter and then processes the numbers accordingly.

3. **Parsing and Summing:**  
   The string is split based on the identified delimiter(s), and the resulting numbers are summed.

4. **Handling Negatives:**  
   If negative numbers are present, an exception is raised with a message listing the negatives.

## Running Tests

Tests are written using Rails' built-in testing framework (ActiveSupport::TestCase). To run the tests, navigate to your project directory in the terminal and execute:

```bash
rails test
```

Or, if you are using a different test runner, adjust the command as necessary.

## Setup

1. **Clone the Repository:**

```bash
git clone <repository-URL>
cd IncubyteAssesment
```

2. **Install Dependencies:**  
   Make sure you have Ruby and Rails installed. Then run:

```bash
bundle install
```

3. **Run the Application or Tests:**  
   Follow the test running instructions above to verify that everything is working as expected.