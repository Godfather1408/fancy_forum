class ForumController < ApplicationController
  def topic
    @topic = Topic.find(params[:id])
    @post = Post.new
  end
  
  def category
    @category = Category.find(params[:id])
    @topics = @category.topics
    @cat = @category.title
  end
end
