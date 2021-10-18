require 'oystercard'

describe Oystercard do
  it 'checks balance has default value of 0' do
    oystercard = Oystercard.new
    expect(oystercard.money).to eq Oystercard::DEFAULT_VALUE
  end

end