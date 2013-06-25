class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :read
      t.text :content
      t.string :subject
      t.integer :sender_id
      t.integer :adressee_id

      t.timestamps
    end
  end
end
