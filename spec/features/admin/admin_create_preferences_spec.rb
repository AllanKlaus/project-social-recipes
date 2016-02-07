require 'rails_helper'

feature 'Admin create preferences' do
  scenario 'successfully' do
    login(create(:admin))

    preference = create(:preference)

    visit new_preference_path

    fill_in 'preference[name]', with: preference.name

    click_on 'submit'

    expect(page).to have_content preference.name
  end

  scenario 'unlogged admin' do
    visit new_preference_path
    expect(page).to have_content I18n.t('generic.login')
  end

  scenario 'unsuccessfully, blank fields' do
    login(create(:admin))

    visit new_preference_path

    click_on 'submit'

    expect(page).to have_content I18n.t('errors.messages.blank')
  end

  scenario 'unauthorized user' do
    login

    visit new_preference_path

    expect(current_path).to eq root_path
  end
end
