class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Your balance is less than #{MIN_BALANCE}!" if @balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(3)
  end

  private

  def deduct(fee)
    @balance -= fee
  end

end
