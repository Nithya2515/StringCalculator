require_relative 'string_calculator'

RSpec.describe StringCalculator do
  context '#add' do
    it 'should return 0 when input is an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end
  end
end