require 'journey'

describe Journey do

  subject(:journey) { described_class.new }

  it 'starts a journey' do
    expect(journey.start_journey(Station.new "Aldgate")).to eq journey.entry_station
  end

  it 'checks if journey is complete' do
    # returns false now because no exit station, will need to fix test such
    # that it returns true when complete
    expect(journey.complete?).to eq false
  end

  it 'ends a journey' do
    expect(journey.end_journey(Station.new "Nottinghill gate")).to eq journey.exit_station
  end

  it "should store journey details (entry and exit stations)", :focus => true do
    journey.start_journey(Station.new "Aldgate")
    journey.end_journey(Station.new "Nottinghill gate")
    expect(journey.journeys).to include journey.current_journey
  end

  it "should forget entry station after touching out" do
    journey.start_journey(Station.new "Aldgate")
    journey.end_journey(Station.new "Nottinghill gate")
    expect(journey.entry_station).to eq nil
  end

end
