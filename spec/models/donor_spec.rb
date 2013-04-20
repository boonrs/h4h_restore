require "spec_helper"

describe Donor do
  context "validations" do
    it { should validate_presence_of :zipcode }

    it "requires name or company" do
      FactoryGirl.build(:donor, name: nil, company: nil).should_not be_valid
      FactoryGirl.build(:donor, name: "sue", company: nil).should be_valid
      FactoryGirl.build(:donor, name: nil, company: "acme").should be_valid
    end
  end

  context "associations" do
    it { should have_many :donations }
    it { should have_many :coordinations }
  end
end
