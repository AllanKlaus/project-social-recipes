require 'rails_helper'

feature 'User add a recipe to his favorite list' do
  scenario 'successfully' do
    login

    recipe = create(:recipe)

    visit recipe_path(recipe)
    click_ok I18n.t('generic.favorite')

    expect(page).to have_content recipe.name
  end

  scenario 'user unlogger' do
    recipe = create(:recipe)

    visit recipe_path(recipe)
    expect(page).to_not have_content I18n.t('generic.favorite')
  end
end
