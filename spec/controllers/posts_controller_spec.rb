require 'spec_helper'

describe PostsController do

  context "when the user is authenticated" do
    before do
      PostsController.any_instance.stubs(:authenticate).returns(true)
    end
    context "The /index page" do
      it "should retrieve the posts" do
        get :index
        assigns(:posts)
      end
    end
    context "The /new page" do
      it "should show us a form" do
        get :new
        assigns(:post)
        response.should render_template(:new)
      end
    end
    
    context "The /show page" do
      it "should show us a post" do
        post = Factory.create(:post)
        2.times {Factory.create(:comment)}
        5.times {Factory.create(:comment, :post => post)}
        get :show, :id => post.id
        assigned_post = assigns[:post]
        assigned_post[:title].should == post.title
        assigned_post.comments.count.should == 5
      end
    end
    context "the /delete page" do
      it "should kill a post" do
        post = Factory.create(:post)
        lambda {
          delete :destroy, :id => post.id
        }.should change(Post, :count).by(-1)
      end
    end
  end
  
  context "when there is no current_user" do
    context "The /index page" do
      it "should retrieve the posts" do
        get :index
        response.code.should redirect_to sign_in_url
      end
    end

  end
  
end
