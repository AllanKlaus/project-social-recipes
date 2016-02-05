class CreateFoodTypes < ActiveRecord::Migration
  def change
    create_table :food_types do |t|

      t.timestamps null: false
    end
  end
end
