ActiveAdmin::Dashboards.build do
  
  section "Recent Users" do
    table_for User.order("created_at desc").limit(5) do
      column :username do |user|
        link_to user.username, admin_user_path(user)
      end
      column :created_at
    end
    strong { link_to "View All Users", admin_users_path }
  end
  
  section "Recent Topics" do
    table_for Topic.order("created_at desc").limit(5) do
      column :title do |topic|
        link_to topic.title, admin_topic_path(topic)
      end
      column :created_at
      column :category
      column :number_of_posts
    end
    strong { link_to "View All Topics", admin_topics_path }
  end
  
  section "Recent Posts" do
    table_for Post.order("created_at desc").limit(5) do
      column :title do |post|
        link_to post.id, admin_post_path(post)
      end
      column :created_at
      column :user
      column :topic
    end
    strong { link_to "View All Posts", admin_posts_path }
  end
  
  section "Recent Categories" do
    table_for Category.order("created_at desc").limit(5) do
      column :title do |category|
        link_to category.title, admin_post_path(category)
      end
      column :description
      column :created_at
    end
    strong { link_to "View All Categories", admin_categories_path }
  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }
end
