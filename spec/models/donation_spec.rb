require "spec_helper"

describe Donation do
  context "validations" do
    it { should validate_presence_of :description }
    it { should validate_presence_of :poundage }
  end
end
