require "spec_helper"

describe Donation do
  context "validations" do
    it { should validate_presence_of :poundage }
    it { should validate_presence_of :donor }
  end

  context "assoications" do
    it { should belong_to :donor }
    it { should belong_to :coordinator }
  end
end
