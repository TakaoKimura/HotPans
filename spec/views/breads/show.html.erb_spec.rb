require 'spec_helper'

describe "breads/show" do
=begin  
  before(:each) do
    @bread = assign(:bread, stub_model(Bread,
      :name => "Name",
      :kind => "Kind"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Kind/)
  end
=end  
end
