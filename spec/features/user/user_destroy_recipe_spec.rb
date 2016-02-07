require 'rails_helper'

feature 'User destroy his recipe' do
  scenario 'successfully' do
    user = login
    recipe = create_list(:recipe, 5, user: user)
    visit destroy_recipe_path(recipe[0])

    expect(page).to_not have_content recipe[0].naem
  end

  scenario 'user unlogger' do
    recipe = create(:recipe)
    visit destroy_recipe_path(recipe)
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario "unsuccessfully, user try to edit a job that don't belong to him" do
    user = login

    recipe = create(:recipe)

    visit destroy_recipe_path(recipe)

    expect(current_path).to eq my_recipes_path
  end
end
