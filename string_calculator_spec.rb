require_relative 'string_calculator'

RSpec.describe StringCalculator do
  context '#add' do
    it 'should return the number when input is a single number' do
      expect(StringCalculator.add('1')).to eq(1)
    end

    it 'should return the sum of two numbers when input is comma-separated numbers' do
      expect(StringCalculator.add('1,2')).to eq(3)
    end

    it 'should returns the sum of multiple numbers when input is comma-separated numbers' do
      expect(StringCalculator.add('1,2,3,4')).to eq(10)
    end

    it 'should handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'should throws an exception for input with only new line after comma ' do
      expect { StringCalculator.add("1,\n") }.to raise_error("Given input is Not ok")
    end

    it 'should handles 2 digits and 3 digits numbers' do
      expect(StringCalculator.add("1, 22, 333")).to eq(356)
    end

    it 'should supports different delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'should supports different delimiters with 2 or 3 digits' do
      expect(StringCalculator.add("//;\n11;222")).to eq(233)
    end

    it 'should throws an exception for negative numbers' do
      expect { StringCalculator.add("-1,2,-3") }.to raise_error("negatives not allowed -1,-3")
    end

    it 'should ignores numbers greater than 1000' do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    it 'should supports delimiters of any length' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'should supports delimiters of any length with 2 or 3 digits' do
      expect(StringCalculator.add("//[***]\n1***44***333")).to eq(378)
    end

    it 'should supports multiple delimiters' do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it 'should supports multiple delimiters with length longer than one char' do
      expect(StringCalculator.add("//[**][%%]\n1**2%%3")).to eq(6)
    end
  end
end