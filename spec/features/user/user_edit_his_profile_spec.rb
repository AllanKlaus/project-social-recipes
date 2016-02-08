require 'rails_helper'

feature 'User edit his profile' do
  scenario 'successfully' do
    user = login

    create_list(:kitchen, 5)
    visit edit_user_path(user)
    expect(page).to have_content user.name

    fill_in 'user[name]',     with: user.name
    fill_in 'user[city]',     with: user.city
    fill_in 'user[email]',    with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[facebook]', with: user.facebook
    fill_in 'user[twitter]',  with: user.twitter
    check   'kitchen_1'
    check   'kitchen_2'

    click_on 'submit'

    expect(page).to have_content user.name
    expect(page).to have_content user.city
  end

  scenario 'try to edit another user profile' do
    user = login
    create_list(:kitchen, 5)
    visit edit_user_path(create(:user))
    expect(page).to have_content user.name

    fill_in 'user[name]',     with: user.name
    fill_in 'user[city]',     with: user.city
    fill_in 'user[email]',    with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[facebook]', with: user.facebook
    fill_in 'user[twitter]',  with: user.twitter
    check   'kitchen_1'

    click_on 'submit'

    expect(page).to have_content user.name
    expect(page).to have_content user.city
  end
end
