class RemoveFavoriteFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :favorite, :integer
  end
end
