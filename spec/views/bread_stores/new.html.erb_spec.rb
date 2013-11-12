require 'spec_helper'

describe "bread_stores/new" do
  before(:each) do
    assign(:bread_store, stub_model(BreadStore,
      :name => "MyString",
      :phone_number => "12-34",
      :address => "MyString"
    ).as_new_record)
  end

  it "renders new bread_store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bread_stores_path, "post" do
      assert_select "input#bread_store_name[name=?]", "bread_store[name]"
      assert_select "input#bread_store_phone_number[name=?]", "bread_store[phone_number]"
      assert_select "input#bread_store_address[name=?]", "bread_store[address]"
    end
  end
end
