class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :group_id
      t.integer :information_id

      t.timestamps
    end
    
    add_index :tags, :group_id
    add_index :tags, :information_id
    add_index :tags, [:group_id, :information_id], unique: true
  end
end
