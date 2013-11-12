require 'spec_helper'

describe "bread_stores/show" do
=begin  
  before(:each) do
    @bread_store = assign(:bread_store, stub_model(BreadStore,
      :name => "Name",
      :phone_number => "12-34",
      :address => "Address"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Address/)
  end
=end
end
