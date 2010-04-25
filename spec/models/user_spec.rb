require 'spec_helper'

describe User do
  it "should create a new user" do
    Factory( :user ).should be_valid
  end

  it "should not create a user without a login" do
    user = Factory.build( :user, :login => nil )
    user.should_not be_valid
    user.errors.length.should eql( 1 )
    user.errors[:login].should include( "can't be blank" )
  end

  it "should not create a user without a password" do
    user = Factory.build( :user, :password => "", :password_confirmation => "" )
    user.should_not be_valid
    user.errors.length.should eql( 4 )
    user.errors[:password].should include( "is too short (minimum is 4 characters)" )
  end

  it "should not create a user with mismatched passwords" do
    user = Factory.build( :user, :password => "1234", :password_confirmation => "abcd" )
    user.should_not be_valid
    user.errors.length.should eql( 1 )
    user.errors[:password].should include( "doesn't match confirmation" )
  end

  it "should not create a user without an email" do
    user = Factory.build( :user, :email => nil )
    user.should_not be_valid
    user.errors.length.should eql( 1 )
    user.errors[:email].should include( "can't be blank" )
  end

  it "should not create a user with an improperly formatted email" do
    user = Factory.build( :user, :email => "abcdef" )
    user.should_not be_valid
    user.errors.length.should eql( 1 )
    user.errors[:email].should include( "should look like an email address." )
  end
end
