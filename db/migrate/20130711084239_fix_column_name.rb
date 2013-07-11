class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :messages, :adressee_id, :user_id
  end
end
