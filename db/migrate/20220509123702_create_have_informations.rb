class CreateHaveInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :have_informations do |t|
      t.integer :user_id
      t.integer :information_id

      t.timestamps
    end
    add_index :have_informations, :user_id
    add_index :have_informations, :information_id
    add_index :have_informations, [:user_id, :information_id], unique: true
  end
end

