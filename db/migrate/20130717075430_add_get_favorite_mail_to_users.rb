class AddGetFavoriteMailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :get_favorite_mail, :boolean, default: true
  end
end
