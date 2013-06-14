ActiveAdmin.register Category do
  index do
    column :id, :sortable => :id do |category|
      link_to category.id, admin_post_path(category)
    end
    column :title, :sortable => :title do |category|
      link_to category.title, admin_category_path(category)
    end
    column :description
    column :created_at
    default_actions
  end
  
  filter :title
  filter :description
  filter :created_at
end
