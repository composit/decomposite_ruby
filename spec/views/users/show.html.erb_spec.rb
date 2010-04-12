require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    assign(:user, @user = stub_model(User,
      :login => "MyString",
      :email => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
    response.should contain("MyString")
  end
end
