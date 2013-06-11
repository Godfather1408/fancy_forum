class HomeController < ApplicationController
  def index
     @categories = Category.all
     @topics = Topic.important
  end
end
