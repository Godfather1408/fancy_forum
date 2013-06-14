class AddDefaultValueToImportant < ActiveRecord::Migration
  def up
      change_column :topics, :important, :boolean, :default => false
  end

  def down
      change_column :topics, :important, :boolean
  end
end
