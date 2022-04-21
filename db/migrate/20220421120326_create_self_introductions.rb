class CreateSelfIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :self_introductions do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :self_introductions, [:user_id, :created_at]
  end
end
