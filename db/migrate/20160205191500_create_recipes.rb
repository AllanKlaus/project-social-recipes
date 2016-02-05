class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :kitchen, index: true, foreign_key: true
      t.references :food_type, index: true, foreign_key: true
      t.references :preference, index: true, foreign_key: true
      t.integer :serves
      t.integer :time
      t.string :difficulty
      t.text :ingredients
      t.text :steps
      t.attachment :photo
    end
  end
end
