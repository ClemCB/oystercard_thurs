class Journey

attr_reader :entry_station, :exit_station, :journeys, :current_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end


  def start_journey(station)
    if @entry_station != nil
      return penalty_fare
    end
    @entry_station = station.name
  end

  def end_journey(station)
    @exit_station = station.name
    #fare check
    save_journey
    @entry_station = nil
    @exit_station
  end

  def save_journey
    @current_journey = { "entry" => @entry_station, "exit" => @exit_station}
    @journeys << @current_journey
  end

  def complete?
    @entry_station == nil && @exit_station == nil
  end

  def fare_checker
  #     if @entry_station == nil || @exit_station == nil
  #       penality_fare
  #     else
    penalty_fare #will want this to call in oystercard
  end

  def penalty_fare
    Oystercard::PENALTY_FARE
  end

end
