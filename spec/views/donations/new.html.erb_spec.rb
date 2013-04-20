require 'spec_helper'

describe "donations/new" do
  before(:each) do
    assign(:donation, stub_model(Donation,
      :description => "MyText",
      :poundage => 1
    ).as_new_record)
  end

  it "renders new donation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", donations_path, "post" do
      assert_select "textarea#donation_description[name=?]", "donation[description]"
      assert_select "input#donation_poundage[name=?]", "donation[poundage]"
    end
  end
end
