class AddExplanationToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :explanation, :text
  end
end
