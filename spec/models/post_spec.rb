require 'spec_helper'

describe Post do
  it "should validate and create a new record" do
    Factory.build( :post ).should be_valid
  end

  it "should not validate a record without a user_id" do
    post = Factory.build( :post, :user_id => nil )
    post.should_not be_valid
    post.errors.length.should eql( 1 )
    post.errors[:user_id].should include( "can't be blank" )
  end

  it "should not validate a record without any content" do
    post = Factory.build( :post, :content => "" )
    post.should_not be_valid
    post.errors.length.should eql( 1 )
    post.errors[:content].should include( "can't be blank" )
  end
end
