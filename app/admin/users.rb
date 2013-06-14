ActiveAdmin.register User do
  index do
    column :id, :sortable => :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column :username, :sortable => :username do |user|
      link_to user.username, admin_user_path(user)
    end
    column :first_name
    column :last_name
    column :email
    column :avatar_file_name
    column :created_at
    column :number_of_posts
    default_actions
  end  
end
