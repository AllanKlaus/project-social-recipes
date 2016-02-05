class CreateKitchens < ActiveRecord::Migration
  def change
    create_table :kitchens do |t|

      t.timestamps null: false
    end
  end
end
