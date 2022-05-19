class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :group_id
    add_index :favorites, [:user_id, :group_id], unique: true
  end
end
