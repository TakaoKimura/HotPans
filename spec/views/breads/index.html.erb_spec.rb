require 'spec_helper'

describe "breads/index" do
  before(:each) do
    assign(:breads, [
      stub_model(Bread,
        :name => "Name",
        :kind => "Kind"
      ),
      stub_model(Bread,
        :name => "Name",
        :kind => "Kind"
      )
    ])
  end

  it "renders a list of breads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
  end
end
