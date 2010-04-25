require 'spec_helper'

describe PostTag do
  it "should validate a valid record" do
    Factory.build( :post_tag ).should be_valid
  end

  it "should not validate a record without a post_id" do
    post_tag = Factory.build( :post_tag, :post_id => nil )
    post_tag.should_not be_valid
    post_tag.errors.length.should eql( 1 )
    post_tag.errors[:post_id].should include( "can't be blank" )
  end

  it "should not validate a record without a tag_id" do
    post_tag = Factory.build( :post_tag, :tag_id => nil )
    post_tag.should_not be_valid
    post_tag.errors.length.should eql( 1 )
    post_tag.errors[:tag_id].should include( "can't be blank" )
  end
end
