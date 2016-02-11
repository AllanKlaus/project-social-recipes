class AddSlugToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :slug, :string
    add_index :preferences, :slug
  end
end
