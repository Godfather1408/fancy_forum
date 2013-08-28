class SearchController < ApplicationController
  def index
    @qu = Topic.search(params[:q])
    @topics = @qu.result(:distinct => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end
end