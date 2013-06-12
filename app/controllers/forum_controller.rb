class ForumController < ApplicationController
  def topic
    @topic = Topic.find(params[:id])
  end
  
  def category
    cat = Category.find(params[:id])
    @topics = cat.topics
    @category = cat.title
  end
end
