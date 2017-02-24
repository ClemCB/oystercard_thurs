require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  let(:entry_station) { double :station, :name => "Aldgate" }
  let(:exit_station) { double :station, :name => "Nottinghil gate" }
  let(:journey) { { "entry" => entry_station, "exit" => exit_station} }

  describe "Initialization" do
    it "should has a balance of 0" do
      expect(oystercard.balance).to eq 0
    end
end


  it 'should charge a penalty fare if there is no entry station' do
    oystercard.touch_out(exit_station)
    expect{oystercard.touch_out(exit_station)}.to change {oystercard.balance}.by -Journey::PENALTY_FARE
  end

  describe 'Top Up' do

    it "can top up the balance" do
      expect{ oystercard.top_up(10)}.to change { oystercard.balance }.by 10
    end

    it "should raise an error if balance is exceeded" do
      error_message = "You can't have a balance more than #{Oystercard::MAX_BALANCE}!"
      expect{oystercard.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error error_message
    end
  end

  describe 'Journey' do

  context '#touch-in with no funds' do

    it "should raise an error for insufficient funds" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Your balance is less than #{Oystercard::MIN_FARE}!"
    end

  end

  context '#touch-in' do

    it 'should charge penalty fare if touched-in twice' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect{oystercard.touch_in(entry_station)}.to change {oystercard.balance}.by -Journey::PENALTY_FARE
    end
  end

  context "#touch_out" do

    it "should charge a fee when full journey is complete" do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect{oystercard.touch_out(exit_station)}.to change {oystercard.balance}.by -Oystercard::MIN_FARE
    end


  end
  end
end
