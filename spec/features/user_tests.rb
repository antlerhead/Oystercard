describe 'user testing' do

# In order to use public transport
# As a customer
# I want money on my card

it 'check if money is on the card' do
  it 'checks balance has default value of 0' do
  oystercard = Oystercard.new
  expect (oystercard.money).to eq Oystercard::DEFAULT_VALUE
end
 
end 