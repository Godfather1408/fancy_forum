class HomeController < ApplicationController
  def index
     @categories = Category.all
     @topics = Topic.all
  end
end
