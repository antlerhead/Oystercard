require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it 'checks balance has default value of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq Oystercard::DEFAULT_VALUE
  end 

describe '#top_up' do 

  it { is_expected.to respond_to(:top_up).with(1).argument }
  
  it 'can top up balance with credit' do
    expect { oystercard.top_up 20 }.to change{ oystercard.balance }.by 20   
  end
end
end


