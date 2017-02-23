class Journey

attr_reader :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end


  def start_journey(station)
    @entry_station = station.name
  end

  # def touch_out(station)
  #   deduct(MIN_FARE)
  #   @exit_station = station
  #   journey_history
  #   @entry_station = nil
  #   @exit_station
  # end

  def end_journey(station)
    @exit_station = station.name
    save_journey
    @entry_station = nil
    @exit_station
  end

  def save_journey
    @current_journey = { "entry" => @entry_station, "exit" => @exit_station}
    @journeys << @current_journey
  end

  def complete?
    @entry_station != nil
    # @exit_station != nil
  end

end
