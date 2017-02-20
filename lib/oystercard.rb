class Oystercard

  MAX_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "You can't have a balance more than 90!" if @balance + amount > MAX_LIMIT
    @balance += amount
  end

end
