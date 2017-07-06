require 'spec_helper'

describe CalculatorRepl do
  before do
    @output, @input = PTY.spawn("#{File.dirname(__FILE__)}/../bin/calculator.rb")
  end

  it 'prints an exit message on the exit command' do
    input(@input, @output, 'q')
    expect(get_response(@output)).to eq('Goodbye')
  end

  it 'adds two numbers' do
    input(@input, @output, '1')
    input(@input, @output, '1')
    input(@input, @output, '+')
    expect(get_response(@output)).to eq('2.0')
  end

  it 'handles chained operations' do
    input(@input, @output, '1')
    input(@input, @output, '1')
    input(@input, @output, '+')
    expect(get_response(@output)).to eq('2.0')
    input(@input, @output, '10')
    input(@input, @output, '*')
    expect(get_response(@output)).to eq('20.0')
  end

  it 'handles divide by 0' do
    input(@input, @output, '1')
    input(@input, @output, '0')
    input(@input, @output, '/')
    expect(get_response(@output)).to eq("\e[31mZeroDivisionError:\e[0m ZeroDivisionError")
  end

  it 'handles incorrect input' do
    input(@input, @output, '%')
    expect(get_response(@output)).to eq("\e[31m Unreconized input\e[0m")
  end

  it 'clears previous input' do
    input(@input, @output, '1')
    input(@input, @output, '1')
    input(@input, @output, 'c')
    expect(get_response(@output)).to eq('Clear')
  end

  private

  def input(input, output, command)
    get_prompt(output)
    input.puts command
    get_response(output)
  end

  def get_response(output)
    cnt = 0
    response = nil
    loop do
      response = output.gets.chomp
      break if response || (cnt += 1) > 10
      sleep 0.1
    end
    response
  end

  def get_prompt(output)
    cnt = 0
    until output.getc == '>'
      output.getc
      sleep 0.1
      break if (cnt += 1) > 10
    end
  end
end
