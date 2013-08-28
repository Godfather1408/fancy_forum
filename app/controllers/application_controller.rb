class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_search

def set_search
    @q = Topic.search(params[:q])
  end
end
