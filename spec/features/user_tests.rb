describe 'user testing' do

# In order to use public transport
# As a customer
# I want money on my card

it 'check if money is on the card' do
  it 'checks balance has default value of 0' do
  oystercard = Oystercard.new
  expect(oystercard.balance).to eq Oystercard::DEFAULT_VALUE
end
 
# In order to keep using public transport
# As a customer
# I want to add money to my card

it 'adds top up value to the balance of the card' do
  oystercard = Oystercard.new
  # oystercard.top_up(20)
  expect(oystercard).to respond_to(:top_up).with(1).argument
end

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

it 'raises an error if top_up takes balance beyond limit' do 
  oystercard = Oystercard.new
  expect{ oystercard.top_up 100}.to raise_error 'Maximum limit exceeded'
end 

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

it 'deducts money when fare is paid' do
  oystercard = Oystercard.new
  expect(oystercard).to respond_to(:deduct).with(1).argument
end

# In order to get through the barriers.
# As a customer
# I need to touch in and out.

it 'starts not in journey' do
  oystercard = Oystercard.new
  expect(oystercard).not_to be_journey
  # if touch in q journey is true
  # touch out eq journey false
end


end 