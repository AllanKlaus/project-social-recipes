class CreateUsersKitchens < ActiveRecord::Migration
  def change
    create_table :users_kitchens do |t|
      t.references :user, index: true, foreign_key: true
      t.references :kitchen, index: true, foreign_key: true
    end
  end
end
