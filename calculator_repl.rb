#!/usr/bin/env ruby

require 'readline'
require_relative 'calculator'

# handle ^c
trap('INT') { puts 'Goodbye'; exit }

class CalculatorRepl
  def initialize
    @calculator = Calculator.new
  end

  def run
    while input = Readline.readline('> ', true)
      begin
        if input == 'q'
          puts 'Goodbye'
          exit
        end

        result = input
        result = @calculator.operate(input)
      rescue StandardError => e
        puts "\e[31m#{e.class}:\e[0m #{e.message}"
      else
        puts result
      end
    end
  end
end
