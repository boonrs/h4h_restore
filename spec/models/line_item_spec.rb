require "spec_helper"

describe LineItem do
  context "validations" do
    it { should validate_presence_of :name }

    it "rejects negative quantity" do
      FactoryGirl.build(:line_item, quantity: nil).should_not be_valid
      FactoryGirl.build(:line_item, quantity: -1).should_not be_valid
      FactoryGirl.build(:line_item, quantity: 1).should be_valid
    end
  end
end
