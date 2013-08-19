require 'spec_helper'

describe "beta/show" do
  before(:each) do
    @betum = assign(:betum, stub_model(Betum,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
