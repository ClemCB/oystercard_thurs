class Journey

attr_reader :entry_station, :exit_station, :journeys, :current_journey, :in_journey

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
    @in_journey = false
  end


  def start_journey(station)
    if in_journey?
      Oystercard::PENALTY_FARE
    else
      @in_journey = true
      @entry_station = station.name
    end
    # @in_journey = true
    # @entry_station != nil ? Oystercard::PENALTY_FARE : @entry_station = station.name
  end

  def end_journey(station)
      @exit_station = station.name
    if @entry_station != nil
        save_journey
        @entry_station = nil
        @in_journey = false
    else
      Oystercard::PENALTY_FARE
    end
  end

  def save_journey
    @current_journey = { "entry" => @entry_station, "exit" => @exit_station}
    @journeys << @current_journey
  end

  def in_journey?
    @in_journey
  end

  def fare_checker
      in_journey? ? Oystercard::PENALTY_FARE : Oystercard::MIN_FARE
  end

end
