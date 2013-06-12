class ForumController < ApplicationController
  def topic
    @topic = Topic.find(params[:id])
  end
  
  def category
    @topics = Category.find(params[:id]).topics
  end
end
