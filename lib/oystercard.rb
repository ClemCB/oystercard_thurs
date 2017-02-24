require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1


  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance_over_maximum?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Your balance is less than #{MIN_FARE}!" if @balance < MIN_FARE
    @journey.in_journey? ? deduct(Journey::PENALTY_FARE) : @journey.start_journey(station)
  end

  def touch_out(station)
    # @journey.in_journey? ? deduct(MIN_FARE) : deduct(Journey::PENALTY_FARE)
    @journey.end_journey(station)
    deduct(@journey.fare)
  end

  private

  def deduct(fee)
    @balance -= fee
  end

  def balance_over_maximum?(amount)
    @balance + amount > MAX_BALANCE
  end

end
