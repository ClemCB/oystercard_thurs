require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:entry_station){double :station, :name => 'Aldgate' }
  let(:exit_station){double :station, :name => 'Waterloo' }

    it 'checks if in_journey is false by default' do
      expect(journey.in_journey?).to eq false
    end

    it 'checks if in journey after only touch in' do
      journey.start_journey(entry_station)
      expect(journey.in_journey?).to eq true
    end

    it 'should have an empty list of journeys by default' do
      expect(journey.journeys). to eq []
    end

    it 'starts a journey' do
      journey.start_journey(entry_station)
     expect(journey.entry_station).to eq entry_station.name
    end

    context 'touch in and out methods on journey' do

    before (:each) do
      journey.start_journey(entry_station)
    end

  it 'ends a journey' do
    journey.end_journey(exit_station)
    expect(journey.exit_station).to eq exit_station.name
  end

  it "should store journey details (entry and exit stations)" do
    journey.end_journey(exit_station)
    expect(journey.journeys).to include journey.current_journey
  end

  it "should forget entry station after touching out" do
    journey.end_journey(exit_station)
    expect(journey.entry_station).to eq nil
  end

end

  context 'raising a penalty fare' do

  it 'charges penalty fare if not tapped in' do
    expect(journey.end_journey(exit_station)).to eq Oystercard::PENALTY_FARE #will want this to call in oystercard
  end

  it 'charges penalty fare if tapped in twice' do
    journey.start_journey(entry_station)
    expect(journey.start_journey(entry_station)).to eq Oystercard::PENALTY_FARE
  end

  it { is_expected.to respond_to(:fare_checker) }


  it 'on touch out, the minimum fare is charged' do
    journey.start_journey(entry_station)
    journey.end_journey(exit_station)
    expect(journey.fare_checker).to eq (Oystercard::MIN_FARE)
  end

end
end
