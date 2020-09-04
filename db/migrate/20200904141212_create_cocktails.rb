class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :category
      t.string :glass
      t.boolean :alcoholic
      t.string :instructions
      t.text :thumbnail

      t.timestamps
    end
  end
end
