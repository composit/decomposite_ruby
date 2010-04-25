require 'spec_helper'

describe Tag do
  it "should validate a valid record" do
    Factory.build( :tag ).should be_valid
  end

  it "should not validate a record without a name" do
    tag = Factory.build( :tag, :name => "" )
    tag.should_not be_valid
    tag.errors.length.should eql( 1 )
    tag.errors[:name].should include( "can't be blank" )
  end
end
