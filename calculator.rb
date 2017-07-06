# monkeypatch string to tell which input is a number
class String
  def is_number?
    true if Float(self)
  rescue
    false
  end
end

class Calculator
  def initialize(input_numbers = [])
    @input_numbers = input_numbers
  end

  def operate(input)
    result = nil
    if input.is_number?
      @input_numbers << input
    else
      case input
      when '+'
        result = add if @input_numbers.length
        @input_numbers = [result]
      when '-'
        result = subtract if @input_numbers.length
        @input_numbers = [result]
      when '*'
        result = multiply if @input_numbers.length
        @input_numbers = [result]
      when '/'
        result = divide if @input_numbers.length
        @input_numbers = [result]
      when 'c'
        result = 'Clear'
        @input_numbers = []
      else
        puts "\e[31m Unreconized input\e[0m"
      end
    end
    result
  end

  def add
    @input_numbers.map(&:to_f).inject(:+)
  end

  def subtract
    @input_numbers.map(&:to_f).inject(:-)
  end

  def multiply
    @input_numbers.map(&:to_f).inject(:*)
  end

  def divide
    raise ZeroDivisionError if @input_numbers.map(&:to_f).last.zero?
    @input_numbers.map(&:to_f).inject(:/)
  end
end
