class FavoritesController < ApplicationController
  def index
    @myfavorites = Favorite.all
  end
  
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favortie }
    end
  end

  # GET /posts/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @favorite = Favorite.new(params[:favorite])
    
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to forum_topic_path(:id => @favorite.topic.id), notice: 'Favorite was successfully created.' }
        format.json { render json: @favorite, status: :created, location: @favorite }
      else
        format.html { render action: "new" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
    end
  end
end
