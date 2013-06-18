class HomeController < ApplicationController
  
  add_breadcrumb "Home", "/"
  
  def index
     @categories = Category.all
     @topics = Topic.important
  end
end
