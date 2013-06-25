class SearchController < ApplicationController
  def index
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end