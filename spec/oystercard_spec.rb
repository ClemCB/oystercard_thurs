require 'oystercard'

describe Oystercard do

  it "should has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "can top_up the balance" do
      expect{ subject.top_up(10)}.to change { subject.balance }.by 10
    end

    it "should raise an error if balance is greater than 90" do
      expect{subject.top_up(100)}.to raise_error "You can't have a balance more than 90!"
    end

  end

end
