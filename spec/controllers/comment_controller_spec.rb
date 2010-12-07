require 'spec_helper'

describe CommentsController do
  before do
    @post = Factory.create(:post)
  end
  
  context "the index" do
    it "should show all comments associated with the parent article" do
      5.times {Factory.create(:comment, :post => @post)}
      get :index, :post_id => @post.id
      assigns(:comments).count.should == 5
    end
  end
end
