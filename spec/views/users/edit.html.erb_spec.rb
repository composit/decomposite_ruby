require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    assign(:user, @user = stub_model(User,
      :new_record? => false,
      :login => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    response.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("input#user_login", :name => "user[login]")
      form.should have_selector("input#user_email", :name => "user[email]")
    end
  end
end
