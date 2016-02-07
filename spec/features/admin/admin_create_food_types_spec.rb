require 'rails_helper'

feature 'Admin create food types' do
  scenario 'successfully' do
    login(create(:admin))

    food_type = create(:food_type)

    visit new_food_type_path

    fill_in 'food_type[name]', with: food_type.name

    click_on 'submit'

    expect(page).to have_content food_type.name
  end

  scenario 'unlogged admin' do
    visit new_food_type_path
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario 'unsuccessfully, blank fields' do
    login(create(:admin))

    visit new_food_type_path

    click_on 'submit'

    expect(page).to have_content I18n.t('errors.messages.blank')
  end

  scenario 'unauthorized user' do
    login

    visit new_food_type_path

    expect(current_path).to eq root_path
  end
end
