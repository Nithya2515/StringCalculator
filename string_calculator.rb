class StringCalculator

  def self.add(string)
    check_valid_input(string)
    numbers_array = string.split(/[^[-]\d]/).map(&:to_i)
    validate_negetive_numbers(numbers_array)
    numbers_array.select { |num| num <= 1000 }.sum
  end

  private

  def self.check_valid_input(string)
    invalid_ip = string.split(',').include?("\n")
    raise "Given input is Not ok" if invalid_ip
  end

  def self.validate_negetive_numbers(numbers_array)
    negatives = numbers_array.select { |num| num.negative? }
    raise "negatives not allowed #{negatives.join(',')}" if negatives.any?
  end

end
