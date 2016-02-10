require 'rails_helper'

feature 'User create account with his name' do
  scenario 'successfully' do
    user = build(:user)

    visit new_user_registration_path

    fill_in 'user[name]',                   with: user.name
    fill_in 'user[email]',                  with: user.email
    fill_in 'user[password]',               with: user.password
    fill_in 'user[password_confirmation]',  with: user.password

    click_on 'submit'

    expect(User.last).to eq user.name
  end
end
