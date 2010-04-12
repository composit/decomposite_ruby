require 'spec_helper'

describe User do
  it "should create a new user" do
    Factory( :user ).should be_valid
  end
end
