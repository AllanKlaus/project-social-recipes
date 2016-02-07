require 'rails_helper'

feature 'Admin create kitchens' do
  scenario 'successfully' do
    login(create(:admin))

    kitchen = create(:kitchen)

    visit new_kitchen_path

    fill_in 'kitchen[name]', with: kitchen.name

    click_on 'submit'

    expect(page).to have_content kitchen.name
  end

  scenario 'unlogged admin' do
    visit new_kitchen_path
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario 'unsuccessfully, blank fields' do
    login(create(:admin))

    visit new_kitchen_path

    click_on 'submit'

    expect(page).to have_content I18n.t('errors.messages.blank')
  end

  scenario 'unauthorized user' do
    login

    visit new_kitchen_path

    expect(current_path).to eq root_path
  end
end
