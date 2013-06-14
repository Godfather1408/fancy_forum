ActiveAdmin.register Post do
  index do
    column :id, :sortable => :id do |post|
      link_to post.id, admin_post_path(post)
    end
    column :content do |post|
      link_to post.content, admin_post_path(post)
    end
    column :topic
    column :user
    column :created_at
    column :updated_at
    default_actions
  end   
end
