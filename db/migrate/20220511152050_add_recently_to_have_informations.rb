class AddRecentlyToHaveInformations < ActiveRecord::Migration[6.0]
  def change
    add_column :have_informations, :recently, :boolean, default: false
  end
end
