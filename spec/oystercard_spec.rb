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

  it 'raises an error if top_up takes balance beyond limit' do 
    max_limit = Oystercard::MAXIMUM_LIMIT
    oystercard.top_up(max_limit)
    expect { oystercard.top_up 5 }.to raise_error "Maximum limit" + max_limit.to_s + "exceeded"
  end 

  describe 'deduct' do
    it 'deducts money from balance when card is used to pay fare' do
      expect { oystercard.deduct 20 }.to change{ oystercard.balance }.by -20   
    end
  end

  describe 'Journey' do
    it 'starts not in journey' do
      oystercard = Oystercard.new
      expect(oystercard).not_to be_in_journey
      # if touch in q journey is true
      # touch out eq journey false
    end

    it 'touch in' do
      # oystercard = Oystercard.new
      oystercard.top_up(5)
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq(true)
    end

    it 'touch out' do
      oystercard.top_up(5)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it 'to raise error if balace is less than 1' do
      oystercard.top_up(0)
      # oystercard.touch_in
      expect { oystercard.touch_in.balance < MINIMUM_BALANCE }.to raise_error 'Not enough funds'

    end

#     In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card
    it 'deduct amount minimum when tap out' do
      oystercard.top_up(5)
      expect {oystercard.touch_out}.to change{oystercard.balance}.by(-oystercard.minimum_fare)
    end


  end

end
end


