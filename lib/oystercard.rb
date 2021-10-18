class Oystercard

  attr_reader :money

  DEFAULT_VALUE = 0

  def initialize(money = DEFAULT_VALUE)
    @money = money
  end 


end 