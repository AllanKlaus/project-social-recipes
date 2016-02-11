class AddSlugToFoodTypes < ActiveRecord::Migration
  def change
    add_column :food_types, :slug, :string
    add_index :food_types, :slug
  end
end
