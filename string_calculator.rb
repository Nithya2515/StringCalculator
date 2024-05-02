class StringCalculator

  def self.add(string)
    numbers_array = string.split(",").map(&:to_i)
    numbers_array.sum
  end

end
