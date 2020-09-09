class AddUsercreatedToCocktailsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :user_made, :boolean
  end
end
