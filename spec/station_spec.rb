require 'station'

describe Station do

  subject(:station) { described_class.new "Aldgate"}

  it 'knows its name' do
    expect(station.name).to eq "Aldgate"
  end

  it 'returns zone 1 if station begins with letters A-M' do
    expect(station.zone).to eq 1
  end

  it 'returns zone 2 if station begins with letters N-Z' do
    station2 = Station.new "Nottinghill Gate"
    expect(station2.zone).to eq 2
  end

end
