require 'spec_helper'

describe "bread_stores/edit" do
  before(:each) do
    @bread_store = assign(:bread_store, stub_model(BreadStore,
      :name => "MyString",
      :phone_number => "MyString",
      :address => "MyString"
    ))
  end

  it "renders the edit bread_store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bread_store_path(@bread_store), "post" do
      assert_select "input#bread_store_name[name=?]", "bread_store[name]"
      assert_select "input#bread_store_phone_number[name=?]", "bread_store[phone_number]"
      assert_select "input#bread_store_address[name=?]", "bread_store[address]"
    end
  end
end
