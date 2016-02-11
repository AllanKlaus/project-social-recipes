require 'rails_helper'

feature 'User do search' do
  scenario 'successfully with one result' do
    recipe = create_list(:recipe, 2)

    visit root_path

    fill_in 'recipe[search]', with: recipe[0].name
    click_on 'search'

    expect(page).to have_content recipe[0].name
    expect(page).to_not have_content recipe[1].name
  end

  scenario 'successfully with more than one results' do
    recipe = create_list(:recipe, 2)

    visit root_path

    fill_in 'recipe[search]', with: 'Recipe'
    click_on 'search'

    expect(page).to have_content recipe[0].name
    expect(page).to have_content recipe[1].name
  end

  scenario 'successfully with no results' do
    recipe = create_list(:recipe, 2)

    visit root_path

    fill_in 'recipe[search]', with: 'no results'
    click_on 'search'

    expect(page).to have_content I18n.t('info.no_result', result: I18n.t('generic.recipes'))
    expect(page).to_not have_content recipe[0].name
    expect(page).to_not have_content recipe[1].name
  end
end
