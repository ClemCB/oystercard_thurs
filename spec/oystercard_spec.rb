require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

describe "initialization" do
  it "should has a balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  it "should have an empty list of journeys by default" do
    expect(oystercard.journeys). to eq []
  end
end
  describe '.top_up' do

    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "can top_up the balance" do
      expect{ oystercard.top_up(10)}.to change { oystercard.balance }.by 10
    end

    it "should raise an error if balance is greater than 90" do
      expect{oystercard.top_up(100)}.to raise_error "You can't have a balance more than 90!"
    end

    it "should raise an error if balance is exceeded" do
      max_balance = Oystercard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect{oystercard.top_up(1)}.to raise_error "You can't have a balance more than 90!"
    end

  end

  describe ".in_journey?" do

    it "should return the status of trip in_journey" do
      expect(oystercard.in_journey?).to eq false
    end

  end

  describe "touching in and out" do

    before :each do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
    end

    describe ".touch_in" do

      it "should change the status of trip to in journey" do
        expect(oystercard.in_journey?).to eq true
      end

    end


    describe ".touch_out" do
      before :each do
          oystercard.touch_out(exit_station)
      end

      it "should change the status of trip to not in journey" do
        expect(oystercard).to_not be_in_journey
      end

      it "should deduct the fee" do
        expect{oystercard.touch_out(exit_station)}.to change {oystercard.balance}.by -Oystercard::MIN_FARE
      end


      it "should remember the exit station" do
        expect(oystercard.exit_station).to eq exit_station
      end

      it "should store journey details (entry and exit stations)" do
        expect(oystercard.journeys).to eq [{ "entry" => entry_station, "exit" => exit_station}]
      end

      it "should forget entry station after touching out" do
        expect(oystercard.entry_station).to eq nil
      end
    end

  end

  context "balance too low" do

    it "should raise an error if balance is less than £#{Oystercard::MIN_FARE}" do
      expect{oystercard.touch_in(entry_station)}.to raise_error "Your balance is less than #{Oystercard::MIN_FARE}!"
    end

  end

end
