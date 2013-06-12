module ForumHelper
  def posts
    posts = @topic.posts.order('created_at ASC')
  end
end
