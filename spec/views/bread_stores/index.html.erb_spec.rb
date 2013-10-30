require 'spec_helper'

describe "bread_stores/index" do
  before(:each) do
    assign(:bread_stores, [
      stub_model(BreadStore,
        :name => "Name",
        :phone_number => "Phone Number",
        :address => "Address"
      ),
      stub_model(BreadStore,
        :name => "Name",
        :phone_number => "Phone Number",
        :address => "Address"
      )
    ])
  end

  it "renders a list of bread_stores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
  end
end
