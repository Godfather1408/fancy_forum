module ForumHelper
  def posts
    @topic.posts.order('created_at ASC').paginate( :page => params[:page], :per_page =>25)
  end
end
