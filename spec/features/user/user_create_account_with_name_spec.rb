require 'rails_helper'

feature 'User create account' do
  scenario 'successfully sending name' do
    user = build(:user)

    visit new_user_registration_path

    fill_in 'user[name]',                   with: user.name
    fill_in 'user[email]',                  with: user.email
    fill_in 'user[password]',               with: user.password
    fill_in 'user[password_confirmation]',  with: user.password

    click_on 'submit'
    expect(User.last.name).to eq user.name
  end
    scenario 'unsuccessfully' do
      visit new_user_registration_path

      click_on 'submit'
      expect(page).to have_content I18n.t('errors.messages.blank')
    end

  scenario 'successfully sending city' do
    user = build(:user, city: FFaker::Name.name)

    visit new_user_registration_path

    fill_in 'user[name]',                   with: user.name
    fill_in 'user[email]',                  with: user.email
    fill_in 'user[password]',               with: user.password
    fill_in 'user[password_confirmation]',  with: user.password
    fill_in 'user[city]',                   with: user.city

    click_on 'submit'
    expect(User.last.city).to eq user.city
  end
end
