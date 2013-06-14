module ForumHelper
  def posts
    @topic.posts.order('created_at ASC').paginate( :page => params[:page], :per_page =>25)
  end
  
  def last_post_from_user?(post)
    @topic.posts.order('created_at DESC').where(:user_id => current_user.id).first.id == post.id
  end
end
