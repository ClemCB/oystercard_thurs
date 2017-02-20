class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

end
