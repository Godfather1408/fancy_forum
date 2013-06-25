class SearchController < ApplicationController
  def index
    if params[:search].present?
      if true
        @search = User.search(params[:search])
        @users = @search.all
      else
        @search = Topic.search(params[:search])
        @topics = @search.all
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end