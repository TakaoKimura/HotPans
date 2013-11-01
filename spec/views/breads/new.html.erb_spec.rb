require 'spec_helper'

describe "breads/new" do
  before(:each) do
    assign(:bread, stub_model(Bread,
      :name => "MyString",
      :kind => "MyString"
    ).as_new_record)
  end

  it "renders new bread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", breads_path, "post" do
      assert_select "input#bread_name[name=?]", "bread[name]"
      assert_select "input#bread_kind[name=?]", "bread[kind]"
    end
  end
end
