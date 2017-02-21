class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(fee)
    @balance -= fee
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
