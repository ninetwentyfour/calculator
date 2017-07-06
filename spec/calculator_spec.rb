describe Calculator do
  before do
    @calculator = Calculator.new
  end

  it 'should support addition' do
    result = Calculator.new(%w[2 2]).add
    expect(result).to eq 4.0
  end

  it 'should support subtraction' do
    result = Calculator.new(%w[3 2]).subtract
    expect(result).to eq 1.0
  end

  it 'should support multiplication' do
    result = Calculator.new(%w[3 2]).multiply
    expect(result).to eq 6.0
  end

  it 'should support division' do
    result = Calculator.new(%w[6 2]).divide
    expect(result).to eq 3.0
  end

  it 'should raise an error if dividing by 0' do
    expect do
      Calculator.new(%w[6 0]).divide
    end.to raise_error(ZeroDivisionError)
  end
end
