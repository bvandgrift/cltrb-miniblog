class CommentsController < InheritedResources::Base
  belongs_to :post
end
