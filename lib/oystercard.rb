class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :station

  def initialize
    @balance = 0
    @station = nil
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @station != nil
  end

  def touch_in(entry_station)
    raise "Your balance is less than #{MIN_FARE}!" if @balance < MIN_FARE
    @station = entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @station = nil
  end

  private

  def deduct(fee)
    @balance -= fee
  end

end
