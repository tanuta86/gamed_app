class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.string :category
      t.string :content

      t.timestamps
    end
  end
end
