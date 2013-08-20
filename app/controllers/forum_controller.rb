class ForumController < ApplicationController
  
  add_breadcrumb "Home", "/"
  
  def topic
    @topic = Topic.find(params[:id])
    @post = Post.new
    add_breadcrumb @topic.category.title, forum_category_path(:id => @topic.category.id)
    add_breadcrumb @topic.title, topic_path(@topic)
  end
  
  def category
    @category = Category.find(params[:id])
    @topics = @category.topics
    @cat_title = @category.title
    add_breadcrumb @category.title, category_path(@category)
  end
end
