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
end
