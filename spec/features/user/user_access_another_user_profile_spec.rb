require 'rails_helper'

feature 'User access another user profile' do
  scenario 'successfully' do
    user = create(:user)
    recipes = create_list(:recipe, 5, user: user)

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.city
    expect(page).to have_content recipes[0].name
    expect(page).to have_content recipes[4].name

    expect(page).to_not have_content I18n.t('generic.facebook')
    expect(page).to_not have_content I18n.t('generic.twitter')
  end

  scenario 'has faceboook' do
    user = create(:user, facebook: 'facebook')
    href = 'https://www.facebook.com/facebook'

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.city

    expect(page).to have_content I18n.t('generic.facebook')
    expect(page).to have_selector "a[href='#{href}']", text: I18n.t('generic.facebook')
    expect(page).to_not have_content I18n.t('generic.twitter')


  end

  scenario 'has twitter' do
    user = create(:user, twitter: 'twitter')
    href = 'https://www.twitter.com/twitter'

    visit user_path(user)

    expect(page).to have_content user.name
    expect(page).to have_content user.city

    expect(page).to_not have_content I18n.t('generic.facebook')
    expect(page).to have_content I18n.t('generic.twitter')
    expect(page).to have_selector "a[href='#{href}']", text: I18n.t('generic.twitter')
  end
end
