require 'rails_helper'

feature 'User recommend a recipe' do
  scenario 'successfully' do
    login
    user = build(:user)
    recipe = create(:recipe)
    visit recommend_recipe_path(recipe)

    fill_in 'recipe[friend_name]',  with: user.name
    fill_in 'recipe[friend_email]', with: user.email
    fill_in 'recipe[message]',      with: FFaker::Lorem.paragraph(2)

    click_on 'submit'

    expect(page).to have_content I18n.t('generic.success', user.name)
  end

  scenario 'unsuccessfully' do
    recipe = create(:recipe)
    visit recommend_recipe_path(recipe)
    expect(page).to have_content I18n.t('generic.login')
  end
end