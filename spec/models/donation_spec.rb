require "spec_helper"

describe Donation do
  context "validations" do
    it { should validate_presence_of :donor }

    it "rejects negative poundage" do
      FactoryGirl.build(:donation, poundage: nil).should_not be_valid
      FactoryGirl.build(:donation, poundage: -1).should_not be_valid
      FactoryGirl.build(:donation, poundage: 1).should be_valid
    end

    it "rejects negative value, allows nil" do
      FactoryGirl.build(:donation, value: -1).should_not be_valid
      FactoryGirl.build(:donation, value: 1).should be_valid
      FactoryGirl.build(:donation, value: nil).should be_valid
    end
  end

  context "assoications" do
    it { should belong_to :donor }
    it { should belong_to :coordinator }
  end
end
