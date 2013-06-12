class ForumController < ApplicationController
  def topic
    @topic = Topic.find(params[:id])
  end
end
