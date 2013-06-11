class AddImportantToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :important, :boolean
  end
end
