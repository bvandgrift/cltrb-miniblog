class PostsController < InheritedResources::Base
  before_filter :authenticate

  def create; super { |format| format.html { redirect_to posts_path } }; end
end
