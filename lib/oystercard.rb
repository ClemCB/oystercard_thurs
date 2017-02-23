require_relative 'station'
require_relative 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey_one

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @journey_one = Journey.new
  end

  def top_up(amount)
    raise "You can't have a balance more than #{MAX_BALANCE}!" if balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Your balance is less than #{MIN_FARE}!" if @balance < MIN_FARE
    @journey_one.start_journey(station)
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey_one.end_journey(station)
  end

  private

  def deduct(fee)
    #journey.farecheck
    @balance -= fee
  end

end
