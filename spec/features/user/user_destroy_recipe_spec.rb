require 'rails_helper'

feature 'User destroy his recipe' do
  scenario 'successfully' do
    user = login
    recipe = create_list(:recipe, 5, user: user)
    visit my_recipes_path

    click_on recipe[0]

    expect(page).to_not have_content recipe[0].name
  end

  scenario 'user unlogger' do
    recipe = create(:recipe)
    visit my_recipes_path
    expect(page).to have_content I18n.t('generic.login')
  end
end
