require 'spec_helper'

describe "breads/edit" do
  before(:each) do
    @bread = assign(:bread, stub_model(Bread,
      :name => "MyString",
      :kind => "MyString"
    ))
  end

  it "renders the edit bread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bread_path(@bread), "post" do
      assert_select "input#bread_name[name=?]", "bread[name]"
      assert_select "input#bread_kind[name=?]", "bread[kind]"
    end
  end
end
