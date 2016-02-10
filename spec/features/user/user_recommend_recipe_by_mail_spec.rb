require 'rails_helper'

feature 'User recommend a recipe' do
  scenario 'successfully' do
    login
    user = build(:user)
    recipe = create(:recipe)
    visit recommend_recipe_path(recipe)

    fill_in 'name',     with: user.name
    fill_in 'mail',     with: user.email
    fill_in 'message',  with: FFaker::Lorem.paragraph(2)

    click_on 'submit'

    expect(page).to have_content I18n.t('mail.success', friend: user.name)
  end

  scenario 'unsuccessfully' do
    recipe = create(:recipe)
    visit recommend_recipe_path(recipe)
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario 'see link on recipe page' do
    login
    user = build(:user)
    recipe = create(:recipe)
    visit recipe_path(recipe)

    click_on 'recommend'

    expect(current_path).to eq recommend_recipe_path(recipe)
  end
end
