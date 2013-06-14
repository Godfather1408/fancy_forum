ActiveAdmin.register Topic do
    index do
    column :id, :sortable => :id do |topic|
      link_to topic.id, admin_topic_path(topic)
    end
    column :title, :sortable => :title do |topic|
      link_to topic.title, admin_topic_path(topic)
    end
    column :description
    column :category
    column :important
    column :created_at
    column :updated_at
    default_actions
  end  
end