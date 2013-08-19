require 'spec_helper'

describe "beta/edit" do
  before(:each) do
    @betum = assign(:betum, stub_model(Betum,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit betum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", betum_path(@betum), "post" do
      assert_select "input#betum_name[name=?]", "betum[name]"
      assert_select "input#betum_email[name=?]", "betum[email]"
    end
  end
end
