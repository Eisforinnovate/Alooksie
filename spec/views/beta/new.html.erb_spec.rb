require 'spec_helper'

describe "beta/new" do
  before(:each) do
    assign(:betum, stub_model(Betum,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new betum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", beta_path, "post" do
      assert_select "input#betum_name[name=?]", "betum[name]"
      assert_select "input#betum_email[name=?]", "betum[email]"
    end
  end
end
