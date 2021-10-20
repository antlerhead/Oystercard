class Oystercard

  attr_reader :balance, :minimum_fare

  DEFAULT_VALUE = 0
  MAXIMUM_LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @in_journey = false
    @minimum_fare = 1
  end 

  def top_up(credit)
    fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance += credit 
  end 

  def deduct(pay_out)
  #   # fail "Maximum limit" + MAXIMUM_LIMIT.to_s + "exceeded" if @balance >= MAXIMUM_LIMIT
    @balance -= pay_out 

  end 

  def in_journey?
    # false 
    @in_journey
  end

  def touch_in
    fail 'Not enough funds' if @balance < MINIMUM_BALANCE
    @in_journey = true
    
  end

  def touch_out
    @in_journey = false
    deduct(@minimum_fare)
  end

  # def minimum_fare

  # end


end 