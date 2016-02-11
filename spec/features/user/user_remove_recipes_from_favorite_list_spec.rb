require 'rails_helper'

feature 'User remove a recipe to his favorite list' do
  scenario 'successfully' do
    user = login

    recipe = create(:recipe)
    visit recipe_path(recipe)
    click_on I18n.t('generic.add_favorite_list')

    favorites_count = user.favorites.count
    visit favorite_recipes_path

    click_on I18n.t('generic.delete')

    expect(favorites_count - 1).to eq user.favorites.count
  end
end
