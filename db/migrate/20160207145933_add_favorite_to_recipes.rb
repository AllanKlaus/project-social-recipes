class AddFavoriteToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :favorite, :integer
  end
end
