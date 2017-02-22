class Journey

attr_reader :entry_station

  def initialize
    @oystercard = Oystercard.new
  end


  def start_journey(station)
    @entry_station = station.name
  end


  def complete?
    @entry_station != nil
    # @exit_station != nil
  end

  # extracted from oystercard.rb, refactor to be applied to Journey
  # def journey_history
  #   journey = { "entry" => @entry_station, "exit" => @exit_station}
  #   @journeys << journey
  # end


end
