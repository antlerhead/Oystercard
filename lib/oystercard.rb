class Oystercard

  attr_reader :balance

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def deduct(pay_out)
  #   # fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance -= pay_out 
  end 

  def journey?
    false
  end

  def touch_in
  end


end 