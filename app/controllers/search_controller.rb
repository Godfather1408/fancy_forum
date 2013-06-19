class SearchController < ApplicationController
  def index
    if params[:search].present?
      if true
        @search = Sunspot.search(User) do
          fulltext params[:search]
        end
        @users = @search.results
      else
        @search = Sunspot.search(Topic) do
          fulltext params[:search]
        end
        @topics = @search.results
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
end
