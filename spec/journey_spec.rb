require 'journey'

describe Journey do

  subject(:journey) { described_class.new }

    it 'checks if journey is complete' do
      expect(journey.complete?).to eq true
    end

    it 'should have an empty list of journeys by default' do
      expect(journey.journeys). to eq []
    end

  context 'touch in and out methods on journey' do

    before (:each) do
      journey.start_journey(Station.new "Aldgate")
    end

    it 'starts a journey', :focus => true do
     expect(journey.start_journey(Station.new "Aldgate")).to eq journey.entry_station
    end

  it 'ends a journey' do
    expect(journey.end_journey(Station.new "Nottinghill gate")).to eq journey.exit_station
  end

  it "should store journey details (entry and exit stations)" do
    journey.end_journey(Station.new "Nottinghill gate")
    expect(journey.journeys).to include journey.current_journey
  end

  it "should forget entry station after touching out" do
    journey.end_journey(Station.new "Nottinghill gate")
    expect(journey.entry_station).to eq nil
  end
end

end
